# -*- mode: ruby -*-
# vim: set ft=ruby :

Vagrant.configure(2) do |config|

  config.vm.box = "generic/debian10"
  config.vm.box_version = "4.2.16"
  config.vm.hostname = "debmanager"
  config.vm.provider "virtualbox" do |v|
    v.memory = 256
    v.cpus = 1
  end
  config.vm.provision "shell", path: "deb_script.sh"

end
