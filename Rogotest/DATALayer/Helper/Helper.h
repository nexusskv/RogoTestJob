//
//  Helper.h
//  VirtualHealth
//
//  Created by rost on 26.05.13.
//  Copyright (c) 2013 rost. All rights reserved.
//



#import <Foundation/Foundation.h>

@interface Helper : NSObject

+ (Helper *)shared;

- (NSLineBreakMode) getBreakModeByiOSVersFromTag:(NSUInteger)modeTag;
- (NSTextAlignment) getTextAlignByiOSVersFromTag:(NSUInteger)alignTag;

- (BOOL) isEmpty:(NSString *)checkStr;

- (NSString *)encodeString:(NSString *)incStr;
@end
