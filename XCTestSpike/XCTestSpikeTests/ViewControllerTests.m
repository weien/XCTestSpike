//
//  ViewControllerTests.m
//  XCTestSpike
//
//  Created by Weien Wang on 6/9/16.
//  Copyright © 2016 Weien Wang. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ViewController.h"

@interface ViewControllerTests : XCTestCase
@property (nonatomic, strong) ViewController* vc;
@end

@implementation ViewControllerTests

- (void)setUp {
    [super setUp];
    
    self.vc = [ViewController new];
}

- (void)tearDown {
    self.vc = nil;
    [super tearDown];
}

- (void)testViewControllerSetsTitlesInViewDidLoad {
    [self.vc viewDidLoad];
    XCTAssertNotNil(self.vc.storedTitles);
}

@end
