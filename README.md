# Enigma
by **Carrie Walsh**

Turing Mod 1 - Final Independent Project

## Objective
This project is to create a message encrypter-decrypter. The ultimate goal is to be able to use Command Line Interface to encrypt a saved message.txt file and save the encryption as the file encrypted.txt. The encrypted.txt file can then be decrypted and the now decoded message can be seen in the created decrypted.txt.

### Encryption
Encryption uses a 5-digit key and a 6-digit offset based on a date.
You may include your own key and date, or it will generate them for you.
Magic methods use the key and offset to change the characters in a method.

### Decryption
Decryption uses the same key/offset to shift the characters back to their original letters.

### Crack
This is for super secret messages. The messages have to end with " end" (so don't forget that) and you must know the 6-digit date, but no key is needed.

## Installation
`$ git clone git@github.com:carriewalsh/enigma.git`

## To Encrypt a Message
Type and save a message into `message.txt`.

In the Command Line, type:
`ruby ./lib/encrypt.rb message.txt encrypted.txt *key* *date*`

To view the encrypted message, open `encrypted.txt`.

## To Decrypt an Encrypted Message
In the Command Line, type:
`ruby ./lib/decrypt.rb encrypted.txt decrypted.txt *key* *date*`

To view the decrypted message, open `decrypted.txt`

## To Crack an Encrypted Message

Write a message in `message.txt` that ends with " end" and encrypt it.

Then, in the Command Line, type:
`ruby ./lib/crack.rb encrypted.txt cracked.txt *date*`

To view the cracked message, open `cracked.txt`

##      
## Self-Assessment

### Functionality
4 - Enigma works with encrypt, decrypt, and crack. The cracking method sometimes finds two plausible keys, so it returns one and cracks the message. Still fully functional after changes from feedback.

### Object-Oriented Programming
3 - Methods have been pared down and re-divided amongst modules and classes. Readability and method length have been balanced. One method has 14 lines and one has 8 lines. Cipher initialize has 8 lines.
- Crack, Encrypt, and Decrypt all depend on Enigma
- Enigma depends on Cipher, Encrypter, Decrypter, and Cracker
- Cipher depends on KeyGenerator and OffsetGenerator
- Encrypter and Decrypter depend on LetterShift
- Cracker depends on KeyFinder
- KeyFinder depends on WrongDeleter

### Test-Drive Development
3 - I have 100% coverage and named tests clearly, but I did not use mocks/stubs. I left tests for encrypt and decrypt to get full coverage.

### Version Control
4 - As of this addition on the README, I have 197 commits and 27 PR's. I made sure to commit often after small additions of functionality. All my commit methods reflected clear purpose.
