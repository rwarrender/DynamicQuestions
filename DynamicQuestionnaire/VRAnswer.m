//
//  VRAnswer.m
//  DynamicQuestionnaire
//
//  Created by Richard Warrender on 14/03/2014.
//  Copyright (c) 2014 Vivid Reflection. All rights reserved.
//

#import "VRAnswer.h"

@implementation VRAnswer

- (id)initWithQuestion:(VRQuestion *)question andResult:(BOOL)result
{
    if (self = [super init]) {
        self.question = question;
        self.result = result;
        self.date = [NSDate date];
    }
    return self;
}

- (NSString *)description
{
    NSString *className = NSStringFromClass([self class]);
    return [NSString stringWithFormat:@"<%@: %p %@ - %@>", className, self, self.question.identifier, (self.result ? @"yes": @"no")];
}

@end
