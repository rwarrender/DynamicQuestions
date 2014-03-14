//
//  VRQuestion.h
//  DynamicQuestionnaire
//
//  Created by Richard Warrender on 14/03/2014.
//  Copyright (c) 2014 Vivid Reflection. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VRQuestion : NSObject

- (id)initWithJSON:(NSDictionary *)dict;
@property (nonatomic, copy) NSString *identifier;
@property (nonatomic, copy) NSString *text;
@property (nonatomic, weak) VRQuestion *nextYesQuestion;
@property (nonatomic, weak) VRQuestion *nextNoQuestion;

@end
