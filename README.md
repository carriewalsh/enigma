# Enigma
by **Carrie Walsh**

Turing Mod 1 - Final Independent Project

## Objective
This project is to create a message encrypter-decrypter. The ultimate goal is to be able to use Command Line Interface to encrypt a saved message.txt file and save it as the file encrypted.txt. The encrypted.txt file can then be decrypted and the now decoded message can be seen in the created decrypted.txt.

### Encryption
Encryption uses a 5-digit key and a 6-digit offset based on the date.
You may include your own key and date, or it will generate them for you.
Magic methods use the key and offset to change the characters in a method.

### Decryption
Decryption uses the same key/offset to shift the characters back to their originals.

### Crack
This is for super secret messages. The messages have to end with " end" (so don't forget that) and you must know the 6-digit date, but no key is needed.

## Installation
`$ git clone git@github.com:carriewalsh/enigma.git`

## To Encrypt a Message
Type a message into `message.txt`.

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
4 - Enigma works with encrypt, decrypt, and crack. The cracking method sometimes finds two plausible keys, so it returns one and cracks the message.

### Object-Oriented Programming
3 - I tried really hard, but I have one method that is 14 lines and one initialize that is 8 lines. I did not use any class methods. Otherwise, I put a lot of thought into the names of classes, variables and methods. I went over each module/class to make sure each had a single responsibility.

### Test-Drive Development
3 - I have 100% coverage and named tests clearly, but I did not use mocks/stubs.

### Version Control
4 - As of this addition on the README, I have 182 commits and 24 PR's. I made sure to commit often after small additions of functionality. All my commit methods reflected clear purpose.
