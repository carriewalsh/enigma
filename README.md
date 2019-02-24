# Enigma
by **Carrie Walsh**

Mod 1 - Final Independent Project

## Objective

This project is to create a message encrypter and decrypter. The ultimate goal is to be able to use Command Line Interface to encrypt a saved message.txt file and save it as the file encrypted.rb. The encrypted.txt file can then be decrypted and the now decoded message can be seen in the created decrypted.rb.

##Installation
`$ git clone git@github.com:carriewalsh/enigma.git`

##To Encrypt a Message
Type a message into `message.txt`.

In the Command Line, type:
`ruby ./lib/encrypt.rb message.txt encrypted.txt`

To view the encrypted message, open `encrypted.txt`.

##To Decrypt an Encrypted Message

In the Command Line, type:
`ruby ./lib/decrypt.rb encrypted.txt 12345 032489`

To view the decrypted message, open `decrypted.txt`
