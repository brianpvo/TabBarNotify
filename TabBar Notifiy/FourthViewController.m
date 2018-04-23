//
//  FourthViewController.m
//  TabBar Notifiy
//
//  Created by Brian Vo on 2018-04-22.
//  Copyright © 2018 Brian Vo. All rights reserved.
//

#import "FourthViewController.h"
#import "CustomView.h"

@interface FourthViewController ()
@property (weak, nonatomic) IBOutlet UIView *yellowView;
@property (weak, nonatomic) IBOutlet CustomView *whiteView;
@property (nonatomic) UIPanGestureRecognizer *panGesture;

@end

@implementation FourthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.whiteView addObserver:self forKeyPath:@"point" options:NSKeyValueObservingOptionNew context:nil];
    
    self.panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panMove:)];
    [self.whiteView addGestureRecognizer:self.panGesture];
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    NSLog(@"change %@", change);
    if ([keyPath isEqualToString:@"point"]) {
        id value = change[NSKeyValueChangeNewKey];
        NSLog(@"val %@", value);
        NSValue *valueCast = (NSValue *)value;
        CGPoint point = valueCast.CGPointValue;
        NSLog(@"point %@", NSStringFromCGPoint(point));
        
        CGFloat yellowX = self.yellowView.center.x;
        CGFloat yellowY = self.yellowView.center.y;
        
        yellowX += point.x;
        yellowY += point.y;
        
        CGPoint newCenter = CGPointMake(yellowX, yellowY);
        self.yellowView.center = newCenter;
        
        
    }
}

-(void)panMove:(UIPanGestureRecognizer *)sender {
    CGPoint locationInView = [sender locationInView:self.whiteView];
    [self.whiteView setPoint:locationInView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
