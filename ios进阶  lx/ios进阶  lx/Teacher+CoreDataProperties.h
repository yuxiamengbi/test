//
//  Teacher+CoreDataProperties.h
//  ios进阶  lx
//
//  Created by lanou on 16/9/19.
//  Copyright © 2016年 lanou. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Teacher.h"

NS_ASSUME_NONNULL_BEGIN

@interface Teacher (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *name;
@property (nullable, nonatomic, retain) NSNumber *age;
@property (nullable, nonatomic, retain) NSNumber *bust;

@end

NS_ASSUME_NONNULL_END
