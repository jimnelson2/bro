FROM centos

MAINTAINER jim nelson, https://github.com/jimnelson2

RUN \
  yum -y install cmake make gcc gcc-c++ flex bison libpcap-devel openssl-devel python-devel swig zlib-devel wget git \
  && cd /etc/yum.repos.d/ \
  && wget http://download.opensuse.org/repositories/network:bro/CentOS_7/network:bro.repo \
  && yum -y install bro \
  && cd /opt/bro/share/bro/site \
  && git clone git://github.com/hosom/bro-file-extraction file-extraction \
  && echo "@load file-extraction" >> local.bro \
  && echo "@load policy/protocols/smb" >> local.bro \
  && cd /opt/bro/share/bro/site/file-extraction/plugins \
  && echo "@load ./extract-all-files.bro" >> __load__.bro

RUN \
  yum -y remove cmake make gcc gcc-c++ flex bison swig wget git swig 

RUN mkdir /pcaps
VOLUME ["/pcaps"]
WORKDIR /pcaps

ENV PATH /opt/bro/bin:$PATH
