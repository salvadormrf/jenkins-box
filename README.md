jenkins-box 
===========
Deployment template for Jenkins CI  
[![Build Status](https://travis-ci.org/salvadormrf/jenkins-box.svg?branch=master)](https://travis-ci.org/salvadormrf/jenkins-box)

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

```bash
# list of Jenkins plugins to be installed
	git
	ssh
	violations
	image-gallery
	matrix-auth
	delivery-pipeline-plugin
	sloccount
	role-strategy
	parameterized-trigger
	matrix-auth
	gravatar
	cobertura
	build-token-root
	ws-cleanup
	email-ext
```














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

```bash
# list of Jenkins plugins to be installed
	git
	ssh
	violations
	image-gallery
	matrix-auth
	delivery-pipeline-plugin
	sloccount
	role-strategy
	parameterized-trigger
	matrix-auth
	gravatar
	cobertura
	build-token-root
	ws-cleanup
	email-ext
```












