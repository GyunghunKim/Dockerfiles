# Reference: https://github.com/yoctocookbook
FROM ubuntu:18.04
MAINTAINER Gyunghun Kim <ghuni@snu.ac.kr>
# System update and install prerequisites
RUN apt-get update && apt-get install -y apt-utils locales sudo
RUN dpkg-reconfigure locales && locale-gen en_US.UTF-8 && update-locale && LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
ENV LANG en_US.utf8
# Install prerequisties for yocto 
RUN sudo apt-get install -y gawk wget git-core diffstat unzip texinfo gcc-multilib build-essential chrpath socat cpio python python3 python3-pip python3-pexpect xz-utils debianutils iputils-ping libsdl1.2-dev xterm
# User setting
RUN apt-get install -y fish vim
RUN groupadd -g 1000 build && useradd -u 1000 -g 1000 -ms /bin/fish build && usermod -a -G sudo build && usermod -a -G users build
USER build
# Path setting
ENV YOCTO_PATH "/home/build/yocto"
RUN mkdir ${YOCTO_PATH}
WORKDIR ${YOCTO_PATH}
# Yocto release
ENV YOCTO_RELEASE "rocko"
# Poky install
RUN git clone -b ${YOCTO_RELEASE} git://git.yoctoproject.org/poky
# Xilinx layer install
RUN cd poky && git clone -b ${YOCTO_RELEASE} https://github.com/Xilinx/meta-xilinx.git
WORKDIR ${YOCTO_PATH}/poky
