# kciphers (temporary name)

## Ciphers
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
("<em>indecipherable cipher</em>") because for over 300 years nobody managed to break it. <br>



> TODO: A better looking GUI <br>
> TODO: How to build with cmake <br>
> TODO: A decent README <br>
