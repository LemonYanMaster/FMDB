//
//  DataBaseManager.h
//  02FMDB(test)
//
//  Created by pengpeng yan on 16/3/16.
//  Copyright © 2016年 peng yan. All rights reserved.
//

#import <Foundation/Foundation.h>
@class FMDatabase;
@class Model;

@interface DataBaseManager : NSObject
//管理类
+ (instancetype)shaerManager;

//插入模型数据
- (BOOL)insertModel:(Model *)model;

//删除模型数据 如果 传空 默认会删除表中所有数据
- (BOOL)deleteData:(NSString *)deleteString;

//修改数据 比较少用
- (BOOL)modifyData:(NSString *)modifyString;

//查询数据    如果 传空 默认会查询表中所有数据
- (NSArray *)readData:(NSString *)readString;

@end
