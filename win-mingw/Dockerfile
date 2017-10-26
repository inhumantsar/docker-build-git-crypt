FROM debian:wheezy
MAINTAINER Shaun Martin <shaun@samsite.ca>

ENV REPO=https://github.com/Mikulas/git-crypt.git
ENV WORKDIR=/workspace
WORKDIR /workspace

RUN echo "Adding MXE repo and pkgs..." \
	&& echo "deb http://pkg.mxe.cc/repos/apt/debian wheezy main" > \
		/etc/apt/sources.list.d/mxeapt.list \
	&& apt-key adv --keyserver keyserver.ubuntu.com \
		--recv-keys D43A795B73B16ABE9643FE1AFD8FFF16DB45C6AB
	&& apt update \
  && apt install -y \
    mxe-x86-64-w64-mingw32.static-gcc \
		mxe-x86-64-w64-mingw32.static-openssl \
		mxe-x86-64-w64-mingw32.static-zlib \
		git

CMD [ "/bin/bash" ]
