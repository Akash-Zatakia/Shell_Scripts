#!/bin/bash

# Function to install & update the apt packages 
install_update(){
    if command_exists apt-get; then
        sudo apt-get update
    else
        echo "Error: apt-get is not available. Cannot update APT packages."
    fi
}

# Fucntion to install docker on ubuntu
install_docker(){
    
    # Adding officals Docker GPG Key:

    sudo apt-get install ca-certificates curl wget -y
    sudo install -m 0755 -d /etc/apt/keyrings
    sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
    sudo chmod a+r /etc/apt/keyrings/docker.asc

    # Adding the repository to APT sources

    echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    
    # Installing Docker on ubuntu
    sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y
    
    # Adding docker user 
    sudo usermod -aG docker ubuntu
    newgrp docker
    sudo systemctl status docker
}

# Fucntion to install Jenkins on ubuntu

install_Jenkins(){
    # Installing JAVA dependencies
    sudo apt install fontconfig openjdk-17-jre -y
    java -version

    # Adding APT repositories of jenkins
    sudo wget -O /usr/share/keyrings/jenkins-keyring.asc https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
    echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null 

    # Installing Jenkins 
    sudo apt-get update -y
    sudo apt-get install jenkins -y

    # Starting Jenkins Daemon
    sudo systemctl enable jenkins
    sudo systemctl start jenkins
    sudo systemctl status jenkins

}

install_terraform(){
    # Making Sure dependencies are installed gnupg, software-properties-common, curl
    sudo apt-get update && sudo apt-get install -y gnupg software-properties-common lsb-release apt-transport-https

    # Installing Hashicorp GPG Key
    wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg > /dev/null

    # Verifying key's fingerprint
    gpg --no-default-keyring --keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg --fingerprint

    # Adding Hashicorp Repository to your system
    echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list

    # updating package information and installing terraform
    sudo apt update
    sudo apt-get install terraform

    # verifying if terraform is installed
    terraform -help
}

install_awscli(){
    if command_exists unzip; then
        echo "unzip command exist"
    else
        echo "Installing Unzip"
        sudo apt install unzip -y
    fi
    # downloading aws_cli package
    curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
    unzip awscliv2.zip

    # installing awscli
    echo "installing awscli ......"
    sudo ./aws/install
}

install_trivy(){
    # adding public key & trivy repositories 
    wget -qO - https://aquasecurity.github.io/trivy-repo/deb/public.key | sudo apt-key add -
    echo deb https://aquasecurity.github.io/trivy-repo/deb $(lsb_release -sc) main | sudo tee -a /etc/apt/sources.list.d/trivy.list

    # installing trivy
    sudo apt-get update
    sudo apt-get install trivy
}

install_kubernetes(){
    # Adding k8 signing key
    curl -fsSL https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes.gpg

    # Adding K8's repositories to the list
    echo "deb [arch=amd64 signed-by=/etc/apt/keyrings/kubernetes.gpg] http://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee -a /etc/apt/sources.list

    # installing k8's tools
    sudo apt install kubeadm kubelet kubectl
    sudo apt-mark hold kubeadm kubelet kubectl

    # Verifying installation
    kubeadm version
}

install_ansible(){
    # Adding repositories to the list
    sudo apt-add-repository ppa:ansible/ansible 
    sudo apt update -y
    
    # Installing ansible
    sudo apt install ansible -y
    ansible --version
}

install_vagrant(){
    sudo apt install vagrant
    vagrant --version
}

