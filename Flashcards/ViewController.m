//
//  ViewController.m
//  Flashcards
//
//  Created by Herman Schaaf on 1/7/14.
//  Copyright (c) 2014 Herman Schaaf. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *textView;
@property (strong, nonatomic) IBOutlet UISwipeGestureRecognizer *swipeLeftRecognizer;
@property (strong, nonatomic) IBOutlet UISwipeGestureRecognizer *swipeRightRecognizer;
@property (strong, nonatomic) IBOutlet UISwipeGestureRecognizer *swipeUpRecognizer;
@property (strong, nonatomic) IBOutlet UISwipeGestureRecognizer *swipeDownRecognizer;

@end

@implementation ViewController

@synthesize textView;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
	[self.view addGestureRecognizer:self.swipeLeftRecognizer];
    [self.view addGestureRecognizer:self.swipeRightRecognizer];
    [self.view addGestureRecognizer:self.swipeDownRecognizer];
    [self.view addGestureRecognizer:self.swipeUpRecognizer];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark Responding to gestures

/*
 In response to a swipe gesture, move the text to where we found it.
 */
- (IBAction)showGestureForSwipeRecognizer:(UISwipeGestureRecognizer *)recognizer {
    
	CGPoint location = [recognizer locationInView:self.view];
    
    self.textView.center = location;
    self.textView.alpha = 1.0;
    
    switch (recognizer.direction) {
        case UISwipeGestureRecognizerDirectionLeft:
            self.textView.text = @"left!";
            break;
        case UISwipeGestureRecognizerDirectionRight:
            self.textView.text = @"right!";
            break;
        case UISwipeGestureRecognizerDirectionUp:
            self.textView.text = @"up!";
            break;
        case UISwipeGestureRecognizerDirectionDown:
            self.textView.text = @"down!";
            break;
        default:
            break;
    }
    
    NSLog(@"Text View Value = %@", self.textView.text);
    
	[UIView animateWithDuration:0.5 animations:^{
        self.textView.alpha = 0.0;
    }];
}


@end
