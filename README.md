jenkins-box
===========
Deployment template for Jenkins CI  

Uses ansible-role forked from  
https://github.com/ICTO/ansible-jenkins


```bash
# boot vagrant box
vagrant plugin install vagrant-hostmanager
vagrant up

# go to ansible path
cd ansible

# create build environment
virtualenv /tmp/jenkinsbox
/tmp/jenkinsbox/bin/pip install -r deploy-requirements.txt

# deploy with ansible to a host
/tmp/jenkinsbox/bin/ansible-galaxy install -r role-requirements.yml --ignore-errors
/tmp/jenkinsbox/bin/ansible-playbook -i inventory/vagrant playbooks/jenkins.yml  -vvvv
```
