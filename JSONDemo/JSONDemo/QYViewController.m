//
//  QYViewController.m
//  JSONDemo
//
//  Created by qingyun on 15-3-14.
//  Copyright (c) 2015年 hnqingyun.com. All rights reserved.
//

#import "QYViewController.h"

@interface QYViewController ()

@end

@implementation QYViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    NSURL *url = [[NSBundle mainBundle] URLForResource:@"JsonData" withExtension:@"json"];
    
    NSData *data = [NSData dataWithContentsOfURL:url];
    
    // JSON解析 （反序列化）
    id obj = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers|NSJSONReadingMutableLeaves|NSJSONReadingAllowFragments error:nil];
    if ([obj isKindOfClass:[NSMutableArray class]]) {
        NSLog(@"Array!");
    } else if ([obj isKindOfClass:[NSMutableDictionary class]]) {
        NSLog(@"Dictionary!");
    } else {
        NSLog(@"Other!");
    }
    
    NSLog(@"%@", obj);
    
    NSLog(@"0's city:%@", [obj[0] objectForKey:@"City"]);
    
    // 创建 JSON data （序列化）
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:obj options:NSJSONWritingPrettyPrinted error:nil];
    
//    NSLog(@"%@", jsonData);
    NSString *jsonStr = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    NSLog(@"jsonStr:%@", jsonStr);
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
