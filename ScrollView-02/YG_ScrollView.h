//
//  YG_ScrollView.h
//  ScrollView-02
//
//  Created by 张洋 on 25/09/2017.
//  Copyright © 2017 张洋. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol YG_ScrollViewDelegate <NSObject>

// 返回总共有几个子视图
- (NSInteger)totalItems;

// 返回资源名称或链接
- (NSString *)nameForItem:(NSInteger)index;

@end

@interface YG_ScrollView : UIScrollView<UIScrollViewDelegate>

@property (nonatomic, weak) id<YG_ScrollViewDelegate>yg_delegate;

@end
