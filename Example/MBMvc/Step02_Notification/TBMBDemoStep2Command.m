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
// Created by <a href="mailto:wentong@taobao.com">文通</a> on 13-1-16 上午11:54.
//


#import "TBMBDemoStep2Command.h"
#import "TBMBGlobalFacade.h"


@implementation TBMBDemoStep2Command {

}
+ (void)$$getDate:(id <TBMBNotification>)notification {
    id <TBMBNotification> n = [notification createNextNotificationForSEL:@selector($$receiveDate:)
                                                                withBody:[NSDate date]];
    TBMBGlobalSendTBMBNotification(n);
}

+(void) load {
    [[TBMBGlobalFacade instance] registerCommand:self];
}


@end