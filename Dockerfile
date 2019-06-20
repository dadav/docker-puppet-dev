FROM opensuse/leap:latest

# INSTALL wget
RUN zypper -n ref\
      && zypper -n install wget\
      && wget -O /tmp/key -q "https://yum.puppetlabs.com/RPM-GPG-KEY-puppet"\
      && rpm --import /tmp/key\
      && zypper ar "https://yum.puppetlabs.com/puppet6/sles/15/x86_64/" puppet\
      && zypper -n ref \
      && zypper -n install puppet-agent jq gzip

RUN mkdir /puppet
WORKDIR /puppet
COPY test-module.sh /puppet/scripts/test-module.sh
ENTRYPOINT [ "/bin/bash", "-c", "scripts/test-module.sh" ]
