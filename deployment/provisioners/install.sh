# Install instructions..

cd ansible

virtualenv /tmp/jenkinsbox
/tmp/jenkinsbox/bin/pip install -r deploy-requirements.txt

/tmp/jenkinsbox/bin/ansible-galaxy install -r role-requirements.yml --ignore-errors
/tmp/jenkinsbox/bin/ansible-playbook -i inventory/vagrant playbooks/jenkins.yml  -vvvv
