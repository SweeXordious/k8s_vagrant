Vagrant.configure("2") do |config|

    config.vm.box = "ubuntu/xenial64"
  
    def createKubernetesNode(config, hostname, ip)
        config.vm.define hostname do |host|

            config.vm.provider "virtualbox" do |vb|
                vb.customize ["modifyvm", :id, "--ioapic", "on"]
                vb.customize ["modifyvm", :id, "--memory", "2048"]
                vb.customize ["modifyvm", :id, "--cpus", "2"]
            end

            if Vagrant.has_plugin?("vagrant-vbguest") then
                config.vbguest.auto_update = false
            end

            host.vm.hostname = hostname
            host.vm.network "public_network", ip: ip

            config.vm.synced_folder ".", "/vagrant"
			host.vm.provision "shell", path: "provision.sh", privileged: false
        end
    end

    createKubernetesNode config, "master", "172.30.10.4"
    createKubernetesNode config, "node1", "172.30.10.5"
    createKubernetesNode config, "node2", "172.30.10.6"
    createKubernetesNode config, "node3", "172.30.10.7"

end