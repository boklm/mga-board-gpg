#!/bin/sh

GPGHOMEDIR="./homedir"
PUBDIR="./public"
PRIVDIR="./private"

pubkey="$PUBDIR/mageia-board-pubkey.gpg"
seckey="$PRIVDIR/mageia-board-seckey.gpg"

chmod 700 "$GPGHOMEDIR"

echo "Generate key :"
gpg --homedir "$GPGHOMEDIR" --batch --gen-key board.batch

echo "Public key :"
gpg --homedir "$GPGHOMEDIR" --list-keys
gpg --homedir "$GPGHOMEDIR" --list-keys --fingerprint > "$PUBDIR/mageia-board-fingerprint.txt"
gpg --homedir homedir --export -a > "$pubkey"

echo "Secret key :"
gpg --homedir "$GPGHOMEDIR" --list-secret-keys
gpg --homedir homedir --export-secret-keys -a > "$seckey"

rm -Rf "$GPGHOMEDIR"

#TODO : split secret key using ssss-split

