# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "centos/7"
  # config.vm.box_check_update = true 
  # config.ssh.private_key_path = File.expand_path('~/.ssh/id_rsa')
  config.landrush.enabled = true # enabled hostname resolution

  config.vm.provider :virtualbox do |vb|
    vb.memory = 1024
    vb.cpus = 1
  end

  config.vm.define "node1" do |machine|
    machine.vm.network "private_network", ip: "192.168.56.31"

    config.vm.hostname = "oc-node1.lab.local"

    config.landrush.host 'oc-master.lab.local', '192.168.56.30'
    config.landrush.host 'oc-node2.lab.local', '192.168.56.32'

    config.vm.provision "shell", inline: <<-EOC
      sudo sed -i -e "\\#PasswordAuthentication no# s#PasswordAuthentication no#PasswordAuthentication yes#g" /etc/ssh/sshd_config
      sudo service ssh restart
    EOC

  end

  config.vm.define "node2" do |machine|
    machine.vm.network "private_network", ip: "192.168.56.32"
    config.vm.hostname = "oc-node2.lab.local"

    config.landrush.host 'oc-master.lab.local', '192.168.56.30'
    config.landrush.host 'oc-node1.lab.local', '192.168.56.31'

    config.vm.provision "shell", inline: <<-EOC
      sudo sed -i -e "\\#PasswordAuthentication no# s#PasswordAuthentication no#PasswordAuthentication yes#g" /etc/ssh/sshd_config
      sudo service ssh restart
    EOC
  end

  config.vm.define 'controller' do |machine|
    machine.vm.network "private_network", ip: "192.168.56.30"

    config.vm.provider :virtualbox do |vb|
      vb.memory = 2048
      vb.cpus = 2
    end

    config.vm.hostname = "oc-master.lab.local"

    config.landrush.host 'oc-node1.lab.local', '192.168.56.31'
    config.landrush.host 'oc-node2.lab.local', '192.168.56.32'

    config.vm.provision "shell", inline: <<-EOC
      sudo sed -i -e "\\#PasswordAuthentication no# s#PasswordAuthentication no#PasswordAuthentication yes#g" /etc/ssh/sshd_config
      sudo service ssh restart
    EOC
  end
end