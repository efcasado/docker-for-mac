# https://gist.github.com/koemeet/fa4a777dea2e882c859d
Vagrant.configure("2") do |config|
  config.ssh.forward_agent = true
  config.env.enable
  config.vm.box = ENV['DOCKER_FOR_MAC_VAGRANT_BOX']

  config.vm.provider "virtualbox" do |v|
    v.memory = ENV['DOCKER_FOR_MAC_MEMORY']
    v.cpus = ENV['DOCKER_FOR_MAC_CPUS']
    v.name = "workbox"
    v.check_guest_additions = true
  end

  # Configure static private IP address
  config.vm.network "private_network", ip: ENV['DOCKER_FOR_MAC_IP']

  # Mounts your home directory to the Vagrant VM as a volume
  config.vm.synced_folder File.expand_path("~"), File.expand_path("~")

  # Install Docker and Docker Compose
  config.vm.provision :docker
  #config.vm.provision "shell", path: "provision-docker-compose.sh"

  # Configure SSH keys
  config.vm.provision "file", source: "~/.ssh", destination: "/home/vagrant/.ssh"
  config.vm.provision "shell", path: "provision-ssh-keys.sh", privileged: false
  #config.vm.provision "shell", path: "provision-ssh-agent.sh", privileged: false, run: 'always'
end
