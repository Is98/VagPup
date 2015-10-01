Vagrant.configure(2) do |config|
	
	masterIP = "10.50.15.254"
	masterHostname = "hmaster"
	masterFQDN = masterHostname + ".netbuilder.private"
	agentHostnameStub = "hagent"
	agentCount = 1
	
	config.vm.provider :virtualbox do |masterVB|
		masterVB.name = "masterCM"
		masterVB.memory = 4096
		masterVB.cpus = 2
	end
	
		
	config.vm.box = "ubuntu/trusty64"
	config.vm.provision "all",
		type: "shell",
		path: "all.sh",
		run: "always"
	
	config.vm.define "master" do |master|
		master.vm.hostname = masterHostname
		master.vm.network "public_network",
			ip: masterIP
		master.vm.provision "puppetinstall",
			type: "shell",
			path: "master.sh"
		master.vm.synced_folder "modules/", "/etc/puppet/modules"
		master.vm.synced_folder "manifests/", "/etc/puppet/manifests"
	end
	
	for i in 1..agentCount 
		config.vm.define "agent" + i.to_s do |agent|
			agent.vm.hostname = agentHostnameStub + i.to_s
			agent.vm.network "public_network"
			agent.vm.provision "agent",
				type: "shell",
				path: "agent.sh",
				args: [masterIP, masterFQDN, masterFQDN],
				run: "always"
		end
	end
	
end