//
//  Model.m
//  02FMDB(test)
//
//  Created by pengpeng yan on 16/3/16.
//  Copyright © 2016年 peng yan. All rights reserved.
//

#import "Model.h"

@implementation Model

- (instancetype)initWithModelName:(NSString *)name number:(NSInteger)number age:(NSInteger)age{
    self = [super init];
    if (self) {
        _name = name;
        _age = age;
        _number = number;
    }
    return self;
}


@end
