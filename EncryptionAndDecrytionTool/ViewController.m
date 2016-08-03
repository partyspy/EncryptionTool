//
//  ViewController.m
//  EncryptionAndDecrytionTool
//
//  Created by mico on 7/20/16.
//  Copyright © 2016 Anonymous. All rights reserved.
//

#import "ViewController.h"
#import <CommonCrypto/CommonCrypto.h>
#import "NSData+Encryption.h"

@interface ViewController ()
@property (unsafe_unretained) IBOutlet NSTextView *inputTextView;
@property (unsafe_unretained) IBOutlet NSTextView *outputTextView;
@property (unsafe_unretained) IBOutlet NSTextView *keyTextView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}


- (IBAction)encrypt:(id)sender {
    
    NSData *dataIn = [self.inputTextView.string dataUsingEncoding:NSUTF8StringEncoding];
    NSString *key = self.keyTextView.string;
    
    NSData *encryptedData = [dataIn encryptedWith3DESUsingKey:key andIV:nil];
    
    NSString *stringOut = [encryptedData base64EncodedStringWithOptions:NSDataBase64EncodingEndLineWithLineFeed];
    
    [self.outputTextView setString:stringOut];
    
}

- (IBAction)decrypt:(NSButton *)sender {
//    //decode utf8
//    NSData *dataInBase64Encoded = [self.inputField.stringValue dataUsingEncoding:NSUTF8StringEncoding];
//    //decode base64
//    NSData *dataIn = [[NSData alloc] initWithBase64EncodedData:dataInBase64Encoded options:NSDataBase64DecodingIgnoreUnknownCharacters];
    
    NSData *dataIn = [[NSData alloc] initWithBase64EncodedString:self.inputTextView.string options:NSDataBase64DecodingIgnoreUnknownCharacters];
    
    NSString *key = self.keyTextView.string;
    
    NSData *decryptedData = [dataIn decryptedWith3DESUsingKey:key andIV:nil];
    
    NSString *stringOut = [NSString stringWithUTF8String:decryptedData.bytes];
    
//    NSString *stringOut = [decryptedData base64EncodedStringWithOptions:NSDataBase64EncodingEndLineWithLineFeed];
    
    [self.outputTextView setString:stringOut];
}

@end
