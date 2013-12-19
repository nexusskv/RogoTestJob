//
//  Helper.m
//  VirtualHealth
//
//  Created by rost on 26.05.13.
//  Copyright (c) 2013 rost. All rights reserved.
//

#import "Helper.h"


//! Shared instance
static Helper *sharedInst = nil;


@implementation Helper


#pragma mark - Shared instanse
+ (Helper *)shared
{
	if (sharedInst == nil)
		sharedInst = [[Helper alloc] init];
	
	return sharedInst;
}
#pragma mark -




#pragma mark - getBreakModeByiOSVersion
- (NSLineBreakMode) getBreakModeByiOSVersFromTag:(NSUInteger)modeTag
{
    NSLineBreakMode breakMode = 0;
    
    #if __IPHONE_OS_VERSION_MAX_ALLOWED > __IPHONE_5_1
    //__IPHONE_OS_VERSION_MIN_REQUIRED < __IPHONE_6_0
    {
        switch (modeTag)
        {
            case BREAK_MODE_WORD_WRAP_TAG:
            {
                breakMode   = NSLineBreakByWordWrapping;
            }
                break;
                
            case BREAK_MODE_CHAR_WRAP_TAG:
            {
                breakMode   = NSLineBreakByCharWrapping;
            }
                break;
                
            case BREAK_MODE_CLIP_TAG:
            {
                breakMode   = NSLineBreakByClipping;
            }
                break;
                
            case BREAK_MODE_HEAD_TRUNC_TAG:
            {
                breakMode   = NSLineBreakByTruncatingHead;
            }
                break;
                
            case BREAK_MODE_TAIL_TRUNC_TAG:
            {
                breakMode   = NSLineBreakByTruncatingTail;
            }
                break;
                
            case BREAK_MODE_MIDL_TRUNC_TAG:
            {
                breakMode   = NSLineBreakByTruncatingMiddle;
            }
                break;
        }
    }
    #else
        {
            switch (modeTag)
            {
                case BREAK_MODE_WORD_WRAP_TAG:
                {
                    breakMode   = UILineBreakModeWordWrap;
                }
                    break;
                    
                case BREAK_MODE_CHAR_WRAP_TAG:
                {
                    breakMode   = UILineBreakModeCharacterWrap;
                }
                    break;
                    
                case BREAK_MODE_CLIP_TAG:
                {
                    breakMode   = UILineBreakModeClip;
                }
                    break;
                    
                case BREAK_MODE_HEAD_TRUNC_TAG:
                {
                    breakMode   = UILineBreakModeHeadTruncation;
                }
                    break;
                    
                case BREAK_MODE_TAIL_TRUNC_TAG:
                {
                    breakMode   = UILineBreakModeTailTruncation;
                }
                    break;
                    
                case BREAK_MODE_MIDL_TRUNC_TAG:
                {
                    breakMode   = UILineBreakModeMiddleTruncation;
                }
                    break;
        }
        #endif
    
    return breakMode;
}
#pragma mark - 


#pragma mark - getTextAlignByiOSVersFromTag:
- (NSTextAlignment) getTextAlignByiOSVersFromTag:(NSUInteger)alignTag
{
    NSTextAlignment align = 0;
    
    #if __IPHONE_OS_VERSION_MAX_ALLOWED > __IPHONE_5_1
    //__IPHONE_OS_VERSION_MIN_REQUIRED < __IPHONE_6_0
    {
        switch (alignTag)
        {
            case TEXT_ALIGN_LEFT_TAG:
            {
                align = NSTextAlignmentLeft;
            }
                break;
                
            case TEXT_ALIGN_CENTER_TAG:
            {
                align = NSTextAlignmentCenter;
            }
                break;
                
            case TEXT_ALIGN_RIGHT_TAG:
            {
                align = NSTextAlignmentRight;
            }
                break;
        }
    }
    #else
        {
            switch (alignTag)
            {
                case TEXT_ALIGN_LEFT_TAG:
                {
                    align = UITextAlignmentLeft;
                }
                    break;
                    
                case TEXT_ALIGN_CENTER_TAG:
                {
                    align = UITextAlignmentCenter;
                }
                    break;
                    
                case TEXT_ALIGN_RIGHT_TAG:
                {
                    align = UITextAlignmentRight;
                }
                    break;
            }
        }
        #endif
    
    return align;
}
#pragma mark - 


#pragma mark - Empty checker
- (BOOL) isEmpty:(NSString *)checkStr
{
    BOOL result = TRUE;
    
    if (([checkStr isKindOfClass:[NSString class]]) && (![checkStr isEqual:[NSNull null]]))
    {
        if ((checkStr != nil) && ((checkStr.length > 0) || (![checkStr isEqualToString:@""])))
            result = FALSE;
    }
    return result;
}
#pragma mark -
    

#pragma mark - encodeString:
- (NSString *)encodeString:(NSString *)incStr
{
    return (NSString *)CFURLCreateStringByAddingPercentEscapes( NULL, (CFStringRef)incStr, NULL,
           (CFStringRef)@"йцукенгшщзхъфывапролджэячсмитьЙЦУКЕНГШЩЗХЪФВАПРОЛДЖЭЯЧСМИТБЮ-!*'();:@&=+$,/?%#[]", kCFStringEncodingUTF8);
}
#pragma mark -

@end