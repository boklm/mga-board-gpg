#!/bin/sh

. ./config

echo 'Today is :'
date
echo '(check if the date is correct and press enter)'
read z

chmod 700 "$GPGHOMEDIR"

echo "Generate key :"
gpg --homedir "$GPGHOMEDIR" --batch --gen-key "$INPUTDIR/board.batch"

echo "Public key :"
gpg --homedir "$GPGHOMEDIR" --list-keys
gpg --homedir "$GPGHOMEDIR" --list-keys --fingerprint > "$PUBDIR/mageia-board-fingerprint.txt"
gpg --homedir homedir --export -a > "$pubkey"

echo "Secret key :"
gpg --homedir "$GPGHOMEDIR" --list-secret-keys
gpg --homedir homedir --export-secret-keys -a > "$seckey"

rm -Rf "$GPGHOMEDIR"

echo "Generate passphrase"
./random-passphrase > "$passphrase"
gpg -c --passphrase-file "$passphrase" "$seckey"
rm -f "$seckey"

#TODO : split secret key using ssss-split

