FROM opensuse/leap:latest

# INSTALL
RUN zypper -n ref \
      && zypper -n install puppet

CMD [ "test-module.sh" ]
