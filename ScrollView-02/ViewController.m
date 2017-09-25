//
//  ViewController.m
//  ScrollView-02
//
//  Created by 张洋 on 25/09/2017.
//  Copyright © 2017 张洋. All rights reserved.
//

#import "ViewController.h"

#import "YG_ScrollView.h"

@interface ViewController ()<YG_ScrollViewDelegate>

@end

@implementation ViewController {
    
    NSArray *imgs;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    YG_ScrollView *sc = [[YG_ScrollView alloc] initWithFrame:CGRectMake(0, 0, 320, 568)];
    sc.yg_delegate = self;
    [self.view addSubview:sc];
    imgs = @[@"1",@"2",@"3",@"4",@"5"];
}

- (NSInteger)totalItems {
    
    return imgs.count;
}

- (NSString *)nameForItem:(NSInteger)index {
    
    return imgs[index];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
