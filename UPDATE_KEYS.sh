#!/bin/sh
# This script only needs to be run to update the public signatures
# When these are updated they can be fetched from all users of the secret keys

# This copies the backup of the secret keys, so must be done securely
cp -rf $1 ~/gpg-update-keys
chmod 700 ~/gpg-update-keys
chmod 600 ~/gpg-update-keys/*
killall gpg-agent
gpg --homedir=~/gpg-update-keys --quick-set-expire C9693BFD4864CB6D0111E6258091117AD7316142 1y
gpg --homedir=~/gpg-update-keys --quick-set-expire C9693BFD4864CB6D0111E6258091117AD7316142 1y '*'
gpg --homedir=~/gpg-update-keys --quick-set-expire 30C6353302ED4E83BDFDE52FD601AAE7235761BB 1y
gpg --homedir=~/gpg-update-keys --quick-set-expire 30C6353302ED4E83BDFDE52FD601AAE7235761BB 1y '*'
gpg --homedir=~/gpg-update-keys --armor --export > ~/gpg-update-keys/pubkey.asc
killall gpg-agent
sudo rm -rf $1
sudo cp -r ~/gpg-update-keys $1
gpg --import ~/gpg-update-keys/pubkey.asc
# keys.openpgp.org only allows identity information in the latest key, so include it for the ed25519 key
gpg --keyserver keys.openpgp.org --send-key C9693BFD4864CB6D0111E6258091117AD7316142
gpg --keyserver keys.openpgp.org --send-key 30C6353302ED4E83BDFDE52FD601AAE7235761BB
# Also add both keys to https://keyserver.ubuntu.com and to https://keys.mailvelope.com
# Neither of these seem to work with HKP
# Mailvelope will only take one key, so use the ed25519 key
gpg --export --armor C9693BFD4864CB6D0111E6258091117AD7316142
gpg --export --armor 30C6353302ED4E83BDFDE52FD601AAE7235761BB
echo "Check and then delete the ~/gpg-update-keys directory"
