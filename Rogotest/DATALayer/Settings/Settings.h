//
//  Settings.h
//  Rogotest
//
//  Created by rost on 06.09.13.
//  Copyright (c) 2013 rost. All rights reserved.
//


#define SMART_RELEASE(_OBJECT_)         [_OBJECT_ release], _OBJECT_ = nil;
#define FORMAT_STRING                   NSString stringWithFormat
#define EMPTY_STRING                    [Helper shared] isEmpty

// BREAK MODE TAGS
#define BREAK_MODE_WORD_WRAP_TAG    500
#define BREAK_MODE_CHAR_WRAP_TAG    501
#define BREAK_MODE_CLIP_TAG         502
#define BREAK_MODE_HEAD_TRUNC_TAG   503
#define BREAK_MODE_TAIL_TRUNC_TAG   504
#define BREAK_MODE_MIDL_TRUNC_TAG   505


// TEXT ALIGN TAGS
#define TEXT_ALIGN_LEFT_TAG         506
#define TEXT_ALIGN_CENTER_TAG       507
#define TEXT_ALIGN_RIGHT_TAG        508


#define SERVER_AUTH_TAG             600


#define NEXT_RETURN_KEY             610
#define DONE_RETURN_KEY             611

#define PASSWD_TXTFLD_TAG           615

#define EMAIL_TXTFLD_TAG            620
#define PWD_TXTFLD_TAG              621
#define NAME_TXTFLD_TAG             622
#define FAMIL_TXTFLD_TAG            623


#import <Foundation/Foundation.h>


extern NSString *const kServerURL;
extern NSString *const kCreateParam;


@interface Settings : NSObject

@end
