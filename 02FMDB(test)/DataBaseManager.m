//
//  DataBaseManager.m
//  02FMDB(test)
//
//  Created by pengpeng yan on 16/3/16.
//  Copyright © 2016年 peng yan. All rights reserved.
//

#define dbPath @"contact.sqlite"
#import "DataBaseManager.h"
#import "FMDB.h"
#import "Model.h"
@interface DataBaseManager()
@property (nonatomic,strong)FMDatabase *db;
@end

@implementation DataBaseManager

+ (instancetype)shaerManager{
    static DataBaseManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[DataBaseManager alloc] init];
    });
    return manager;
}

- (instancetype)init{
    self = [super init];
    if (self) {
        //路径
        NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
        NSString *fullPath = [path stringByAppendingPathComponent:dbPath];
        //2.创建数据库实例
        FMDatabase *db = [FMDatabase databaseWithPath:fullPath];
        _db = db ;
        //3.打开数据库
        BOOL isOpen = [db open];
        if (isOpen) {
            NSLog(@"打开成功");
        }else{
            NSLog(@"打开失败");
        }
        //4.创建数据库表
        BOOL isCreate = [_db executeUpdate:@"create table if not exists t_model(number integer primary key autoincrement,name text,age integer)"];
        if (isCreate) {
            NSLog(@"建表成功");
        }else{
            NSLog(@"建表失败");
        }
    }
    return self;
}

//插入模型数据
- (BOOL)insertModel:(Model *)model{
    NSString *insertSql = [NSString stringWithFormat:@"INSERT INTO t_model(name, age, number) VALUES ('%@', '%zd', '%zd');", model.name, model.age, model.number];
    return [_db executeUpdate:insertSql];

//  return  [_db executeUpdate:@"insert into t_model(number,name,age) values (?,?,?)",model.number,model.name,model.age];
}

//删除模型数据 如果传空 默认会删除表中所有数据
- (BOOL)deleteData:(NSString *)deleteString{
    if (deleteString == nil) {
        deleteString = @"delete from t_model";
    }
  return [_db executeUpdate:deleteString];
}

//修改数据 用的不多
- (BOOL)modifyData:(NSString *)modifyString{
    if (modifyString == nil) {
        modifyString = @"update t_model set number = '123'where name = 'lili'";
    }
  return  [_db executeUpdate:modifyString];

}

//查询数据    如果传空 默认会查询表中所有数据
- (NSArray *)readData:(NSString *)readString{
    if (readString == nil) {
        readString = @"select * from t_model";
    }
    NSMutableArray *array = [NSMutableArray array];
    FMResultSet *set = [_db executeQuery:readString];
    while (set.next) {
        NSString *name = [set stringForColumn:@"name"];
        NSInteger age = (NSInteger)[set stringForColumn:@"age"];
        NSInteger number = (NSInteger)[set stringForColumn:@"number"];
        NSLog(@"%@-%ld-%ld",name,age,number);
        Model *model = [[Model alloc] initWithModelName:name number:number age:age];
        [array addObject:model];
    }
    [_db close];
    return array;
    
}






@end
