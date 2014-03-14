//
//  VRAppDelegate.h
//  DynamicQuestionnaire
//
//  Created by Richard Warrender on 14/03/2014.
//  Copyright (c) 2014 Vivid Reflection. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VRQuestionnaire.h"
#import "VRQuestionViewController.h"

@interface VRAppDelegate : UIResponder <UIApplicationDelegate, VRQuestionViewControllerDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UINavigationController *navController;
@property (strong, nonatomic) VRQuestionnaire *qnaire;

@end
