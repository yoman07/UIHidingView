//
//  UIView+HidingView.m
//  UIHidingView
//
//  Created by Roman Barzyczak on 20.07.2013.
//  Copyright (c) 2013 yoman07. All rights reserved.
//

#import "UIView+HidingView.h"
#import <objc/runtime.h>

#define ANIMATION_HIDE_BUTTONS_TIME 0.2

static char const * const ObjectTagKeyLastContentOffset = "lastContentOffset";
static char const * const ObjectTagKeyStartContentOffset = "startContentOffset";

typedef enum ScrollDirection {
    ScrollDirectionUp,
    ScrollDirectionDown
} ScrollDirection;

@implementation UIView (HidingView)

@dynamic startContentOffset;
@dynamic lastContentOffset;

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    self.startContentOffset = self.lastContentOffset = scrollView.contentOffset.y;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    __block BOOL wasAnimated = NO;
    ScrollDirection scrollDirection = ScrollDirectionDown;
    
    if (self.lastContentOffset > scrollView.contentOffset.y)
        scrollDirection = ScrollDirectionUp;
    
    else {
        scrollDirection = ScrollDirectionDown;
    }
    
    CGFloat currentOffset = scrollView.contentOffset.y;
    CGFloat differenceFromLast = self.lastContentOffset - currentOffset;
    self.lastContentOffset = currentOffset;
    
    if(scrollView.contentOffset.y <= 0 && scrollView.frame.origin.y != self.frame.size.height ) {

                             scrollView.frame = CGRectMake(scrollView.bounds.origin.x,
                                                           self.frame.size.height,
                                                           scrollView.bounds.size.width,
                                                           scrollView.bounds.size.height
                                                           - self.frame.size.height);
                             
                             
                             self.frame = CGRectMake(self.bounds.origin.x,
                                                                         self.bounds.origin.y,
                                                                         self.bounds.size.width,
                                                                         self.bounds.size.height);
                             wasAnimated = YES;
        
    } else if(scrollView.contentOffset.y > 0 && scrollView.frame.origin.y != 0){

                             scrollView.frame = CGRectMake(scrollView.bounds.origin.x,
                                                      0,
                                                      scrollView.bounds.size.width,
                                                      scrollView.bounds.size.height
                                                           +  self.frame.size.height); //minus because self.currentTableHideY is negative

    }
    
    if((abs(differenceFromLast)>1) && scrollView.isTracking && !wasAnimated ) {
        if(scrollDirection == ScrollDirectionDown) {
            [UIView animateWithDuration:ANIMATION_HIDE_BUTTONS_TIME
                             animations:^{
                                 self.frame = CGRectMake(self.frame.origin.x,
                                                                             - self.bounds.size.height*2,
                                                                             self.bounds.size.width,
                                                                             self.bounds.size.height);
                             }];
        } else {
            [UIView animateWithDuration:ANIMATION_HIDE_BUTTONS_TIME
                             animations:^{
                                 self.frame = CGRectMake(self.bounds.origin.x,
                                                                             self.bounds.origin.y,
                                                                             self.bounds.size.width,
                                                                             self.bounds.size.height);
                             }];
        }
    }
}


- (NSInteger)startContentOffset {
    return [objc_getAssociatedObject(self, ObjectTagKeyStartContentOffset) integerValue];
}

- (void)setStartContentOffset:(NSInteger)newObjectTag {
    objc_setAssociatedObject(self, ObjectTagKeyStartContentOffset, @(newObjectTag), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSInteger)lastContentOffset {
    return [objc_getAssociatedObject(self, ObjectTagKeyLastContentOffset) integerValue];
}

- (void)setLastContentOffset:(NSInteger)newObjectTag {
    objc_setAssociatedObject(self, ObjectTagKeyLastContentOffset, @(newObjectTag), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
