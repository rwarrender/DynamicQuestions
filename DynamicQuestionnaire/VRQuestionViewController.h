//
//  VRQuestionViewController.h
//  DynamicQuestionnaire
//
//  Created by Richard Warrender on 14/03/2014.
//  Copyright (c) 2014 Vivid Reflection. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VRQuestion.h"

@protocol VRQuestionViewControllerDelegate;

@interface VRQuestionViewController : UIViewController

@property (nonatomic, weak) id<VRQuestionViewControllerDelegate> delegate;
@property (nonatomic, strong) VRQuestion *question;
@property (nonatomic, weak) IBOutlet UILabel *label;

- (IBAction)yesPressed:(id)sender;
- (IBAction)noPressed:(id)sender;

@end


@protocol VRQuestionViewControllerDelegate <NSObject>
- (void)questionViewController:(VRQuestionViewController *)controller didAnswerQuestion:(VRQuestion *)question withResult:(BOOL)result;
@end
