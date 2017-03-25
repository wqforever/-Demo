//
//  TTSpeechController.m
//  文字转语音
//
//  Created by 王琪 on 17/3/25.
//  Copyright © 2017年 王琪. All rights reserved.
//

#import "TTSpeechController.h"

@interface TTSpeechController ()
//语音合成对象
@property (nonatomic,strong) AVSpeechSynthesizer *synthesizer;
//语音设置器
@property (nonatomic,strong) NSArray *voice;
//语音转化的文本
@property (nonatomic,strong) NSArray *speechString;

@end

@implementation TTSpeechController

+ (instancetype)shareSpeechController {
    return [[self alloc]init];
}
- (instancetype)init {
    self = [super init];
    if (self) {
        // 初始化语音合成器
        _synthesizer = [[AVSpeechSynthesizer alloc]init];
        // 设置需要发出的声音
        _voice = @[[AVSpeechSynthesisVoice voiceWithLanguage:@"en-US"],[AVSpeechSynthesisVoice voiceWithLanguage:@"zh-CN"]];
        // 文本
        _speechString = [self buildString];
    }
    return self;
}
// 语音转文本核心方法
- (void)beginConversation {
    for (int i = 0; i < self.speechString.count; i++) {
        NSString *speechStr = self.speechString[i];
        AVSpeechUtterance *utterance = [[AVSpeechUtterance alloc]initWithString:speechStr];
        utterance.volume = 1;
        utterance.pitchMultiplier = 0.8;//音调
        utterance.voice = self.voice[i%2];//语言
        utterance.rate = 0.5;//说话速率
        utterance.postUtteranceDelay = 0.1;//延迟播放声音
        
        [self.synthesizer speakUtterance:utterance];
    }
}

- (NSArray *)buildString {
    return @[@"hello",
             @"你好",
             @"miki",
             @"王胖胖同学",
             @"miki",
             @"王胖胖同学"];
}
@end
