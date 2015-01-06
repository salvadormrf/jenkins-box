# TODO

sudo apt-get update
sudo apt-get install virtualenvwrapper -y

mkvirtualenv jenkinsbox
pip install ansible
cd deployment/provisioners/ansible

ansible-galaxy install -r role-requirements.yml
ansible-playbook -i inventory/vagrant playbooks/jenkins.yml  -vvvv
