//
//  StatuseModel.m
//  iOSExample
//
//  Created by maintoco on 16/12/20.
//  Copyright © 2016年 maintoco. All rights reserved.
//

#import "StatuseModel.h"

@implementation StatuseModel

+ (NSDictionary *)keyMappingDictionary {
    return @{@"wid":@"id",
             @"visible":@"visible.type",
             @"listid":@"visible.list_id"};
}

/*+ (NSArray *)allowedPropertyNames {
    return @[@"visible",@"listid"];
}*/

@end
