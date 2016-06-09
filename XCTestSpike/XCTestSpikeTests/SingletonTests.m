//
//  SingletonTests.m
//  XCTestSpike
//
//  Created by Weien Wang on 6/9/16.
//  Copyright © 2016 Weien Wang. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "WWWebService.h"

@interface SingletonTests : XCTestCase
@end

@implementation SingletonTests
//thanks to http://iosunittesting.com/testing-singletons/

- (WWWebService*) createUniqueInstance {
    return [[WWWebService alloc] init];
}

- (WWWebService*) getSharedInstance {
    return [WWWebService sharedInstance];
}

#pragma mark - tests
- (void) testSingletonSharedInstanceCreated {
    XCTAssertNotNil([self getSharedInstance]);
}

- (void) testSingletonUniqueInstanceCreated {
    XCTAssertNotNil([self createUniqueInstance]);
}

- (void) testSingletonReturnsSameSharedInstanceTwice {
    WWWebService *ws = [self getSharedInstance];
    XCTAssertEqual(ws, [self getSharedInstance]);
}

- (void)testSingletonSharedInstanceSeparateFromUniqueInstance {
    WWWebService *ws = [self getSharedInstance];
    XCTAssertNotEqual(ws, [self createUniqueInstance]);
}

- (void)testSingletonReturnsSeparateUniqueInstances {
    WWWebService *ws = [self createUniqueInstance];
    XCTAssertNotEqual(ws, [self createUniqueInstance]);
}

@end
