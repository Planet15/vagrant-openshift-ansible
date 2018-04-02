# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "centos/7"
  # config.vm.box_check_update = true 
  config.ssh.private_key_path = File.expand_path('~/.ssh/id_rsa')

  config.vm.provider :virtualbox do |vb|
    vb.memory = 512
    vb.cpus = 1
  end

  config.vm.define "node1" do |machine|
    machine.vm.network "private_network", ip: "192.168.56.31"
  end

  config.vm.define "node2" do |machine|
    machine.vm.network "private_network", ip: "192.168.56.32"
  end

  config.vm.define 'controller' do |machine|
    machine.vm.network "private_network", ip: "192.168.56.30"

    config.vm.provider :virtualbox do |vb|
      vb.memory = 1024
      vb.cpus = 512
    end

    machine.vm.provision :ansible_local do |ansible|
      ansible.playbook       = "playbook.yml"
      ansible.verbose        = true
      ansible.install        = true
      ansible.install_mode = "pip"
      ansible.version = "2.4.3.0"
      ansible.become = true
      ansible.limit          = "all" # or only "nodes" group, etc.
      ansible.inventory_path = "inventory"
    end
  end
end