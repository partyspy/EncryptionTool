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
@property (weak) IBOutlet NSTextField *inputField;
@property (weak) IBOutlet NSTextField *keyField;

@property (unsafe_unretained) IBOutlet NSTextView *outputTextView;

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
    
    NSData *dataIn = [self.inputField.stringValue dataUsingEncoding:NSUTF8StringEncoding];
    NSString *key = self.keyField.stringValue;
    
    NSData *encryptedData = [dataIn encryptedWith3DESUsingKey:key andIV:nil];
    
    NSString *stringOut = [encryptedData base64EncodedStringWithOptions:NSDataBase64EncodingEndLineWithLineFeed];
    
    [self.outputTextView setString:stringOut];
    
}

- (IBAction)decrypt:(NSButton *)sender {
//    //decode utf8
//    NSData *dataInBase64Encoded = [self.inputField.stringValue dataUsingEncoding:NSUTF8StringEncoding];
//    //decode base64
//    NSData *dataIn = [[NSData alloc] initWithBase64EncodedData:dataInBase64Encoded options:NSDataBase64DecodingIgnoreUnknownCharacters];
    
    NSLog(@"input:%@", self.inputField.stringValue);
    
    NSData *dataIn = [[NSData alloc] initWithBase64EncodedString:self.inputField.stringValue options:NSDataBase64DecodingIgnoreUnknownCharacters];
    
    NSString *key = self.keyField.stringValue;
    
    NSData *decryptedData = [dataIn decryptedWith3DESUsingKey:key andIV:nil];
    
    NSString *stringOut = [NSString stringWithUTF8String:decryptedData.bytes];
    
//    NSString *stringOut = [decryptedData base64EncodedStringWithOptions:NSDataBase64EncodingEndLineWithLineFeed];
    
    [self.outputTextView setString:stringOut];
}

@end
