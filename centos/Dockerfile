FROM inhumantsar/fpm-pkg:centos
MAINTAINER Shaun Martin <shaun@samsite.ca>

ENV VERSION=master
ENV WORKDIR=/workspace
ENV TARGET=rpm

RUN yum install -y \
      git \
      libxslt \
      openssl-devel \
      rpm-build

ADD build.sh /build.sh

CMD [ "/build.sh" ]
