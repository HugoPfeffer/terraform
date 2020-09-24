
$install_terraform = <<-SCRIPT
sudo yum install -y unzip && \
mkdir /home/vagrant/.terraform && \
curl -o /home/vagrant/.terraform/terraform.zip https://releases.hashicorp.com/terraform/0.13.3/terraform_0.13.3_linux_amd64.zip && \
cd /home/vagrant/.terraform/ && \
unzip terraform.zip && rm terraform.zip && \
cd /home/vagrant
SCRIPT

$path_terraform = <<-SCRIPT
echo PATH='$HOME/.terraform:${PATH}' >> /home/vagrant/.bash_profile && \
echo export PATH >> /home/vagrant/.bash_profile
SCRIPT

$install_pip = <<-SCRIPT
mkdir /home/vagrant/Downloads && cd /home/vagrant/Downloads && \
curl -O https://bootstrap.pypa.io/get-pip.py && python3 get-pip.py --user && \
cd /home/vagrant && \
echo export PATH='/home/vagrant/.local/bin:$PATH' >> /home/vagrant/.bash_profile
SCRIPT

$install_awscli = <<-SCRIPT
pip3 install awscli --upgrade --user
SCRIPT

Vagrant.configure("2") do |config|
    config.vm.synced_folder ".", "/home/vagrant/host"
    config.vm.synced_folder ".", "/vagrant", disabled: true
    config.vm.provider "virtualbox" do |v|
      v.memory = 1024
    end

    config.vm.define 'terraform' do |master|
        master.vm.box = "generic/centos8"
        master.vm.network "public_network", bridge: ""
        
        # Setup and install Terraform. 
        master.vm.provision "shell", inline: $install_terraform, privileged: false

        # Add Terraform to the OS Path.
        master.vm.provision "shell", inline: $path_terraform, privileged: false

        # Downloads and install pip. 
        master.vm.provision "shell", inline: $install_pip, privileged: false

        # Setup and instal AWS CLI.
        master.vm.provision "shell", inline: $install_awscli, privileged: false

    end
end