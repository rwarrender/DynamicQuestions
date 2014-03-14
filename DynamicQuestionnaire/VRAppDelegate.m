//
//  VRAppDelegate.m
//  DynamicQuestionnaire
//
//  Created by Richard Warrender on 14/03/2014.
//  Copyright (c) 2014 Vivid Reflection. All rights reserved.
//

#import "VRAppDelegate.h"
#import "VRQuestionViewController.h"

@implementation VRAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.qnaire = [[VRQuestionnaire alloc] initWithFile:[[NSBundle mainBundle] pathForResource:@"set1"
                                                                                        ofType:@"json"]];
    
    self.navController = (UINavigationController *)self.window.rootViewController;
    [self prepareForQuestion:self.qnaire.firstQuestion animated:NO];
    
    return YES;
}

/* Set up the question view controller with a question and push onto the nav stack
 */
- (void)prepareForQuestion:(VRQuestion *)question animated:(BOOL)animated;
{
    VRQuestionViewController *qvc = (VRQuestionViewController *)[self.navController.storyboard instantiateViewControllerWithIdentifier:@"QuestionViewController"];
    qvc.delegate = self;
    
    qvc.question = question;
    [self.navController pushViewController:qvc animated:animated];
}

/* Delegate that gets called every time a question is answered. This loads the next question and pushes it onto the nav stack.
 It also pushes a pointer to the question and result to a linked-list called firstAnswer->nextAnswer->nextAnswer, etc.
 
 When the next question returns nil we know we've finished as there are no more questions and log linked-list to console.
 */
- (void)questionViewController:(VRQuestionViewController *)controller didAnswerQuestion:(VRQuestion *)question withResult:(BOOL)result
{
    VRQuestion *nextQuestion = nil;
    
    if (result == YES) {
        nextQuestion = question.nextYesQuestion;
    } else if (result == NO) {
        nextQuestion = question.nextNoQuestion;
    }
    [self.qnaire pushAnswerResult:result forQuestion:question];
    
    // Handle no more questions
    if(nextQuestion) {
        [self prepareForQuestion:nextQuestion animated:YES];
        
    } else {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Complete"
                                                            message:@"You completed the questionnaire"
                                                           delegate:nil
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil];
        [alertView show];
        [self.qnaire logAnswers];
    }
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
