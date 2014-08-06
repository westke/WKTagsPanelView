//
//  WKTagsPanelView.m
//  WKTagPanelViewDemo
//
//  Created by westke on 14-8-6.
//  Copyright (c) 2014年 westke. All rights reserved.
//

#import "WKTagsPanelView.h"
#import <ReactiveCocoa/ReactiveCocoa.h>
@interface WKTagsPanelView()
{
    UILabel *_titleLabel;
    UILabel *_subTitleLabel;
}
@property (nonatomic, strong) NSMutableArray *statusArray;
@end
@implementation WKTagsPanelView

- (id)initWithFrame:(CGRect)frame title:(NSString *)title subTitle:(NSString *)subtitle tags:(NSArray *)tagsArray
{
    self = [super initWithFrame:frame];
    if (self) {
        _statusArray = [NSMutableArray array];
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, 5, 75, 35)];
        
        _titleLabel.text = title;
        _titleLabel.textAlignment = NSTextAlignmentLeft;
        _titleLabel.textColor = [UIColor blackColor];
        [self addSubview:_titleLabel];
        if (subtitle != nil) {
            _subTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(80, 5, 200, 35)];
            _subTitleLabel.textColor = [UIColor grayColor];
            _subTitleLabel.textAlignment = NSTextAlignmentLeft;
            _subTitleLabel.text = subtitle;
            [self addSubview:_subTitleLabel];
        }
        if (tagsArray!=nil && tagsArray.count != 0) {
            for (int i = 0; i < tagsArray.count; i++) {
                [_statusArray addObject:@(NO)];
                UIButton *tagButton = [UIButton buttonWithType:UIButtonTypeCustom];
                tagButton.frame = CGRectMake(8+i%4*78, 45+i/4*35, 70, 30);
                [tagButton setTitleColor:[UIColor colorWithRed:116.0/255 green:116.0/255 blue:116.0/255 alpha:1] forState:UIControlStateNormal];
                [tagButton setTitle:tagsArray[i] forState:UIControlStateNormal];
                tagButton.tag = 1000+i;
                tagButton.titleLabel.font = [UIFont systemFontOfSize:15];
                tagButton.titleLabel.textAlignment = NSTextAlignmentLeft;
                [tagButton setBackgroundImage:[UIImage imageNamed:@"tag_normal.png"]
                                     forState:UIControlStateNormal];
                [self addSubview:tagButton];
                tagButton.rac_command = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(UIButton *button) {
                    
                    if ([_statusArray[button.tag-1000] isEqual:@(NO)]) {
                        [button setBackgroundImage:[UIImage imageNamed:@"tag_highLight.png"]
                                             forState:UIControlStateNormal];
                        if ([_delegate respondsToSelector:@selector(WKTagsPanelView:didSelectItemAtIndexPath:)]) {
                            [_delegate WKTagsPanelView:self didSelectItemAtIndexPath:button.tag - 1000];
                        }
                    }else{
                        [button setBackgroundImage:[UIImage imageNamed:@"tag_normal.png"]
                                             forState:UIControlStateNormal];
                        if ([_delegate respondsToSelector:@selector(WKTagsPanelView:didDeSelectItemAtIndexPath:)]) {
                            [_delegate WKTagsPanelView:self didDeSelectItemAtIndexPath:button.tag - 1000];
                        }
                    }
                    
                    [_statusArray replaceObjectAtIndex:button.tag - 1000 withObject:@(![_statusArray[button.tag - 1000] boolValue])];
                    return [RACSignal empty];
                }];
            }
        }

    }
    return self;
}



@end
