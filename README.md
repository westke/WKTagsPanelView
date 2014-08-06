WKTagsPanelView
===============

=======
In some projects, we need to select  several tags for a  certain person.

WKTagsPanelView provides a  solution to the problem。   
How to use:
>NSString *title = @"title";  
NSString  *subtitle = @"subtitle";  
WKTagsPanelView * tagsPanelView = [[WKTagsPanelView alloc] initWithFrame:rect withTitle:title  subTitle:subtitle  tags:tagsArray];       
tagsPanelView.delegate = self;  
[self.view addSubview:tagsPanelView];


Your can handle related actions in the two delegate functions:
>-  -(void)WKTagsPanelView:(WKTagsPanelView *)tagsPanelView didSelectItemAtIndexPath:(NSInteger)index;
- -(void)WKTagsPanelView:(WKTagsPanelView *)tagsPanelView didDeSelectItemAtIndexPath:(NSInteger)index;




