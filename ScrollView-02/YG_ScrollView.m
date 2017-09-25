//
//  YG_ScrollView.m
//  ScrollView-02
//
//  Created by 张洋 on 25/09/2017.
//  Copyright © 2017 张洋. All rights reserved.
//

#import "YG_ScrollView.h"

@implementation YG_ScrollView {
    
    CGFloat originX;
    NSInteger current;
    NSInteger totalCount;
}

- (instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        self.frame = frame;
        self.delegate = self;
        self.pagingEnabled = YES;
        self.contentSize = CGSizeMake(3 * CGRectGetWidth(frame), CGRectGetHeight(frame));
        [self setContentOffset:CGPointMake(CGRectGetWidth(self.bounds), 0)];
    }
    return self;
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    
    if (originX<scrollView.contentOffset.x) { // 右移
        current ++;
        if (current == totalCount) {
            current = 0;
        }
    }else {
        current --;
        if (current < 0) {
            current = totalCount-1;
        }
    }
    [scrollView setContentOffset:CGPointMake(CGRectGetWidth(self.bounds), 0)];
    originX = scrollView.contentOffset.x;
    [self setIndex:current];
}
- (void)setIndex:(NSInteger)currentIndex {
    
    [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    NSInteger last = currentIndex-1 == -1 ? totalCount-1:currentIndex - 1;
    current = currentIndex;
    NSInteger next = currentIndex + 1 == totalCount ? 0 : currentIndex + 1;
    
    UIImageView *lastIV = [self imageViewByIndex:last];
    CGRect lastF = lastIV.bounds;
    lastF.origin.x = 0;
    lastIV.frame = lastF;
    [self addSubview:lastIV];

    UIImageView *currentIV = [self imageViewByIndex:current];
    CGRect currentF = currentIV.bounds;
    currentF.origin.x = CGRectGetWidth(self.bounds);
    currentIV.frame = currentF;
    [self addSubview:currentIV];

    UIImageView *nextIV = [self imageViewByIndex:next];
    CGRect nextF = nextIV.bounds;
    nextF.origin.x = 2*CGRectGetWidth(self.bounds);
    nextIV.frame = nextF;
    [self addSubview:nextIV];
}

- (UIImageView *)imageViewByIndex:(NSInteger)index {
    
    NSString *name = [self.yg_delegate nameForItem:index];
    UIImageView *imageIV = [[UIImageView alloc] initWithFrame:self.bounds];
    imageIV.image = [UIImage imageNamed:name];
    return imageIV;
}

- (void)layoutScrollView {
    
    [self setIndex:0];
}

- (void)layoutSubviews {
    
    if (totalCount == 0) {
        totalCount = [self.yg_delegate totalItems];
        [self layoutScrollView];
    }
}

@end
