//
//  VRQuestionnaire.m
//  DynamicQuestionnaire
//
//  Created by Richard Warrender on 14/03/2014.
//  Copyright (c) 2014 Vivid Reflection. All rights reserved.
//

#import "VRQuestionnaire.h"
#import "VRAnswer.h"

@implementation VRQuestionnaire

- (id)initWithFile:(NSString *)filePath
{
    if (self = [super init]) {
        self.questions = [NSMutableDictionary dictionary];
        [self loadWithFile:filePath];
    }
    return self;
}

// Private, hidden from interface
- (void)loadWithFile:(NSString *)filePath
{
    NSData *questionnaireData = [NSData dataWithContentsOfFile:filePath];
    NSError *jsonError = nil;
    NSArray *questionsData = [NSJSONSerialization JSONObjectWithData:questionnaireData options:0 error:&jsonError];
    if  (jsonError != nil) {
        NSLog(@"Can't read JSON file '%@' because %@.", filePath, jsonError);
        abort();
    }
    
    // Set up questions, ignore next question JSON for now. We put each question in a lookup table (self.questions).
    for (NSDictionary *questionData in questionsData) {
        VRQuestion *question = [[VRQuestion alloc] initWithJSON:questionData];
        [self.questions setObject:question forKey:question.identifier];
        
        // Setup the first question
        if (self.firstQuestion == nil) {
            self.firstQuestion = question;
        }
    }
    
    // Now run through and link questions
    for (NSDictionary *questionData in questionsData) {
        VRQuestion *question = (VRQuestion *) [self questionWithIdentifier:questionData[@"identifier"]];
        question.nextNoQuestion = [self questionWithIdentifier:questionData[@"no"]];
        question.nextYesQuestion = [self questionWithIdentifier:questionData[@"yes"]];
    }
}

// More for readability 
- (VRQuestion *)questionWithIdentifier:(NSString *)ident
{
    return [self.questions objectForKey:ident];
}

// Set up a linked-list queue with a pointer for the first answer and the last answer.
- (void)pushAnswerResult:(BOOL)result forQuestion:(VRQuestion *)question
{
    VRAnswer *answer = [[VRAnswer alloc] initWithQuestion:question andResult:result];
    
    if (self.firstAnswer == nil) {
        self.firstAnswer = answer;
        self.lastAnswer = answer;
    } else {
        self.lastAnswer.nextAnswer = answer;
        self.lastAnswer = answer;
    }
}

// Walk along answer linked list to print out all the results.
- (void)logAnswers
{
    // Walk along answers until nextAnswer is nil (linked-list style ;-))
    NSUInteger i = 0;
    
    NSLog(@"Answers for questionnaire:\n");
    VRAnswer *currentAnswer = self.firstAnswer;
    while (currentAnswer != nil)
    {
        NSString *text = [NSString stringWithFormat:@"Answer %lu: %@|%@: %@\n",
                          (unsigned long)i+1,
                          [currentAnswer.question.identifier uppercaseString],
                          currentAnswer.question.text,
                          (currentAnswer.result ? @"yes" : @"no") ];
        printf("%s", [text UTF8String]);
        
        currentAnswer = currentAnswer.nextAnswer;
        i++;
    }
}

@end
