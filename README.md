# Enigma
by **Carrie Walsh**

Mod 1 - Final Independent Project

## Objective
This project is to create a message encrypter and decrypter. The ultimate goal is to be able to use Command Line Interface to encrypt a saved message.txt file and save it as the file encrypted.rb. The encrypted.txt file can then be decrypted and the now decoded message can be seen in the created decrypted.rb.

### Encryption
Encryption uses a 5-digit key and a 6-digit offset based on the date.
Magic methods use the key and offset to change the characters in a method.

### Decryption
Decryption uses the same key/offset to shift the characters back to their originals.

### Crack
This is for super secret messages. The messages have to end with " end" and you must know the date, but no key is needed

## Installation
`$ git clone git@github.com:carriewalsh/enigma.git`

## To Encrypt a Message
Type a message into `message.txt`.

In the Command Line, type:
`ruby ./lib/encrypt.rb message.txt encrypted.txt`

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
