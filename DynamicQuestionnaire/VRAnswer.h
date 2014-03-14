//
//  VRAnswer.h
//  DynamicQuestionnaire
//
//  Created by Richard Warrender on 14/03/2014.
//  Copyright (c) 2014 Vivid Reflection. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VRQuestion.h"

@interface VRAnswer : NSObject

@property (nonatomic, weak) VRQuestion *question;
@property (nonatomic, strong) NSDate *date;
@property (nonatomic, assign) BOOL result;

@property (nonatomic, strong) VRAnswer *nextAnswer;

- (id)initWithQuestion:(VRQuestion *)question andResult:(BOOL)result;

@end
