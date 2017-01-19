//
//  DynaMonRegister.m
//  DynamicModuleDemo
//
//  Created by 任岐鸣 on 2017/1/19.
//  Copyright © 2017年 Ned. All rights reserved.
//

#import "DynaMonRegister.h"

@implementation DynaMonRegister

+(void)load {
    printf("Framework loaded!\n");
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(RegisterClass) name:@"CanRegisterClass" object:nil];
}

+(void)RegisterClass {
    static NSString *className = @"demo";
    static NSString *class = @"DemoModuleViewController";
    
    NSDictionary *dic = [[NSDictionary alloc] initWithObjectsAndKeys:class,@"class",className ,@"name", nil];
    printf("Start Register Class.");
    [[NSNotificationCenter defaultCenter] postNotificationName:@"RegisterClass" object:nil userInfo:dic];
}

@end
