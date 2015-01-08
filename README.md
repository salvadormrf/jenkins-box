jenkins-box 
===========
Deployment template for Jenkins CI  
[![Build Status](https://travis-ci.org/salvadormrf/jenkins-box.svg?branch=master)](https://travis-ci.org/salvadormrf/jenkins-box)  

- installs jenkins-ci
- install jenkins plugins
- Install firefox, chromedriver, xvfb, other code analysis tools and pyhton tools

Forked from https://github.com/ICTO/ansible-jenkins


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


## Configuration guidelines
**Notes:**   
In Jenkins initial configuration is very easy to be locked (can't access the Jenkins configuration) due to permissions.  
To avoid getting locked, first allow anonymous users to be able to do everything.
- Create admin user
- Create a group and set permissions to admin user
- Disable Anonymous access to jenkins

## Authentication
#### Use normal accounts to authenticate
- Enable "Jenkins’ own user database"
- Enable "Allow users to sign up"

#### Use Google Login to authenticate
- Enable google-login plugin
- Create an Google Application on Google Developers console [Instructions](https://wiki.jenkins-ci.org/display/JENKINS/Google+Login+Plugin)
- Set Client id, secret and which domain to allow users to signup/login
 
**Notes:** 
- google requires a domain and not an ip address  
- google needs to be able to access the given urls when we create an application  


## Authorization
#### Use Role-Based Strategy
- Enable "Role-Based Strategy"
- Under (Manage Jenkins > Manage and Assign Roles) add some roles (ex: admin, developers) and set permissions for each role.
- Create a new role "Anonymous" and set permissions unchecked for no access.
- Assign admin user to admin role with all permisisons.


### Global Configuration
- Go to Manage Jenkins > Configure System
- Under "Location" set "Jenkins URL"
- Under "Location" set "System Admin e-mail address"

### Email notification with templates
- Go to Manage Jenkins > Configure System
- Under "Extended E-mail Notification"
- Check "Override Global Settings"
- Set all smtp details (you can use AWS IAM SES credentials as example)
- Set on "Default Content" ${SCRIPT, template="my-template.groovy"} to use "my-template.groovy"


**Notes:** 
- templates needs to be added to JENKINS_HOME/emaill-templates/


### Jobs Email notifications
- Go to your job configuration
- Add post build action "Editable Email Notification"
- Configure action if needed
