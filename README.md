# EncryptionTool
A Mac App Tool For Encryption and Decryption - support 3DES for now

## Screenshot
![ss](https://github.com/partyspy/EncryptionTool/blob/master/EncryptionAndDecrytionTool/Assets.xcassets/screen-shot.imageset/screen-shot@2x.png?raw=true)

## The current process
- **Encrypt**: **Raw String** --(utf8 encoding)--> **UTF8-encoded data stream** --(encrypting)--> **encrypted data stream** --(base64-encoding)--> **base64-encoded string**
- **Decrypt**: **Encrypted string** --(based64-decoding)-> **encrypted data stream** --(decrypting)-> **UTF8-encoded stream** --(utf8 decoding)-> **Raw string**

## Upcomming Features
- AES
- MD5
- HMAC
- RSA
