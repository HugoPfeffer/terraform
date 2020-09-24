Vagrant.configure("2") do |config|
    config.vm.synced_folder ".", "/home/vagrant/host"
    config.vm.synced_folder ".", "/vagrant", disabled: true
    config.vm.provider "virtualbox" do |v|
      v.memory = 1024
    end

    config.vm.define 'terraform' do |master|
        master.vm.box = "generic/centos8"

        # Setup and install Terraform. 
        master.vm.provision "shell", inline: "yum install -y unzip"
        master.vm.provision "shell", inline: "mkdir /home/vagrant/.terraform"
        master.vm.provision "shell", inline: "curl -o /home/vagrant/.terraform/terraform.zip https://releases.hashicorp.com/terraform/0.13.3/terraform_0.13.3_linux_amd64.zip"
        master.vm.provision "shell", inline: "cd /home/vagrant/.terraform/ && unzip terraform.zip && rm terraform.zip"

        # Add Terraform to the OS Path.
        master.vm.provision "shell", inline: "echo PATH='$HOME/.terraform:${PATH}' >> /home/vagrant/.bash_profile"
        master.vm.provision "shell", inline: "echo export PATH >> /home/vagrant/.bash_profile"

        
    end
end