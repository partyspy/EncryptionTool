//
//  NSData+Encryption.m
//  EncryptionAndDecrytionTool
//
//  Created by mico on 7/26/16.
//  Copyright © 2016 Anonymous. All rights reserved.
//

#import "NSData+Encryption.h"
#import <CommonCrypto/CommonCrypto.h>

@implementation NSData (Encryption)

- (NSData *)encryptedWithAESUsingKey:(NSString *)key andIV:(NSData *)iv {
    
    NSData *keyData = [key dataUsingEncoding:NSUTF8StringEncoding];
    
    size_t dataMoved;
    
    NSMutableData *encryptedData = [NSMutableData dataWithLength:self.length + kCCBlockSizeAES128];
    
    CCCryptorStatus status = CCCrypt(
                                     kCCEncrypt,
                                     kCCAlgorithmAES128,
                                     kCCOptionPKCS7Padding | kCCOptionECBMode,
                                     keyData.bytes,
                                     keyData.length,
                                     iv.bytes,
                                     self.bytes,
                                     self.length,
                                     encryptedData.mutableBytes,
                                     encryptedData.length,
                                     &dataMoved
                                     );
    if (status == kCCSuccess) {
        encryptedData.length = dataMoved;
        return encryptedData;
    }
    
    return nil;
}


- (NSData *)encryptedWith3DESUsingKey:(NSString *)key andIV:(NSData *)iv {
    
//    NSData *keyData = [key dataUsingEncoding:NSUTF8StringEncoding];
    
//    NSData *keyData = [[NSData alloc] initWithBase64EncodedString:key options:NSDataBase64DecodingIgnoreUnknownCharacters];
    
    NSData *keyData = [[NSData alloc] initWithBase64EncodedData:[key dataUsingEncoding:NSUTF8StringEncoding] options:NSDataBase64DecodingIgnoreUnknownCharacters];
    
    size_t dataMoved;
    
    NSMutableData *encryptedData = [NSMutableData dataWithLength:self.length + kCCBlockSize3DES];
    
    CCCryptorStatus status = CCCrypt(kCCEncrypt,
                                     kCCAlgorithm3DES,
                                     kCCOptionPKCS7Padding | kCCOptionECBMode,
                                     keyData.bytes,
                                     keyData.length,
                                     iv.bytes,
                                     self.bytes,
                                     self.length,
                                     encryptedData.mutableBytes,
                                     encryptedData.length,
                                     &dataMoved);
    
    if (status == kCCSuccess) {
        encryptedData.length = dataMoved;
        return encryptedData;
    }
    return nil;
}

- (NSData *)decryptedWith3DESUsingKey:(NSString *)key andIV:(NSData *)iv {
    
    NSData *keyData = [[NSData alloc] initWithBase64EncodedData:[key dataUsingEncoding:NSUTF8StringEncoding] options:NSDataBase64DecodingIgnoreUnknownCharacters];
    
    size_t dataMoved;
    
    NSMutableData *decryptedData = [NSMutableData dataWithLength:self.length + kCCBlockSize3DES];
    
    CCCryptorStatus status = CCCrypt(kCCDecrypt,
                                     kCCAlgorithm3DES,
                                     kCCOptionPKCS7Padding | kCCOptionECBMode,
                                     keyData.bytes,
                                     keyData.length,
                                     iv.bytes,
                                     self.bytes,
                                     self.length,
                                     decryptedData.mutableBytes,
                                     decryptedData.length,
                                     &dataMoved);
    
    if (status == kCCSuccess) {
        decryptedData.length = dataMoved;
        return decryptedData;
    }
    
    return nil;
}

@end