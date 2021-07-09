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
You will be prompted to choose which network interface to use, choose wisely :D

#### Check if everything is alright
```ssh
$ vagrant ssh master
$ kubectl get nodes
```
And you should see all the nodes **READY**.

PS: Will download a good amount of images :p make sure to have enough data.
