# Install instructions..

cd deployment/provisioners/ansible

# create build environment
virtualenv /tmp/jenkinsbox
/tmp/jenkinsbox/bin/pip install -r deploy-requirements.txt

# deploy to a vagrant
/tmp/jenkinsbox/bin/ansible-galaxy install -r role-requirements.yml
/tmp/jenkinsbox/bin/ansible-playbook -i inventory/vagrant playbooks/jenkins.yml  -vvvv

