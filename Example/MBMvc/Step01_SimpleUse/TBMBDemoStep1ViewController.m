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
// Created by <a href="mailto:wentong@taobao.com">文通</a> on 13-1-16 上午10:52.
//


#import "TBMBDemoStep1ViewController.h"
#import "TBMBDemoStep1View.h"
#import "TBMBBind.h"
#import "TBMBDefaultRootViewController+TBMBProxy.h"


@interface TBMBDemoStep1ViewController () <TBMBDemoStep1Delegate>
@property(nonatomic, copy) NSString *alertText;
@end

@implementation TBMBDemoStep1ViewController

- (void)loadView {
    [super loadView];
    TBMBDemoStep1View *navView = [[TBMBDemoStep1View alloc] initWithFrame:self.view.bounds withViewDO:nil];
    navView.delegate = self.proxyObject;
    [self.view addSubview:navView];
    //这里做一次绑定 当alertText改变时 调用的逻辑
    TBMBBindObjectWeak(tbKeyPath(self, alertText), navView, ^(TBMBDemoStep1View *host, id old, id new) {
        if (old != [TBMBBindInitValue value]) {
            [host alert:new];
        }
    }
    );
}

- (void)showTime {
    self.alertText = [NSString stringWithFormat:@"现在时间:%@", [NSDate date]];
}


@end