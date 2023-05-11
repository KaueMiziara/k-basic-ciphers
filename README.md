# K's Basic Ciphers
This project was creatad as an excuse to learn how to use QML and integrate it with Rust.<br>

## How to build from source
Can be built using cmake, as long you have the dependencies installed.<br>

First, clone the source code (or download the .zip file):
```bash
git clone https://github.com/KaueMiziara/k-basic-ciphers.git
```
Then, open the directory in the terminal and use cmake to build the executable:<br>
```bash
cd path/to/directory

# This will create a 'build' folder and generate the buildsystem
cmake -S . -B build

# This will build the project using the generated buildsystem
cmake --build build
```
The app will be inside the 'build' folder.<br>


## About the Ciphers
Currently, the application can encode and decode text using the following ciphers: <br>

### Caesar Cipher/Shift
The Caesar Cipher is one of the most famous encryption technique. <br>
It consists in, given a number that will be used as a "key" (also called "shift"), replacing each letter in a word for the letter key positions down the alphabet, i.e. using a shift of 1, "ABC" will turn into "BCD". <br>
The method was named after Gaius Julius Caesar, a roman general and emperor that used this cipher with a shift of 3 to send messages to his generals. <br>

### Vigenère Cipher
An improved Caesar Shift. <br>
Instead of shifting all the characters in a text by the same key, this cipher often uses a password or a passphrase: <br>
Each letter in the password is converted to a keythe number relative to its position in the alphabet ("A" = 1, "B" = 2, etc.). Then, each character in the text is shifted by the key in the same position, looping the password if it's shorter than the text. <br>
For example, using "ACE" (135) as password, "ABC" will turn into "BEH". <br>
Although being invented by the italian crypthologist Giovan Battista Bellaso, 
this cipher was erroneously named after the french cryptographer Blaise de Vigenère, who
created a similar cipher, called "autokey cipher". <br>
This cipher earned the description <em>"le chiffrage indéchiffrable"</em> 
("<em>indecipherable cipher</em>") for taking over 300 years until someone managed to break it. <br>
