//
//  ViewController.m
//  文字转语音
//
//  Created by 王琪 on 17/3/25.
//  Copyright © 2017年 王琪. All rights reserved.
//

#import "ViewController.h"
#import "TTSpeechController.h"
#import <AVFoundation/AVFoundation.h>

@interface ViewController ()<AVSpeechSynthesizerDelegate>
@property (nonatomic,strong) TTSpeechController *speechController;
//
@property (nonatomic,strong) NSMutableArray *speechString;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.speechController = [TTSpeechController shareSpeechController];
    self.speechController.synthesizer.delegate = self;
    
    self.speechString = [[NSMutableArray alloc]init];
    
    [self.speechController beginConversation];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)speechSynthesizer:(AVSpeechSynthesizer *)synthesizer didStartSpeechUtterance:(AVSpeechUtterance *)utterance {
    [self.speechString addObject:utterance];
}
@end
