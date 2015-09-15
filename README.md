# Simple Brute Force

## About

This repository houses a simple MD5 brute force cracker. The cracker relies on [gentle_brute](https://github.com/jamespenguin/gentle-brute) to crack MD5 hashed passwords.

Check out my [IT Security Tools](https://github.com/rskelley9/it-security-tools) repo. It's a collection of notes and small programs related to network security, encryption, browser security and more.

## Try It

Hash the password "doge" and then crack it
```
# Hash password and copy to clipboard
$ echo -n "doge" | openssl md5 | sed 's/^.* //' | pbcopy

# Crack Hashed Password
ruby simple_pass_cracker -h 03ea345ce429b6581d7c28c33305c2b6
```

Pass in a short word, have the program hash it for you and then crack it
```
ruby simple_pass_cracker -p "doge"
```

Try out Gentle Brute from the Command Line:
```
$ wget https://raw.github.com/jamespenguin/gentle-brute/master/passwords.txt

$ GentleBrute --crack-md5-list passwords.txt
```

Encryption vs. Hashing
----------------------

I created a notes file on the fundamental differences between **encryption, hashing and encoding**. Check it out [here.](https://github.com/rskelley9/simple_brute_force/blob/master/encoding_vs_encryption_vs_hashing.txt)

To-do List
----------

* Add gitignore file to remove IDE files from tracking

Links
-----
*
