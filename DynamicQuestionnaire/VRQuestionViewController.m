//
//  VRQuestionViewController.m
//  DynamicQuestionnaire
//
//  Created by Richard Warrender on 14/03/2014.
//  Copyright (c) 2014 Vivid Reflection. All rights reserved.
//

#import "VRQuestionViewController.h"

@interface VRQuestionViewController ()

@end

@implementation VRQuestionViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.label.text = self.question.text;
    self.title = [self.question.identifier uppercaseString];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)yesPressed:(id)sender
{
    if (self.delegate != nil) {
        if ([self.delegate respondsToSelector:@selector(questionViewController:didAnswerQuestion:withResult:)]) {
            [self.delegate questionViewController:self didAnswerQuestion:self.question withResult:YES];
        }
    }
}

- (IBAction)noPressed:(id)sender
{
    if (self.delegate != nil) {
        if ([self.delegate respondsToSelector:@selector(questionViewController:didAnswerQuestion:withResult:)]) {
            [self.delegate questionViewController:self didAnswerQuestion:self.question withResult:NO];
        }
    }
}

@end
