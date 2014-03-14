//
//  VRQuestionnaire.h
//  DynamicQuestionnaire
//
//  Created by Richard Warrender on 14/03/2014.
//  Copyright (c) 2014 Vivid Reflection. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VRQuestion.h"

@class VRAnswer;

@interface VRQuestionnaire : NSObject

- (id)initWithFile:(NSString *)filePath;
- (VRQuestion *)questionWithIdentifier:(NSString *)ident;
- (void)pushAnswerResult:(BOOL)result forQuestion:(VRQuestion *)question;
- (void)logAnswers;

@property (nonatomic, strong) NSMutableDictionary *questions;
@property (nonatomic, weak) VRQuestion *firstQuestion;

@property (nonatomic, strong) VRAnswer *firstAnswer;
@property (nonatomic, strong) VRAnswer *lastAnswer;

@end
