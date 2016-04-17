FROM ubuntu:trusty

ADD . /root/dotfiles

CMD bash -c /root/dotfiles/install.sh

WORKDIR /root/dotfiles
