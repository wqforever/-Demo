//
//  TTSpeechController.h
//  文字转语音
//
//  Created by 王琪 on 17/3/25.
//  Copyright © 2017年 王琪. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>
@interface TTSpeechController : NSObject
// 创建一个制度的语音合成器
@property (nonatomic,strong,readonly) AVSpeechSynthesizer *synthesizer;

// 实例化语音合成控制器
+ (instancetype)shareSpeechController;
//
- (void)beginConversation;
@end
