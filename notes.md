About
-----

This brute-force password cracker uses [gentle_brute](https://github.com/jamespenguin/gentle-brute), a library to crack MD5 hashed passwords.

Test Run
--------

Install Dependencies
```
$ bundle install

```

Try it hashing the password "doge" and then cracking it
```
# Hash a Password and Copy to clipboard
$ echo -n "doge" | openssl md5 | sed 's/^.* //' | pbcopy

# Crack Hashed Password
ruby simple_pass_cracker -h 03ea345ce429b6581d7c28c33305c2b6
```

You can also pass in a four-letter word and have the program hash it for you
```
# Pass in a four-letter string to be hashed and cracked
ruby simple+pass_cracker -p "doge"
```

Try out Gentle Brute from the Command Line:
```
$ wget https://raw.github.com/jamespenguin/gentle-brute/master/passwords.txt

$ GentleBrute --crack-md5-list passwords.txt
```