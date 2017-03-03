//
//  DynaMonRegister.m
//  DynamicModuleDemo
//
//  Created by 任岐鸣 on 2017/1/19.
//  Copyright © 2017年 Ned. All rights reserved.
//

#import "DynaMonRegister.h"

#define className @"demo2"
#define class @"Demo2ModuleViewController"

@implementation DynaMonRegister

+(void)load {
    printf("Framework loaded!\n");
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(RegisterClass) name:@"CanRegisterClass" object:nil];
}

+(void)RegisterClass {
    
    NSDictionary *dic = [[NSDictionary alloc] initWithObjectsAndKeys:class,@"class",className ,@"name", nil];
#if DEBUG
    printf("Start Register Class.\n");
#endif
    [[NSNotificationCenter defaultCenter] postNotificationName:@"RegisterClass" object:nil userInfo:dic];
}

@end
