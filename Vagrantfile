# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # The base box/instance to use
  config.vm.box = "Berkshelf-CentOS-6.3-x86_64-minimal"
  config.vm.box_url = "https://s3.amazonaws.com/sync2.merck.com/bootstrap/vagrant/Berkshelf-CentOS-6.3-x86_64-minimal.box"

  # Enable Berkshelf
  config.berkshelf.enabled = true

  # Send www traffic from the host machine
  config.vm.network :private_network, ip: '192.168.30.30'

  # Upgrade Chef to the latest
  # config.vm.provision :shell, inline: 'sudo true && curl -L https://www.opscode.com/chef/install.sh | sudo bash'

  # Provision with Chef
  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = "cookbooks"
    chef.roles_path = "roles"
    chef.run_list = [ "role[ciklum]" ]
    chef.json = {
      "ec2" => {
        "AWS_ACCESS_KEY_ID" => "#{ENV['AWS_ACCESS_KEY_ID']}",
        "AWS_SECRET_ACCESS_KEY" => "#{ENV['AWS_SECRET_ACCESS_KEY']}"
      }
    }
  end
end
