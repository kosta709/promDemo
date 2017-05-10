# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://atlas.hashicorp.com/search.
  # config.vm.box = "centos/7"
    #docker pull kosta709/docker-cache-test:master
    #su - ubuntu -c "git clone https://github.com/kosta709/docker-cache-test.git"

  config.vm.network :forwarded_port, guest: 22, host: 2222, id: "ssh", disabled: true
  $script = <<SCRIPT
    curl -sSL https://get.docker.com/ | sh
    service docker start
    usermod -aG docker vagrant
SCRIPT

  config.vm.define "srv1" do |tst1|
    tst1.vm.box = "ubuntu/trusty64"	
    tst1.vm.hostname = "srv1"
    tst1.vm.network :forwarded_port, guest: 22, host: 10022
    tst1.vm.network "private_network", ip: "172.29.1.100"
    tst1.vm.provider "virtualbox" do |v|
      v.name = "srv1"
      v.memory = 1024
    end
    tst1.vm.provision "shell", inline: $script
  end

  config.vm.define "node1" do |tst1|
    tst1.vm.box = "ubuntu/trusty64"	
    tst1.vm.hostname = "node1"
    tst1.vm.network :forwarded_port, guest: 22, host: 10122
    tst1.vm.network "private_network", ip: "172.29.1.101"
    tst1.vm.provider "virtualbox" do |v|
      v.name = "node1"
      v.memory = 1024
    end
    tst1.vm.provision "shell", inline: $script
  end

  #~ config.vm.define "tst2" do |tst2|
    #~ tst2.vm.box = "ubuntu/trusty64"	
    #~ tst2.vm.hostname = "tst2"
    #~ tst2.vm.network :forwarded_port, guest: 22, host: 10122	
    #~ tst2.vm.network "private_network", ip: "172.29.1.101"
    #~ tst2.vm.provider "virtualbox" do |v|
      #~ v.name = "tst2-ubuntu"
      #~ v.memory = 1024
    #~ end
    #~ tst2.vm.provision "shell", inline: $script
  #~ end  

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # config.vm.network "forwarded_port", guest: 80, host: 8080

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"
  # config.vm.network :forwarded_port, guest: 80, host: 8080

  
  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:100
  #
  # config.vm.provider "virtualbox" do |vb|
  #   # Display the VirtualBox GUI when booting the machine
  #   vb.gui = true
  #
  #   # Customize the amount of memory on the VM:
  #   vb.memory = "1024"
  # end
  #config.vm.provider "virtualbox" do |vb|
  #   # Display the VirtualBox GUI when booting the machine
  #  vb.gui = true
  #
  #   # Customize the amount of memory on the VM:
  #  vb.memory = "1024"
  #end  
  # View the documentation for the provider you are using for more
  # information on available options.

  # Define a Vagrant Push strategy for pushing to Atlas. Other push strategies
  # such as FTP and Heroku are also available. See the documentation at
  # https://docs.vagrantup.com/v2/push/atlas.html for more information.
  # config.push.define "atlas" do |push|
  #   push.app = "YOUR_ATLAS_USERNAME/YOUR_APPLICATION_NAME"
  # end

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
  # config.vm.provision "shell", inline: <<-SHELL
  #   sudo apt-get update
  #   sudo apt-get install -y apache2
  # SHELL
end
