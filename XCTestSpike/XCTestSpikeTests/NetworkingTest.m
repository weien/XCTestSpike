//
//  NetworkingTest.m
//  XCTestSpike
//
//  Created by Weien Wang on 6/9/16.
//  Copyright © 2016 Weien Wang. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "WWWebService.h"

@interface NetworkingTest : XCTestCase

@end

@implementation NetworkingTest

- (void) testHTTPCallReturnsNotNil {
    XCTestExpectation *expectation = [self expectationWithDescription:@"Wait for NSURLSession task"];
    [[WWWebService sharedInstance] questionTitlesIncludingSearchTerm:@"pie"
                                                        withCallback:^(NSArray *titles) {
                                                            XCTAssertNotNil(titles);
                                                            [expectation fulfill];
                                                        }];
    
    [self waitForExpectationsWithTimeout:5.0 handler:^(NSError * _Nullable error) {
        NSLog(@"testHTTPCall timed out, %@", error);
    }];
}
@end
