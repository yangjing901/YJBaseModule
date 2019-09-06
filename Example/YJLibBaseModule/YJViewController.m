//
//  YJViewController.m
//  YJBaseModule
//
//  Created by yangjing901@qq.com on 09/06/2019.
//  Copyright (c) 2019 yangjing901@qq.com. All rights reserved.
//

#import "YJViewController.h"
#import <YJBaseModule/YJBaseModule.h>

@interface YJViewController ()

@property (weak, nonatomic) IBOutlet UIButton *btn;

@end

@implementation YJViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [self.btn setTitle:@"测试" forState:UIControlStateNormal];
    [self.btn setTitleColor:[UIColor yjBlackColor] forState:UIControlStateNormal];
    self.btn.titleLabel.font = [UIFont yjSemiboldFontOfSize:15];
    
    [self.btn setImage:[UIImage imageNamed:@"course_info_video_play"] forState:UIControlStateNormal];
    
    [self.btn yjLayoutButtonWithStyle:YJButtonLayerStyleVerticalImageUp space:10];
    
}
- (IBAction)clickAction:(UIButton *)sender {
    [sender yjStartAnimation];
    
    NSLog(@"yangjing_test: %@", [NSString yjStringForDays:7]);
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [sender yjStopAnimation];
    });
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
