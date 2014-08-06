//
//  WKTagsPanelView.h
//  WKTagPanelViewDemo
//
//  Created by westke on 14-8-6.
//  Copyright (c) 2014年 westke. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WKTagsPanelView;

@protocol WKTagsPanelViewDelegate <NSObject>

@optional

- (void)WKTagsPanelView:(WKTagsPanelView *)tagsPanelView didSelectItemAtIndexPath:(NSInteger)index;
- (void)WKTagsPanelView:(WKTagsPanelView *)tagsPanelView didDeSelectItemAtIndexPath:(NSInteger)index;

@end

@interface WKTagsPanelView : UIView

@property (nonatomic, weak) id <WKTagsPanelViewDelegate> delegate;
- (id)initWithFrame:(CGRect)frame title:(NSString *)title
        subTitle:(NSString *)subtitle
        tags:(NSArray *)tagsArray;

@end
