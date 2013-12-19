//
//  Checker.h
//  Rogotest
//
//  Created by rost on 09.09.13.
//  Copyright (c) 2013 rost. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Checker : NSObject

+ (Checker *)shared;

- (BOOL) checkName:(NSString *)incStr;
- (BOOL) checkSurName:(NSString *)incStr;
- (BOOL) checkTitle:(NSString *)incStr;
- (BOOL) checkPasswd:(NSString *)incStr;

@end
