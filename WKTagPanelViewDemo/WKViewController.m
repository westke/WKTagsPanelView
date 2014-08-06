//
//  WKViewController.m
//  WKTagPanelViewDemo
//
//  Created by westke on 14-8-6.
//  Copyright (c) 2014年 westke. All rights reserved.
//

#import "WKViewController.h"
#import "WKTagsPanelView.h"
@interface WKViewController ()<UIScrollViewDelegate,WKTagsPanelViewDelegate>
{
    UIScrollView *_scrollView;
}
@property (strong, nonatomic) WKTagsPanelView *tagsPanelView;

@end

@implementation WKViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    //用两个来测试一下
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 260, 320, 180)];
    _scrollView.delegate = self;
    _scrollView.bounces = YES;
    _scrollView.showsVerticalScrollIndicator = NO;
    _scrollView.pagingEnabled = YES;
    _scrollView.contentSize = CGSizeMake(320*5, 0);
    [self.view addSubview:_scrollView];
    NSArray *titleArray = @[@"社会名片", @"摄影工具"];
    NSArray *subTitleArray = @[@"说说你是那类人"];
    NSArray *cardArray = @[@"文艺青年", @"有为青年", @"白领", @"学生", @"IT民工", @"自由职业", @"上班族", @"潜力股", @"创业者", @"技术宅", @"小清新", @"月光族", @"乐活族", @"愤青", @"正太", @"小萝莉"];
    NSArray *toolArray = @[@"iPhone", @"佳能", @"索尼", @"诺基亚", @"小米", @"三星", @"尼康", @"哈苏", @"卡西欧", @"松下", @"富士", @"徕卡", @"奥林巴斯", @"宾得", @"理光", @"明基"];
    
    for (int i = 0; i < 2; i++) {
        WKTagsPanelView *tagsPanel = nil;
        if (i < subTitleArray.count) {
            tagsPanel = [[WKTagsPanelView alloc] initWithFrame:CGRectMake(0, 0, 320, CGRectGetHeight(_scrollView.frame)) title:titleArray[i] subTitle:subTitleArray[i] tags:cardArray];
            tagsPanel.delegate = self;
        }else{
            tagsPanel = [[WKTagsPanelView alloc] initWithFrame:CGRectMake(320, 0, 320, CGRectGetHeight(_scrollView.frame)) title:titleArray[i] subTitle:nil tags:toolArray];
            tagsPanel.delegate = self;
        }
        [_scrollView addSubview:tagsPanel];
    }
   
}
#pragma mark - WKTagsPanelViewDelegate
- (void)WKTagsPanelView:(WKTagsPanelView *)tagsPanelView didDeSelectItemAtIndexPath:(NSInteger)index
{
    NSLog(@"-------------");
}

- (void)WKTagsPanelView:(WKTagsPanelView *)tagsPanelView didSelectItemAtIndexPath:(NSInteger)index
{
    NSLog(@"...............");
}
@end
