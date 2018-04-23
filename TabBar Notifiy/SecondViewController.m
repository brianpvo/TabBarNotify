//
//  SecondViewController.m
//  TabBar Notifiy
//
//  Created by Brian Vo on 2018-04-22.
//  Copyright © 2018 Brian Vo. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()
@property (weak, nonatomic) IBOutlet UILabel *countLabel;

@end

@implementation SecondViewController

-(void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}
-(void)viewWillAppear:(BOOL)animated {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notify:) name:@"stepperNotice" object:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)notify:(NSNotification *)notification {
    NSNumber *stepperValue = [notification.userInfo objectForKey:@"stepperValue"];
    self.countLabel.text = [NSString stringWithFormat:@"%@", stepperValue];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
