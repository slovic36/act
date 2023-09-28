#! /usr/bin/bash

# Install Python
echo "ansible" | sudo -S dnf install -y python3.9

# Make Python selection
sudo alternatives --set python /usr/bin/python3.9

# Install git
sudo dnf install git -y

# Create virtual Python environment
cd ~
mkdir venv
python -m venv venv
source ~/venv/bin/activate

# install Ansible-Core
pip install ansible-core==2.14.2

# install community general for Ansible to be able to use stdout with yaml
ansible-galaxy collection install community.general

# install AVD Collection
ansible-galaxy collection install arista.avd

# install AVD requirements.txt
pip install -r ~/.ansible/collections/ansible_collections/arista/avd/requirements.txt


###### Following steps taken from the adding a runner sections in settings of repo
### Download
# Create a folder
mkdir actions-runner && cd actions-runner

# Download the latest runner package
curl -o actions-runner-linux-x64-2.309.0.tar.gz -L https://github.com/actions/runner/releases/download/v2.309.0/actions-runner-linux-x64-2.309.0.tar.gz

# Optional: Validate the hash
#echo "038c9e98b3912c5fd6d0b277f2e4266b2a10accc1ff8ff981b9971a8e76b5441  actions-runner-linux-x64-2.307.1.tar.gz" | shasum -a 256 -c

# Extract the installer
tar xzf ./actions-runner-linux-x64-2.309.0.tar.gz

# May have to run the following command
sudo ./bin/installdependencies.sh


### Configure
# Create the runner and start the configuration experience
# Needs to change
# dev
# ./config.sh --url https://github.com/rainmanatee/act --token ACHLSZG5B2A6Z5J4TGMYWMTFCXIYK

#prod
# ./config.sh --unattended --url https://github.com/aristanetworks/jpmc-demo --token APVS6VCV5SPSUIMZBAE3LX3FATBMU


# Last step, run it!
# cd /home/ansible/actions-runner
# ./run.sh &