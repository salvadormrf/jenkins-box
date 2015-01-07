# Install instructions..

# create build environment
virtualenv /tmp/jenkinsbox
/tmp/jenkinsbox/bin/pip install -r ansible/deploy-requirements.txt


cd ansible

# deploy to a vagrant
/tmp/jenkinsbox/bin/ansible-galaxy install -r role-requirements.yml
/tmp/jenkinsbox/bin/ansible-playbook -i inventory/vagrant playbooks/jenkins.yml  -vvvv

