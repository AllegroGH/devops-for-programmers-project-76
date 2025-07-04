.PHONY: install-deps deploy prepare redmine datadog edit-secret

install-deps:
	ansible-galaxy install -r requirements.yml

deploy:
	ansible-playbook -i inventory.ini playbook.yml --vault-password-file .vault-password

prepare:
	ansible-playbook -i inventory.ini playbook.yml --vault-password-file .vault-password --tags setup

redmine:
	ansible-playbook -i inventory.ini playbook.yml --vault-password-file .vault-password --tags redmine

datadog:
	ansible-playbook -i inventory.ini playbook.yml --vault-password-file .vault-password --tags datadog

edit-secret:
	ansible-vault edit group_vars/webservers/secrets.yml --vault-password-file .vault-password