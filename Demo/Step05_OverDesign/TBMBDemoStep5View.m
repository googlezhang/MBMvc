/*
 * (C) 2007-2013 Alibaba Group Holding Limited
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License version 2 as
 * published by the Free Software Foundation.
 *
 *
 */
//
// Created by <a href="mailto:wentong@taobao.com">文通</a> on 13-1-16 下午12:56.
//


#import "TBMBDemoStep5View.h"
#import "TBMBDemoStep5ViewDO.h"
#import "TBMBBind.h"


@implementation TBMBDemoStep5View {
@private
    UITextView *textView;

}
- (void)loadView {
    [super loadView];

    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(50, 40, 200, 30)];
    [button addTarget:self action:@selector(showTime) forControlEvents:UIControlEventTouchUpInside];
    button.backgroundColor = [UIColor blueColor];
    [button setTitle:@"Show Time" forState:UIControlStateNormal];
    [self addSubview:button];

    textView = [[UITextView alloc] initWithFrame:CGRectMake(50, 80, 200, 300)];
    textView.backgroundColor = [UIColor blueColor];
    [self addSubview:textView];
}

- (void)showTime {
    //这里改变了这个值 那么在ViewController里面对这个showTime进行绑定的操作就会被触发
    self.viewDO.showTime = YES;
}

//这里监听 当self.viewDO.alertText被改变时会触发这个操作
TBMBWhenThisKeyPathChange(viewDO, alertText){
    if (!isInit && new) {
        [[[UIAlertView alloc]
                       initWithTitle:@"title"
                             message:new
                            delegate:nil cancelButtonTitle:@"关闭"
                   otherButtonTitles:nil] show];
    }
}

//这里监听 当self.viewDO.log
TBMBWhenThisKeyPathChange(viewDO, log){
    if (new) {
        textView.text = new;
    }
}

- (void)dealloc {
    NSLog(@"dealloc %@", self);

}
@end