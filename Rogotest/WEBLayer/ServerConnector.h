//
//  ServerConnector.h
//  Rogotest
//
//  Created by rost on 06.09.13.
//  Copyright (c) 2013 rost. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ServerConnectorDelegate;


@interface ServerConnector : NSObject

@property (nonatomic, assign) id<ServerConnectorDelegate> connectorDelegate;
@property (nonatomic, assign) NSUInteger requestTypeTag;

- (BOOL) isOnline;
- (void) sendStartUserInfo:(NSDictionary *)infoDic;
@end


@protocol ServerConnectorDelegate <NSObject>
- (void) parseFinishWithObject:(id)resObj;
- (void) backWithError:(NSString *)errStr;
@end