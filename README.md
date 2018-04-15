# vagrant-openshift-ansible

This repository is suitable to use in Windows since it uses ansible-local provisioner.
It will installation 3 nodes cluster - 1 controller and 2 worker nodes.

It depends on openshift-nsible role. Clone [openshift ansible] (https://github.com/openshift/openshift-ansible) into the parent directory of this repo after cloning the repo.

## Plugins

The followng plugings needs to be installed for vagrant.

1. [vagrant landrush](https://github.com/vagrant-landrush/landrush)


## Build the cluster
```
git clone https://github.com/riponbanik/vagrant-openshift-ansible.git
cd vagrant-openshift-ansible
vagrant up 
```

## Provision the cluster
To re-provision the cluster after build is complete, run the following command -
```
ansible-playbook -i inventory playbook.yml --become
```

## When you're done, you can shut down the cluster using
```
vagrant destroy -f
```


