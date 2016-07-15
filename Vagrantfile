# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.synced_folder ".", "/home/vagrant/sync", disabled: true

  config.vm.box = "centos/7"

  CONSUL_JOIN_ADDRESS = "192.168.33.10"

  config.vm.define :vault do |host|
    _HOSTNAME = "vault"
    _PRIVATE_IP_ADDRESS = CONSUL_JOIN_ADDRESS
    _CONSUL_ARGS = _HOSTNAME + " " + _PRIVATE_IP_ADDRESS + " " + CONSUL_JOIN_ADDRESS

    host.vm.hostname = _HOSTNAME
    host.vm.network "private_network", ip: _PRIVATE_IP_ADDRESS
    host.vm.provision :shell, :path => "install-common-package.sh"
    host.vm.provision :shell, :path => "stop-security.sh"
    host.vm.provision :shell, :path => "install-vault.sh"
    host.vm.provision :shell, :path => "install-vault-ssh-helper.sh"
    host.vm.provision :shell, :path => "set-vault-sshkey.sh"
    host.vm.provision :shell, :path => "run-vault-server.sh"
    #host.vm.provision :shell, :path => "set-vault-otp.sh"
  end

end
