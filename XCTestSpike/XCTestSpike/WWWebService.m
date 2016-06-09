//
//  WWWebService.m
//  XCTestSpike
//
//  Created by Weien Wang on 6/9/16.
//  Copyright © 2016 Weien Wang. All rights reserved.
//

#import "WWWebService.h"

@implementation WWWebService

+ (instancetype)sharedInstance {
    static dispatch_once_t onceToken = 0;
    
    __strong static id _sharedObject = nil;
    dispatch_once(&onceToken, ^{
        _sharedObject = [[self alloc] init];
    });
    return _sharedObject;
}

@end
