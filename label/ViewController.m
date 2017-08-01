//
//  ViewController.m
//  label
//
//  Created by pro on 16/9/22.
//  Copyright © 2016年 chenzhigang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic) NSTimer * timer;
@property (strong, nonatomic) NSTimer * timer2;
@property (strong, nonatomic) UIImageView * imageView;


@property (strong, nonatomic) UITableView * myTable;
@property (strong, nonatomic) NSMutableArray * dataArray;




@end

@implementation ViewController


-(void)openSwitch:(UISwitch *)sender{
    
    if (sender.on) {
        NSLog(@"开");
    }else{
        NSLog(@"关");
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];

    
    UISwitch * openSwitch = [[UISwitch alloc]initWithFrame:CGRectMake(10, 4, 0, 0)];
    [openSwitch addTarget:self action:@selector(openSwitch:) forControlEvents:uicon];
    
    
    [self.view  addSubview:openSwitch];
    
    return;
    
    
    
    
    
    
    
    
    
    
    
    self.view.backgroundColor = [UIColor blueColor];
    NSData *data = [NSData dataWithContentsOfFile: [[NSBundle mainBundle] pathForResource:@"001" ofType:@"gif"]];
    UIWebView *webView = [[UIWebView alloc] initWithFrame:CGRectMake(10, 10, 130, 130)];
    webView.backgroundColor=[UIColor clearColor];
    webView.opaque = NO;
    [webView loadData:data MIMEType:@"image/gif" textEncodingName:nil baseURL:nil];
    [self.view addSubview:webView];
    return;
    
    
    self.myTable = [[UITableView alloc] initWithFrame:CGRectMake(0, 20, 300, 30)];
    //_myTable.userInteractionEnabled = NO;
    _myTable.delegate = self;
    _myTable.dataSource = self;
    [self.view addSubview:_myTable];
    
    self.dataArray = [[NSMutableArray alloc] initWithObjects:@"测试数据1",@"测试数据2",@"测试数据3",@"测试数据4",@"测试数据5",@"测试数据6", nil];
    
    
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(changeUIView) userInfo:nil repeats:YES];
    self.timer2 = [NSTimer scheduledTimerWithTimeInterval:3.0f target:self selector:@selector(gundong) userInfo:nil repeats:YES];

}

int postion = 0;



-(void)gundong{
    postion++;
    if (postion >= self.dataArray.count-1) {
        postion = 0;
        NSIndexPath *scrollIndexPath = [NSIndexPath indexPathForRow:postion inSection:0];
        [self.myTable scrollToRowAtIndexPath:scrollIndexPath atScrollPosition:UITableViewScrollPositionTop animated:NO];
        postion++;
        NSIndexPath *scrollIndexPath1 = [NSIndexPath indexPathForRow:postion inSection:0];
        [self.myTable scrollToRowAtIndexPath:scrollIndexPath1 atScrollPosition:UITableViewScrollPositionTop animated:YES];
        
    }else {
        NSIndexPath *scrollIndexPath = [NSIndexPath indexPathForRow:postion inSection:0];
        [self.myTable scrollToRowAtIndexPath:scrollIndexPath atScrollPosition:UITableViewScrollPositionTop animated:YES];
        
    }
}

- (void)changeUIView{
    [UIView beginAnimations:@"animation" context:nil];
    [UIView setAnimationDuration:1.0f];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:self.imageView cache:YES];
    [UIView commitAnimations];
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 30;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArray.count;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"ceshi"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ceshi"];
    }
    UIImage * bgImg = [UIImage imageNamed:@"1"];
    self.imageView  = [[UIImageView alloc] initWithFrame:CGRectMake(250, 0, 30, 30)];
    _imageView.image = bgImg;
    [cell.contentView addSubview:_imageView];

    cell.textLabel.text = _dataArray[indexPath.row];
    cell.backgroundColor = [UIColor orangeColor];
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
