//
//  VRQuestion.m
//  DynamicQuestionnaire
//
//  Created by Richard Warrender on 14/03/2014.
//  Copyright (c) 2014 Vivid Reflection. All rights reserved.
//

#import "VRQuestion.h"

@implementation VRQuestion

- (id)initWithJSON:(NSDictionary *)dict
{
    if (self = [super init]) {
        self.identifier = (NSString *) dict[@"identifier"];
        self.text = (NSString *) dict[@"text"];
    }
    return self;
}

@end
