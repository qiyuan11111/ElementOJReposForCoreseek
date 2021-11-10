#!/bin/bash
cd /coreseek/mmseg-3.2.14
./bootstrap
./configure --prefix=/usr/local/mmseg3
make && make install

cd /coreseek/csft-4.1
sh buildconf.sh
./configure --prefix=/usr/local/coreseek --without-unixodbc --with-mmseg --with-mmseg-includes=/usr/local/mmseg3/include/mmseg/ --with-mmseg-libs=/usr/local/mmseg3/lib/ --with-mysql
make && make install
