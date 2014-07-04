# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  # Every Vagrant virtual environment requires a box to build off of.

  #Configuring the HAProxy Load Balancer Node
  config.vm.define "haproxynode" do |haconfig|
    haconfig.vm.box = "merikan/centos6.4-32bit-puppet-vbox"
    haconfig.vm.hostname = "haproxynode.local"
    haconfig.vm.network "private_network", ip: "192.168.56.2"
    haconfig.vm.provision :shell, :inline => "/etc/init.d/iptables stop"
    #Update /etc/hosts file
    haconfig.vm.provision :hosts do |hahosts|
      hahosts.add_host '192.168.56.2',['haproxynode.local']
      hahosts.add_host '192.168.56.3',['nginx-1.local']
      hahosts.add_host '192.168.56.4',['nginx-2.local']
    end
    #Configuring Puppet Masterless
    haconfig.vm.provision "puppet" do |puppet|
      #puppet.options = "--verbose --debug"
      puppet.module_path = "modules"
      puppet.manifests_path = "manifests"
      puppet.manifest_file = "p_haproxy.pp"
    end
  end
  #Configuring the Nginx Nodes
  (1..2).each do |i|
    config.vm.define "nginx-#{i}" do |node|
      node.vm.box = "merikan/centos6.4-32bit-puppet-vbox"
      node.vm.hostname = "nginx-#{i}.local"
      node.vm.network "private_network", ip: "192.168.56.#{i+2}"
      node.vm.provision :shell, :inline => "/etc/init.d/iptables stop"
      #Configuring Puppet Masterless
      node.vm.provision "puppet" do |puppet|
        #puppet.options = "--verbose --debug"
        puppet.module_path = "modules"
        puppet.manifests_path = "manifests"
        puppet.manifest_file = "p_nginx.pp"
      end
      #Update /etc/hosts file
      node.vm.provision :hosts do |nodehosts|
        nodehosts.add_host '192.168.56.2',['haproxynode.local']
        nodehosts.add_host '192.168.56.3',['nginx-1.local']
        nodehosts.add_host '192.168.56.4',['nginx-2.local']
      end
    end
  end
end