# Clone the repo
git clone https://github.com/openshift/openshift-ansible 

# Run playbook all 
ansible-playbook -i inventory playbook.yml -vv

# Run individually
sudo ansible-playbook -i inventory openshift/playbooks/prerequisites.yml
sudo ansible-playbook -i inventory openshift/playbooks/deploy_cluster.yml

# Uninstall 
ansible-playbook -i inventory ../openshift-ansible/playbooks/adhoc/uninstall.yml -vv

# Reinstall
ansible-playbook ../openshift-ansible/playbooks/byo/config.yml

# Install Web Conosole
ansible-playbook -i inventory ../openshift-ansible/playbooks/openshift-web-console/config.yml -vv