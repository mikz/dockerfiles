FROM stackbrew/ubuntu:trusty
MAINTAINER Michal Cichra <michal.cichra@gmail.com>

# non interactive apt
ENV DEBIAN_FRONTEND noninteractive

RUN apt-mark hold initscripts udev plymouth mountall \
 && dpkg-divert --local --rename --add /sbin/initctl \
 && ln -sf /bin/true /sbin/initctl \
 && dpkg-divert --local --rename /usr/bin/ischroot \
 && ln -sf /bin/true /usr/bin/ischroot \
 && echo "exit 101" > /usr/sbin/policy-rc.d \
 && chmod +x /usr/sbin/policy-rc.d \
 && echo "force-unsafe-io" > /etc/dpkg/dpkg.cfg.d/02apt-speedup \
 && echo "Acquire::http {No-Cache=True;};" > /etc/apt/apt.conf.d/no-cache \
 && echo 'APT {Install-Recommends="false";Install-Suggests="false";};' > /etc/apt/apt.conf.d/no-recommends

RUN echo "apt-get -q -y clean && rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/*" > /usr/local/bin/apt-cleanup \
 && chmod +x /usr/local/bin/apt-cleanup \
 && echo "gem: --no-ri --no-rdoc" > /etc/gemrc

RUN apt-get -q -y update \
 && apt-get -q -y install software-properties-common python-software-properties lsb-release wget language-pack-en \
 && echo "Europe/Prague" > /etc/timezone \
 && dpkg-reconfigure -f noninteractive tzdata \
 && apt-cleanup

ENV LC_ALL en_US.UTF8
