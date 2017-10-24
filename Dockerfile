FROM inhumantsar/fpm-pkg:centos
MAINTAINER Shaun Martin <shaun@samsite.ca>

ENV VERSION=master
ENV WORKDIR=/workspace

RUN yum install -y \
      git \
      libxslt \
      openssl-devel \
      rpm-build

ADD build.sh /build.sh

ENTRYPOINT [ "/build.sh" ]
