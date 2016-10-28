//
//  ViewController.m
//  ios进阶  lx
//
//  Created by lanou on 16/9/19.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "ViewController.h"
#import <CoreData/CoreData.h>
#import "Teacher.h"
#import "AppDelegate.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nametext;
@property (weak, nonatomic) IBOutlet UITextField *agetext;
@property (weak, nonatomic) IBOutlet UITextField *busttaxt;

@property(nonatomic,strong)NSManagedObjectContext  *context;

@end

@implementation ViewController
- (IBAction)Add:(id)sender {
    NSEntityDescription *teadesc = [NSEntityDescription entityForName:@"Teacher" inManagedObjectContext:self.context];
    Teacher *tea = [[Teacher alloc]initWithEntity:teadesc insertIntoManagedObjectContext:self.context];
    tea.name = self.nametext.text;
    tea.age = @([self.agetext.text integerValue]);
    tea.bust = @([self.busttaxt.text integerValue]);
    
    
    NSError  *error = nil;
    [self.context save:&error];
    
    
}
- (IBAction)Delete:(id)sender {
}
- (IBAction)cz:(id)sender {
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //1.//创建数据库的上下文
    NSManagedObjectContext *context = [[NSManagedObjectContext alloc]initWithConcurrencyType:NSMainQueueConcurrencyType];
    
    
    //2.//获取模型文件的URL
    //模型文件编译后，变成momd文件
    NSURL *modelUrl = [[NSBundle mainBundle] URLForResource:@"Teacher" withExtension:@"momd"];
    
    //3. //模型文件对象
    NSManagedObjectModel *model = [[NSManagedObjectModel alloc]initWithContentsOfURL:modelUrl];
    
    //4.//创建持久化对象
    NSPersistentStoreCoordinator *store = [[NSPersistentStoreCoordinator alloc]initWithManagedObjectModel:model];
    
    //获取数据文件存储位置
    NSString *docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)firstObject];
    docPath = [docPath stringByAppendingPathComponent:@"Teacher.sqlite"];
    NSLog(@"%@",docPath);
    NSURL *fileUrl = [NSURL fileURLWithPath:docPath];
    
    //5.//配置持久化对象（文件类型，文件地址）
    [store addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:fileUrl options:nil error:nil];
    
    
    context.persistentStoreCoordinator =store;
    
    self.context = context;

    
    
    
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    // Dispose of any resources that can be recreated.
}

@end
