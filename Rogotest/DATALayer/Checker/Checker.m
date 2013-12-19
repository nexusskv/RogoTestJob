//
//  Checker.m
//  Rogotest
//
//  Created by rost on 09.09.13.
//  Copyright (c) 2013 rost. All rights reserved.
//

#import "Checker.h"


static Checker *instanse = nil;


@implementation Checker


#pragma mark - shared
+ (Checker *)shared
{
	static dispatch_once_t predicate = 0;
    
	dispatch_once(&predicate, ^{ instanse = [self new]; });
    
	return instanse;
}
#pragma mark -


#pragma mark - checkName:
- (BOOL) checkName:(NSString *)incStr
{
    BOOL resFlag = FALSE;
    
    NSString *charStr = @"йцукенгшщзхъфывапролджэячсмитьЙЦУКЕНГШЩЗХЬФВАПРОЛДЖЭЯЧСМИТБЮ";
    NSArray *charArr = [self setCharsCodesByString:charStr];
    
    NSUInteger compareCount = 0;

    NSInteger incStrCount = incStr.length;
    
    for (int i = 0; i < incStrCount; i++)
    {
        NSInteger length = 0;
        
        NSInteger character = [incStr characterAtIndex:i];
        
        for (int j = 0; j < charStr.length; j++)
        {
            length = [[charArr objectAtIndex:j] intValue];
            
            if (length == character)
            {
                compareCount++;
                break;
            }
        }
    }
    
    if (compareCount == incStrCount)
    {
        resFlag = TRUE;
    }
    
    return resFlag;
}
#pragma mark -


#pragma mark - checkSurName:
- (BOOL) checkSurName:(NSString *)incStr
{
    BOOL resFlag = FALSE;
    
    NSString *charStr = @"йцукенгшщзхфывапролджэячсмитьЙЦУКЕНГШЩЗХЬФВАПРОЛДЖЭЯЧСМИТБЮ-";
    NSArray *charArr = [self setCharsCodesByString:charStr];
    
    NSUInteger compareCount = 0;
    
    NSInteger incStrCount = incStr.length;
    
    for (int i = 0; i < incStrCount; i++)
    {
        NSInteger length = 0;
        
        NSInteger character = [incStr characterAtIndex:i];
        
        for (int j = 0; j < charStr.length; j++)
        {
            length = [[charArr objectAtIndex:j] intValue];
            
            if (length == character)
            {
                compareCount++;
                break;
            }
        }
    }
    
    if (compareCount == incStrCount)
    {
        resFlag = TRUE;
    }
    
    return resFlag;
}
#pragma mark - 


#pragma mark - checkTitle:
- (BOOL) checkTitle:(NSString *)incStr
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[a-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:incStr];
}
#pragma mark -


#pragma mark - checkPasswd:
- (BOOL) checkPasswd:(NSString *)incStr
{
    NSString *emailRegex = @"[abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLKMNOPQRSTUVWXYZ0123456789!@#$%^&*()-=_+]{6,13}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:incStr];
}
#pragma mark - 


#pragma mark - setCharsCodesByString:
- (NSArray *)setCharsCodesByString:(NSString *)charStr
{
    
    NSMutableArray *charMutArr = [NSMutableArray array];
    
    int arrCount = charStr.length;
    
    for (int a = 0; a < arrCount; a++)
    {
        int character = [charStr characterAtIndex:a];
        
        [charMutArr addObject:[NSNumber numberWithInt:character]];
    }
    
    return charMutArr;
}
#pragma mark -

@end