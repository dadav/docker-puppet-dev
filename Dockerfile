FROM opensuse/leap:latest


# INSTALL wget
RUN zypper -n ref\
      && zypper -n install wget

RUN wget -O /tmp/key -q "https://yum.puppetlabs.com/RPM-GPG-KEY-puppet"\
      && rpm --import /tmp/key\
      && zypper ar "https://yum.puppetlabs.com/puppet6/sles/15/x86_64/" puppet\
      && zypper -n ref \
      && zypper -n install puppet-agent

RUN mkdir /puppet
COPY hiera /puppet/hiera
COPY hiera.yaml /puppet
COPY modules /puppet/modules
COPY site.pp /puppet
COPY scripts /puppet/scripts
WORKDIR /puppet

CMD [ "scripts/test-module.sh" ]
