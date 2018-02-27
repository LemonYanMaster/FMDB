//
//  Model.h
//  02FMDB(test)
//
//  Created by pengpeng yan on 16/3/16.
//  Copyright © 2016年 peng yan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Model : NSObject

@property(nonatomic,assign)NSInteger number;
@property(nonatomic,strong)NSString *name;
@property(nonatomic,assign)NSInteger age;
- (instancetype)initWithModelName:(NSString *)name number:(NSInteger)number age:(NSInteger)age;
@end
