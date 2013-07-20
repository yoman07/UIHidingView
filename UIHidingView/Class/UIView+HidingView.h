//
//  UIView+HidingView.h
//  UIHidingView
//
//  Created by Roman Barzyczak on 20.07.2013.
//  Copyright (c) 2013 yoman07. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (HidingView)

@property (nonatomic) NSInteger startContentOffset;
@property (nonatomic) NSInteger lastContentOffset;

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView;
- (void)scrollViewDidScroll:(UIScrollView *)scrollView;

@end
