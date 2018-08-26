//
//  PathMacro.h
//  ZZMusic
//
//  Created by 仲召俊 on 2018/8/26.
//  Copyright © 2018年 zhognzhaojun. All rights reserved.
//

//沙盒目录文件的宏

#ifndef PathMacro_h
#define PathMacro_h

///NSTemporaryDirectory
#define kPathTemp                   NSTemporaryDirectory()

///NSDocumentDirectory
#define kPathDocument               [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0]

///NSCachesDirectory
#define kPathCache                  [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0]

#endif /* PathMacro_h */
