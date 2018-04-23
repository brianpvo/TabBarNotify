//
//  ThirdViewController.m
//  TabBar Notifiy
//
//  Created by Brian Vo on 2018-04-22.
//  Copyright © 2018 Brian Vo. All rights reserved.
//

#import "ThirdViewController.h"

@interface ThirdViewController ()
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomConstraint;
@property (nonatomic, readonly) CGFloat oldConstraint;
@property (weak, nonatomic) IBOutlet UITextField *textField;

@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.textField.keyboardType = UIKeyboardTypeDefault;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidChange:) name:UIKeyboardDidChangeFrameNotification object:nil];
    
    _oldConstraint = self.bottomConstraint.constant;
}

-(void)keyboardDidChange:(NSNotification *)notification {
    NSValue *value = notification.userInfo[UIKeyboardFrameEndUserInfoKey];
    CGRect rect = value.CGRectValue;
    
    CGFloat yPos = rect.origin.y;
    CGFloat viewHeight = self.view.bounds.size.height;
    
    if (yPos == viewHeight) {
        self.bottomConstraint.constant = self.oldConstraint;
    } else {
        self.bottomConstraint.constant = viewHeight - yPos;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch * touch = [touches anyObject];
    if(touch.phase == UITouchPhaseBegan) {
        [self.textField resignFirstResponder];
    }
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
