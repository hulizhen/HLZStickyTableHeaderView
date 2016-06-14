//
//  UITableView+HLZStickyHeader.m
//  HLZStickyTableHeaderView
//
//  Created by Hu Lizhen on 6/13/16.
//  Copyright © 2016 hulizhen. All rights reserved.
//

#import "UITableView+HLZStickyHeader.h"
#import <objc/runtime.h>

@implementation UITableView (HLZStickyHeader)

static float const TableHeaderViewHeightMin = 220;
static float const TableHeaderViewHeightMax = 320;

#pragma mark - Lifecycle

+ (void)load {
    // Swizzle the `layoutSubviews` method.
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Method originalMethod = class_getInstanceMethod([self class], @selector(layoutSubviews));
        Method swizzledMethod = class_getInstanceMethod([self class], @selector(hlz_layoutSubviews));
        method_exchangeImplementations(originalMethod, swizzledMethod);
    });
}

- (void)hlz_layoutSubviews {
    [self hlz_layoutSubviews];
    
    [self updateTableViewHeader];
}

#pragma mark - Accessors

- (void)setStickyHeaderView:(UIView *)stickyHeaderView {
    objc_setAssociatedObject(self, @selector(stickyHeaderView), stickyHeaderView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    self.stickyHeaderView.clipsToBounds = YES;
    
    // Put scroll view into the top inset of table view.
    // This is exactly the trick to make scroll view stick to the top of view controller.
    [self addSubview:stickyHeaderView];
    self.contentInset = UIEdgeInsetsMake(TableHeaderViewHeightMin, 0, 0, 0);
    self.contentOffset = CGPointMake(0, -TableHeaderViewHeightMin);
}

- (UIView *)stickyHeaderView {
    return objc_getAssociatedObject(self, @selector(stickyHeaderView));
}

// Update the scroll view's height, thus make it stretchable.
- (void)updateTableViewHeader {
    // Stop stretching when the height of table view header is out of range.
    CGFloat contentOffsetX = self.contentOffset.x;
    CGFloat contentOffsetY = self.contentOffset.y > -TableHeaderViewHeightMax ? self.contentOffset.y : -TableHeaderViewHeightMax;
    
    self.contentOffset = CGPointMake(self.contentOffset.x, contentOffsetY);
    self.stickyHeaderView.frame = CGRectMake(contentOffsetX, contentOffsetY, [UIScreen mainScreen].bounds.size.width, -contentOffsetY);
}

@end
