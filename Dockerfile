FROM centos:6
MAINTAINER qiyuan
COPY coreseek/coreseek-4.1.tar.gz /coreseek/coreseek-4.1.tar.gz
COPY coreseek/start.sh /coreseek/start.sh
RUN mkdir -p /var/cache/yum/x86_64/6/base && mkdir -p /var/cache/yum/x86_64/6/extras && mkdir -p /var/cache/yum/x86_64/6/updates \
	&& touch /var/cache/yum/x86_64/6/base/mirrorlist.txt && touch /var/cache/yum/x86_64/6/extras/mirrorlist.txt \
	&& touch /var/cache/yum/x86_64/6/updates/mirrorlist.txt \
	&& echo "http://vault.centos.org/6.10/os/x86_64/" > /var/cache/yum/x86_64/6/base/mirrorlist.txt \
	&& echo "http://vault.centos.org/6.10/extras/x86_64/" > /var/cache/yum/x86_64/6/extras/mirrorlist.txt \
	&& echo "http://vault.centos.org/6.10/updates/x86_64/" > /var/cache/yum/x86_64/6/updates/mirrorlist.txt \
	&& yum install -y make gcc g++ gcc-c++ libtool autoconf automake imake mysql-devel libxml2-devel expat-devel \
	&& cd /coreseek && tar -zxvf /coreseek/coreseek-4.1.tar.gz
EXPOSE 9312