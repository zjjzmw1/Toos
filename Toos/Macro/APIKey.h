//
//  APIKey.h
//  SearchV3Demo
//
//  Created by Mark C.J. on 15-10-10.
//  Copyright (c) 2015年 Beijing Beast Technology Co.,Ltd. All rights reserved.
//

#ifndef SearchV3Demo_APIKey_h
#define SearchV3Demo_APIKey_h

/* 使用高德SearchV3, 请首先注册APIKey, 注册APIKey请参考 http://api.amap.com
 */

const static NSString *APIKey = @"d1ec487adf6c8e094c867c50a4f8c89b";

// 微信SDK使用的App ID.
#define kWeixinAppID                @"wx4b716c4aaaa4e421"

// ------- 系统消息key相关 ---------
//#ifdef DEBUG        // 调试

//新浪微博 app_key 和应用授权回调页（测试服务器）
#define Sina_APP_ID                 @"2049873687"
#define Sina_RedirectURI            @"https://api.weibo.com/oauth2/default.html"

//测试服务器

#define AVCLOUD_APP_ID              @"qiz2ee6ucwbte8130yevxnkc8iwltldvtaazx6tl2d4hey3r"
#define AVCLOUD_APP_KEY             @"119uiyex7d42pezuuf6hv7afebg58fwjyfry3lit8rswc4b1"

//融云测试 key
#define RONGCLOUD_IM_APPKEY                 @"25wehl3uwar5w"              //dev 用的
#define RONGCLOUD_IM_CONSUMER_SERVICE_ID    @"KEFU144774233468125"        //dev 用的

#define HOSTNAME                    @"dev.beast_tester.avosapps.com"
//#define HOSTNAME                    @"www.beastbikes.com"

#define MY_Activity_URL             @"http://dev.beast_tester.avosapps.com/activity/myActivity"
#define CLUB_ACTIVITY_ENTRY_URL     @"http://dev.beast_tester.avosapps.com/club/activity?clubId="
#define CLUB_ACTIVITY_ADD_NEW_URL   @"http://dev.beast_tester.avosapps.com/club/publish.html"

// 接口测试服务器地址
#define CLIENT_HTTP_API                     @"http://tester.speedforce.com/api"     //服务器API地址
// 网络接口API Domain
#define COOKIES_DOMAIN                      @"tester.speedforce.com"

// 网页相关页面Domain
#define COOKIES_DOMAIN_FOR_WEBPAGE          @".avosapps.com"

//#else               // 发布
//
//
////新浪微博 app_key 和应用授权回调页（正式服务器）
//
//#define Sina_APP_ID                 @"1134292133"
//#define Sina_RedirectURI            @"https://api.weibo.com/oauth2/default.html"
//
////正式服务器
//#define AVCLOUD_APP_ID                      @"1xzez6xivqxdogg3ayf8nuit72ae175eggjtcqpeyahfhkqf"
//#define AVCLOUD_APP_KEY                     @"bv7d83jp0gwhwc6hcfshmcy2ymjpp5h7u3m0wcp18cwlfxsk"
//
////融云线上正式 key
//#define RONGCLOUD_IM_APPKEY                     @"qd46yzrf4o2df"              //AppStore 用的
//#define RONGCLOUD_IM_CONSUMER_SERVICE_ID        @"KEFU144774296732097"        //AppStore 用的
//
//#define HOSTNAME                                @"www.beastbikes.com"
//
//#define MY_Activity_URL                         @"http://www.beastbikes.com/activity/myActivity"
//#define CLUB_ACTIVITY_ENTRY_URL                 @"http://www.beastbikes.com/club/activity?clubId="
//#define CLUB_ACTIVITY_ADD_NEW_URL               @"http://www.beastbikes.com/club/publish.html"
//
//// 接口正式服武器地址
//#define CLIENT_HTTP_API                     @"http://api.speedforce.com/api"        //服务器API地址
//// 网络接口API Domain
//#define COOKIES_DOMAIN                      @".speedforce.com"
//
//// 网页相关页面Domain
//#define COOKIES_DOMAIN_FOR_WEBPAGE          @".beastbikes.com"
//
//#endif

#endif

