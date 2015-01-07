jenkins-box 
===========
Deployment template for Jenkins CI  
[![Build Status](https://travis-ci.org/salvadormrf/jenkins-box.svg?branch=master)](https://travis-ci.org/salvadormrf/jenkins-box)

Uses ansible-role forked from  
https://github.com/ICTO/ansible-jenkins  

##### Deploy to a vagrant box

```bash
# boot vagrant box
vagrant plugin install vagrant-hostmanager
vagrant up

# go to ansible path
cd ansible

# create build environment
virtualenv /tmp/jenkinsbox
/tmp/jenkinsbox/bin/pip install -r deploy-requirements.txt

# deploy with ansible
/tmp/jenkinsbox/bin/ansible-galaxy install -r role-requirements.yml
/tmp/jenkinsbox/bin/ansible-playbook -i inventory/vagrant playbooks/jenkins.yml -vvvv
```


##### Deploy to your server ( myciserver.com )
```bash

# create inventory/ci_server file
[jenkins]
myciserver.com ansible_ssh_user=ubuntu ansible_ssh_private_key_file=/home/me/key.pem

# create inventory/host_vars/myciserver.com file
port: 80
prefix: '/build'
startup_delay_s: 60

plugins:
  - git
  - ssh
  - violations
  - image-gallery
  - matrix-auth
  - delivery-pipeline-plugin
  - sloccount
  - role-strategy
  - parameterized-trigger
  - matrix-auth
  - gravatar
  - cobertura
  - build-token-root
  - ws-cleanup
  - email-ext
  - google-login

# go to ansible path
cd ansible

# create build environment
virtualenv /tmp/jenkinsbox
/tmp/jenkinsbox/bin/pip install -r deploy-requirements.txt

# deploy with ansible
/tmp/jenkinsbox/bin/ansible-galaxy install -r role-requirements.yml
/tmp/jenkinsbox/bin/ansible-playbook -i inventory/ci_server playbooks/jenkins.yml -vvvv
```
