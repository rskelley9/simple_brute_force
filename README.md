# Simple Brute Force

## About

This repository houses a simple MD5 brute force cracker I made for fun. It's part of the [IT Security Tools](https://github.com/rskelley9/it-security-tools) repo I have, which is a collection of notes and small programs related to network security, encryption, browser security and more.

This brute-force password cracker uses [gentle_brute](https://github.com/jamespenguin/gentle-brute), a library to crack MD5 hashed passwords.

## Try It

Install Dependencies
```
$ bundle install
```
Crack Test Password
```
$ ruby simple_pass_cracker.rb [password hash]
```
Test Gentle Brute:
```
$ wget https://raw.github.com/jamespenguin/gentle-brute/master/passwords.txt

$ GentleBrute --crack-md5-list passwords.txt
```

Encryption vs. Hashing
----------------------

I creates a notes file on the fundamental differences between **encryption, hashing and encoding**. Check it out [here.](https://github.com/rskelley9/simple_brute_force/blob/master/encoding_vs_encryption_vs_hashing.txt)
