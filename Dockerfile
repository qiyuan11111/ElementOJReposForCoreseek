FROM centos:6
MAINTAINER qiyuan
COPY coreseek/coreseek-4.1.tar.gz /coreseek/coreseek-4.1.tar.gz
RUN mkdir -p /var/cache/yum/x86_64/6/base && mkdir -p /var/cache/yum/x86_64/6/extras && mkdir -p /var/cache/yum/x86_64/6/updates \
	&& touch /var/cache/yum/x86_64/6/base/mirrorlist.txt && touch /var/cache/yum/x86_64/6/extras/mirrorlist.txt \
	&& touch /var/cache/yum/x86_64/6/updates/mirrorlist.txt \
	&& echo "http://vault.centos.org/6.10/os/x86_64/" > /var/cache/yum/x86_64/6/base/mirrorlist.txt \
	&& echo "http://vault.centos.org/6.10/extras/x86_64/" > /var/cache/yum/x86_64/6/extras/mirrorlist.txt \
	&& echo "http://vault.centos.org/6.10/updates/x86_64/" > /var/cache/yum/x86_64/6/updates/mirrorlist.txt \
	&& yum install make gcc g++ gcc-c++ libtool autoconf automake imake mysql-devel libxml2-devel expat-devel \
	&& tar -zxvf /coreseek/coreseek-4.1.tar.gz && cd /coreseek/coreseek-4.1/mmseg-3.2.14 \
	&& ./bootstrap && ./configure --prefix=/usr/local/mmseg3 && make && make install && cd cd /coreseek/coreseek-4.1/csft-4.1 \
	&& sh buildconf.sh && ./configure --prefix=/usr/local/coreseek --without-unixodbc --with-mmseg --with-mmseg-includes=/usr/local/mmseg3/include/mmseg/ --with-mmseg-libs=/usr/local/mmseg3/lib/ --with-mysql \
	&& make && make install
EXPOSE 9312
