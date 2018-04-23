//
//  ViewController.m
//  TabBar Notifiy
//
//  Created by Brian Vo on 2018-04-21.
//  Copyright © 2018 Brian Vo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIStepper *stepperButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self stepperButtonClicked:self.stepperButton];

}
- (IBAction)stepperButtonClicked:(UIStepper *)sender {
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"stepperNotice" object:nil userInfo:@{@"stepperValue": [NSNumber numberWithDouble:sender.value]}];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
