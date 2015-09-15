# Note, this is not working,
## it outputs a different hash than when same command is run from command line
if [ -z "$1" ]; then
	echo syntax: sh genhash.sh '<password>'
else
	echo -n "doge" | openssl md5 | sed 's/^.* //' | pbcopy
fi