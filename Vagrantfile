# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = '2'

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = 'phusion-open-ubuntu-12.04-amd64'
  config.vm.box_url = 'https://oss-binaries.phusionpassenger.com/vagrant/boxes/ubuntu-12.04.3-amd64-vbox.box'
  config.vm.network :forwarded_port, guest: 4243, host: 4243

  ip = '10.17.42.2'
  config.vm.network :private_network, ip: ip, netmask: '255.255.0.0'

  config.vm.provision :shell, inline: <<-install
    wget -q -O - https://get.docker.io/gpg | apt-key add -
    echo deb http://get.docker.io/ubuntu docker main > /etc/apt/sources.list.d/docker.list;
    apt-get update -qq; apt-get install -q -y --force-yes lxc-docker;
    usermod -a -G docker vagrant;
  install

  config.vm.provision :shell, inline: <<-docker
    echo 'DOCKER_OPTS="-H tcp://0.0.0.0:4243 -H unix:// -bip=#{ip}/16"' > /etc/default/docker
  docker

  config.vm.provision :shell, inline: <<-network
    echo ip addr del #{ip}/16 dev eth1 > /etc/rc.local
    echo ip link set eth1 master docker0 >> /etc/rc.local
    echo service docker restart >> /etc/rc.local
    chmod +x /etc/rc.local 2> /dev/null
  network

  config.vm.provision :shell, inline: '/etc/rc.local'

end
