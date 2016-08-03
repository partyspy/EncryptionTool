//
//  NSData+Encryption.h
//  EncryptionAndDecrytionTool
//
//  Created by mico on 7/26/16.
//  Copyright © 2016 Anonymous. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (Encryption)

- (NSData *)encryptedWithAESUsingKey:(NSString *)key andIV:(NSData *)iv;

- (NSData *)encryptedWith3DESUsingKey:(NSString *)key andIV:(NSData *)iv;
- (NSData *)decryptedWith3DESUsingKey:(NSString *)key andIV:(NSData *)iv;
@end
