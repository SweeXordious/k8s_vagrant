#!/bin/bash

curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -

sudo bash -c 'cat <<EOF >/etc/apt/sources.list.d/kubernetes.list
deb https://apt.kubernetes.io/ kubernetes-xenial main
EOF'

sudo apt-get update

sudo apt-get install -y kubelet kubeadm kubectl docker.io

# Do not update these packages, will be done automatically by k8s
sudo apt-mark hold kubelet kubeadm kubectl docker.io

sudo swapoff -a  

if test "$HOSTNAME" = master ; then
	
    sudo kubeadm init --control-plane-endpoint=172.30.10.4 --pod-network-cidr=172.30.10.0/8 

    mkdir -p $HOME/.kube
    sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
    sudo chown $(id -u):$(id -g) $HOME/.kube/config
    
    kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml
    
    mkdir -p /vagrant/config
    kubeadm token create $(kubeadm token generate) --print-join-command --ttl=0 > /vagrant/config/kube_token
    sudo ufw allow 6443

    cp $HOME/.kube/config /vagrant/config/config
else 
    sudo bash /vagrant/config/kube_token
fi

