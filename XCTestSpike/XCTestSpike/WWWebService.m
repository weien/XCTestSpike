//
//  WWWebService.m
//  XCTestSpike
//
//  Created by Weien Wang on 6/9/16.
//  Copyright © 2016 Weien Wang. All rights reserved.
//

#import "WWWebService.h"

@interface WWWebService()
@end

@implementation WWWebService

+ (instancetype)sharedInstance {
    static dispatch_once_t onceToken = 0;
    
    __strong static id _sharedObject = nil;
    dispatch_once(&onceToken, ^{
        _sharedObject = [[self alloc] init];
    });
    return _sharedObject;
}

- (void) questionTitlesIncludingSearchTerm:(NSString*)searchTerm {
    NSString* fullURLString = [@"https://api.stackexchange.com/2.2/search?order=desc&sort=activity&site=stackoverflow&intitle=" stringByAppendingString:searchTerm];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:fullURLString]];
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionTask* task = [session dataTaskWithRequest:request
                                        completionHandler:^(NSData * _Nullable data,
                                                            NSURLResponse * _Nullable response,
                                                            NSError * _Nullable error) {
                                            if (error) {
                                                NSLog(@"Data task error is %@", error);
                                            }
                                            else {
                                                NSDictionary *resultObject = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
                                                NSArray *resultItems = resultObject[@"items"];
                                                NSArray *resultTitles = [resultItems valueForKey:@"title"];
                                                NSLog(@"Result Titles are %@", resultTitles);
                                            }
                                        }];
    [task resume];
    
}

@end
