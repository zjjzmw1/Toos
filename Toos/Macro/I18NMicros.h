//
//  I18NMicros.h
//  Vodka
//
//  Created by Mark C.J. on 15/9/7.
//  Copyright (c) 2015年 Beijing Beast Technology Co.,Ltd. All rights reserved.
//

//
// Warning!!!
//  由于要进行蓝牙相关适配的联调，国际化要暂时搁置，特此说明；
//  目前进度：
//      1. 目前已经完成单位转换的国际化工作，包括km -> mile, m->feet, km/h -> mph, etc.
//      2. 文本国际化已经全部完成，v1.8.0新加模块国际化分别由不同模块负责同事完成;
//      3. 个人设置信息中的单位转换还未完成，包括身高、体重单位等；
//
#ifndef Vodka_I18NMicros_h
#define Vodka_I18NMicros_h

#pragma mark - 语言相关

// Locale String [Upper Case]
// 英文-香港    EN_HK
// 中文-香港    ZH_HK
// 英文-中国    EN_CN
// 英文-台湾    EN_TW
// 英文-澳门    EN_MO
#define LOCALE_STRING_UPPER_CASE            [(NSString *)[[NSLocale currentLocale] localeIdentifier] uppercaseString]

//
// zh           中文
// zh-Hant      繁体中文
// zh-Hans      简体中文
// zh-HK        繁体中文(香港)
#define I18N_CURRENT_LANGUAGE_STRING        (([[NSLocale preferredLanguages] objectAtIndex:0]) == nil ? @"" : ([[NSLocale preferredLanguages] objectAtIndex:0]))

//
// 该宏用户判断是否处于国际化模式下，即非中文模式；
// 该宏的判断逻辑可以使用语言来判是否需要进行国际化，包括单位转换等；
// 在非中国的海外地区
//
#define I18N_IN_AREA_ABROAD_MODE            (!([LOCALE_STRING_UPPER_CASE hasSuffix:@"CN"] ||    \
                                                [LOCALE_STRING_UPPER_CASE hasSuffix:@"HK"] ||   \
                                                [LOCALE_STRING_UPPER_CASE hasSuffix:@"TW"] ||   \
                                                [LOCALE_STRING_UPPER_CASE hasSuffix:@"MO"]))

//中国大陆或者香港的话是用苹果地图。。。。
#define I18N_IN_AREA_APPLE_MODE            (!([LOCALE_STRING_UPPER_CASE hasSuffix:@"CN"] ||    \
[LOCALE_STRING_UPPER_CASE hasSuffix:@"HK"]))
/********************** 单位转换相关 **********************/

#define I18N_KM_TO_MILES(KM)                ((I18N_IN_AREA_ABROAD_MODE == YES) ? (KM * 0.621371) : KM)        // 公里 -> 英里
//#define I18N_MILES_TO_KM(Miles)           ((I18N_IN_AREA_ABROAD_MODE == YES) ? (Miles * 1.609344) : Miles   // 英里 -> 公里

//#define I18N_Meter_TO_MILES(Meter)        (Meter * 0.00062137)    // 米   -> 英里
//#define I18N_Miles_TO_Meter(Mile)         (Mile * 1609.344)       // 英里 -> 米

#define I18N_Meter_TO_Inch(Miter)           ((I18N_IN_AREA_ABROAD_MODE == YES) ? (Miter * 3.2808399) : Miter)     // 米 -> 英尺

#define I18N_KM_PER_HOUR_TO_MPH(Speed)      ((I18N_IN_AREA_ABROAD_MODE == YES) ? (Speed * 0.621371) : Speed)      // 公里每小时 -> 英里每小时

#define I18N_CM_TO_FEET(CM)             ((I18N_IN_AREA_ABROAD_MODE == YES) ? (CM * 0.3937008) : CM)    // 里米-英尺英寸
#define I18N_KG_TO_LB(KG)               ((I18N_IN_AREA_ABROAD_MODE == YES) ? (KG * 2.2046226) : KG)    // 千克-磅 kg -- lb
#define I18N_LB_TO_KG(LB)               ((I18N_IN_AREA_ABROAD_MODE == YES) ? (LB * 0.4535924) : LB)    // 千克-磅 lb -- kg
#define I18N_FEET_TO_CM(FEET)           ((I18N_IN_AREA_ABROAD_MODE == YES) ? (FEET * 30.48) : FEET)    // 尺---CM
#define I18N_INCH_TO_CM(INCH)           ((I18N_IN_AREA_ABROAD_MODE == YES) ? (INCH * 2.54) : INCH)     // 寸---CM

/********************** 单位标题转换相关 **********************/

// 海外版本中显示为mi, 国内版本中：英文状态下显示为“km”, 中文状态下显示为“公里”
#define I18N_LABEL_KM_TO_MI             ((I18N_IN_AREA_ABROAD_MODE == YES) ? @"mi" : NSLocalizedString(@"公里", nil))

// 海外版本中显示为mi, 国内版本中：英文 & 中文状态下均显示为“km”
#define I18N_LABEL_KM_EN_TO_MI          ((I18N_IN_AREA_ABROAD_MODE == YES) ? @"mi" : NSLocalizedString(@"km", nil))

// 海外版本中显示为ft, 国内版本中：英文 & 中文状态下均显示为“m”
#define I18N_LABEL_M_EN_TO_INCH         ((I18N_IN_AREA_ABROAD_MODE == YES) ? @"ft" : NSLocalizedString(@"m", nil))

// 海外版本中显示为mph, 国内版本中：英文状态下显示为“km/h”, 中文状态下显示为“公里/小时”
#define I18N_LABEL_KMPH_TO_MPH          ((I18N_IN_AREA_ABROAD_MODE == YES) ? @"mph" :  NSLocalizedString(@"公里/小时", nil))
#define I18N_LABEL_KMPH_TO_MPH2          ((I18N_IN_AREA_ABROAD_MODE == YES) ? @"mph" :  NSLocalizedString(@"公里每小时", nil))


// 海外版本中显示为mph, 国内版本中：英文 & 中文状态下均显示为“km/h”
#define I18N_LABEL_KMPH_EN_TO_MPH       ((I18N_IN_AREA_ABROAD_MODE == YES) ? @"mph" :  NSLocalizedString(@"km/h", nil))

#endif
