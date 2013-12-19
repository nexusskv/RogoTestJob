//
//  ServerConnector.m
//  Rogotest
//
//  Created by rost on 06.09.13.
//  Copyright (c) 2013 rost. All rights reserved.
//

#import "ServerConnector.h"
#import "ASIFormDataRequest.h"
#import <arpa/inet.h>
#import "Reachability.h"
#import "SBJson.h"


@interface ServerConnector ()

@property (nonatomic, assign) BOOL errorFlag;

@end


@implementation ServerConnector

@synthesize requestTypeTag;
@synthesize errorFlag;


#pragma mark - Constructor
- (id) init
{
    self = [super init];
    if (self)
    {
        self.errorFlag = FALSE;
    }
    return self;
}
#pragma mark -


#pragma mark Destructor
- (void) dealloc
{
	self.connectorDelegate = nil;

	[super dealloc];
}
#pragma mark -


#pragma mark - isOnline
- (BOOL) isOnline
{
    BOOL resultFlag = FALSE;
    
    Reachability *internetReachability = [Reachability reachabilityForInternetConnection];
    if(([internetReachability currentReachabilityStatus] == ReachableViaWWAN) ||
	   ([internetReachability currentReachabilityStatus] == ReachableViaWiFi))
    {
        NSString *urlStr = [FORMAT_STRING:@"%@%@", kServerURL, kCreateParam];
        
        NSString *connTestStr = [NSString stringWithContentsOfURL:[NSURL URLWithString:urlStr]
                                                         encoding:NSUTF8StringEncoding
                                                            error:nil];
        if (connTestStr != NULL)
        {
            resultFlag = TRUE;
        }
    }
    return resultFlag;
}
#pragma mark -


#pragma mark - sendStartUserInfo:
- (void) sendStartUserInfo:(NSDictionary *)infoDic
{
    NSString *urlStr = [FORMAT_STRING:@"%@%@", kServerURL, kCreateParam];
    
    NSString *paramsStr = [FORMAT_STRING:@"first_name=%@&last_name=%@&email=%@&password=%@",
                           [infoDic valueForKey:@"first_name"],
                           [infoDic valueForKey:@"last_name"],
                           [infoDic valueForKey:@"email"],
                           [infoDic valueForKey:@"password"]];
    

    urlStr = [FORMAT_STRING:@"%@?%@", urlStr, paramsStr];
    
    ASIFormDataRequest *request = [[[ASIFormDataRequest requestWithURL:[NSURL URLWithString:urlStr]] retain] autorelease];
    
    [request setCompletionBlock:^{
        
        NSUInteger statusInt = [request responseStatusCode];
        
        if (statusInt != 200)
        {
            [self performSelector:@selector(backWithError:) withObject:[request responseStatusMessage]];
        }
        else
            {
                NSString *respStr = nil;
                respStr = [request responseString];
                
                if (![EMPTY_STRING:respStr])
                {
                    [self performSelectorInBackground:@selector(parseJSON:) withObject:respStr];
                }
            }
    }];
    
    [request setFailedBlock:^{
        NSError *error = [request error];
        
        [self backWithError:error.description];
        
    }];
    
    [request setDelegate:self];
    [request setRequestMethod:@"GET"];
    [request startAsynchronous];
}
#pragma mark -


#pragma mark - parseJSON:
- (void) parseJSON:(NSString *)jsonStr
{
    @autoreleasepool
    {        
        NSDictionary *jsonDic   = nil;

        if (([[jsonStr JSONValue] isKindOfClass:[NSDictionary class]]))
        {
            jsonDic = [jsonStr JSONValue];
            
            if ([[jsonDic valueForKey:@"error"] intValue] == 0)
            {
                NSString *resStr = nil;
                resStr = [jsonDic valueForKey:@"message"];
            
                [self performSelectorOnMainThread:@selector(backSelector:) withObject:resStr waitUntilDone:NO];
            }
            else
                {
                    NSMutableString *msgMutStr = [NSMutableString string];
                    
                    [msgMutStr appendString:[jsonDic valueForKey:@"message"]];
                    [msgMutStr appendString:@"\n"];
                    
                    if (![EMPTY_STRING:[jsonDic valueForKeyPath:@"data.password"]])
                    {
                        [msgMutStr appendString:[jsonDic valueForKeyPath:@"data.password"]];
                        [msgMutStr appendString:@"\n"];
                    }
                    
                    if (![EMPTY_STRING:[jsonDic valueForKeyPath:@"data.first_name"]])
                    {
                        [msgMutStr appendString:[jsonDic valueForKeyPath:@"data.first_name"]];
                        [msgMutStr appendString:@"\n"];
                    }
                    
                    if (![EMPTY_STRING:[jsonDic valueForKeyPath:@"data.last_name"]])
                    {
                        [msgMutStr appendString:[jsonDic valueForKeyPath:@"data.last_name"]];
                        [msgMutStr appendString:@"\n"];
                    }
                    
                    if (![EMPTY_STRING:[jsonDic valueForKeyPath:@"data.email"]])
                    {
                        [msgMutStr appendString:[jsonDic valueForKeyPath:@"data.email"]];
                        [msgMutStr appendString:@"\n"];
                    }
                    
                    [self performSelectorOnMainThread:@selector(backWithError:) withObject:msgMutStr waitUntilDone:NO];
                }
        }
    }
}
#pragma mark -


#pragma mark - backSelector:
- (void) backSelector:(NSString *)resStr
{
    if ((self.connectorDelegate) && ([self.connectorDelegate respondsToSelector:@selector(parseFinishWithObject:)]))
    {
        [self.connectorDelegate  parseFinishWithObject:resStr];
    }
}
#pragma mark -


#pragma mark - backWithError:
- (void) backWithError:(NSString *)errStr
{
    if ((self.connectorDelegate) && ([self.connectorDelegate respondsToSelector:@selector(backWithError:)]))
    {
        [self.connectorDelegate backWithError:errStr];
    }
}
#pragma mark -

@end