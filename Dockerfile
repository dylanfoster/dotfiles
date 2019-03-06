FROM ubuntu:trusty

RUN adduser --disabled-password --gecos ' ' --uid 1000 vader \
      && adduser vader sudo \
      && echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
USER vader
RUN sudo chown -R vader /usr/local
RUN sudo apt-get update \
      && sudo apt-get install -y git-core

ADD . /home/vader/dotfiles
RUN sudo chown -R vader /home/vader
CMD bash -c /home/vader/dotfiles/install.sh

WORKDIR /home/vader/dotfiles
