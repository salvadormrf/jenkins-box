# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
	
	# box options
	config.vm.provider :virtualbox do |virtualbox|
		virtualbox.customize ["modifyvm", :id, "--memory", 2048]
		virtualbox.customize ["modifyvm", :id, "--cpus", 2]
	end
	
    # manage hostname
	config.hostmanager.enabled = true
	config.hostmanager.manage_host = true
	
	# devbox
	config.vm.define :devbox do |node|
	    
	    # box
	    node.vm.box = "jenkins-box"
	    node.vm.box_url = 'https://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-server-cloudimg-amd64-vagrant-disk1.box'
	    
	    # set hostname
	    node.vm.hostname = "myjenkins.dev"
	    node.vm.post_up_message = "Hello message"
	    
	    # network
	    node.vm.network :private_network, ip: "192.168.111.134"
	    node.vm.network :forwarded_port, guest: 22, host: 2230
	    
	end
	
end


# Test deployment to vagrant box
#
# ssh-keygen -f ~/.ssh/known_hosts -R myjenkins.dev
# ansible-playbook -i inventory/vagrant playbooks/jenkins.yml  -v
#