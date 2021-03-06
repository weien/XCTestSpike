//
//  ViewController.m
//  XCTestSpike
//
//  Created by Weien Wang on 6/8/16.
//  Copyright © 2016 Weien Wang. All rights reserved.
//

#import "ViewController.h"
#import "WWWebService.h"

@interface ViewController ()
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.storedTitles = [NSArray array];
    
    [[WWWebService sharedInstance] questionTitlesIncludingSearchTerm:@"pizza" withCallback:^(NSArray *titles) {
        self.storedTitles = titles;
    }];
}

@end
