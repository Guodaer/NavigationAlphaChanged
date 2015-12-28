//
//  ViewController.m
//  NavChangeAlpha
//
//  Created by xiaoyu on 15/12/16.
//  Copyright © 2015年 guoda. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UIView *topView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    _topView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 20)];
    _topView.backgroundColor = [UIColor redColor];
    [self.view addSubview:_topView];
    

    _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 44)];
    _imageView.backgroundColor = [UIColor redColor];
    _imageView.alpha = 1;
    [self.navigationController.navigationBar addSubview:_imageView];

    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"alpha0"] forBarMetrics:UIBarMetricsDefault];

    //去掉导航下面的线的
     self.navigationController.navigationBar.shadowImage = [[UIImage alloc] init];

    
    self.navigationItem.title = @"hello dayu";
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, self.view.frame.size.height*2)];
    _tableView.backgroundColor = [UIColor yellowColor];
    [self.tableView addObserver: self forKeyPath: @"contentOffset" options: NSKeyValueObservingOptionNew context: nil];

    [self.view addSubview:_tableView];
}
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    CGFloat offset = self.tableView.contentOffset.y;
    NSLog(@"%lf",offset);
//        CGFloat delta = offset / 64.f + 1.f;
//        delta = MAX(0, delta);
    if (offset >= 0) {
        CGFloat delta = MIN(1, 1 - ((50 + 64 - offset) / 64));
        
        //    self.navigationController.navigationBar.alpha = MIN(1, delta);
        _imageView.alpha = MIN(1, delta);
        _topView.alpha = MIN(1, delta);
    }
    else if (offset < -64){
        CGFloat delta = -offset / 64.f - 1;
        delta = MAX(0, delta);

        _imageView.alpha = MIN(1, delta);
        _topView.alpha = MIN(1, delta);
        
    }
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
