# k8s_vagrant
Simple k8s cluster on Vagrant.
It creates 4 virtual machines, provisions them, then joins the cluster whose leader is `master` node.

## How to run
#### Install Vagrant
On Ubuntu 20.04: https://linuxize.com/post/how-to-install-vagrant-on-ubuntu-20-04/

#### Install vb guest additions plugin
```ssh
$ vagrant plugin install vagrant-vbguest
```

#### clone this repo
```ssh
$ git clone https://github.com/SweeXordious/k8s_vagrant/
$ cd k8s_vagrant
```

#### Start the cluster
```ssh
$ vagrant up
```

#### Check if everything is alright
```ssh
$ vagrant ssh master
$ kubectl get nodes
```
And you should see all the nodes **READY**.


### Use the cluster from your host machine
The configuration file is already exported under: `k8s_vagrant/config/config` after provisioning the nodes. All you need to do is copy the file to your host:
```ssh
$ cp config/config $HOME/.kube
$ kubectl get nodes
```
And you should see all the nodes.

PS: Will download a good amount of images :p make sure to have enough data.
