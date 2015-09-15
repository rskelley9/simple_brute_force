About
-----

This brute-force password cracker uses [gentle_brute](https://github.com/jamespenguin/gentle-brute), a library to crack MD5 hashed passwords.

Setup
-----

Install Dependencies
```
$ bundle install

```

Try It Out
----------

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