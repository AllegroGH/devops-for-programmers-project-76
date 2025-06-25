.PHONY: install-deps deploy prepare redmine edit-secret

install-deps:
	ansible-galaxy install -r requirements.yml

deploy:
	ansible-playbook -i inventory.ini playbook.yml --vault-password-file .vault-password

prepare:
	ansible-playbook -i inventory.ini playbook.yml --vault-password-file .vault-password --tags setup

redmine:
	ansible-playbook -i inventory.ini playbook.yml --vault-password-file .vault-password --tags redmine

edit-secret:
	ansible-vault edit group_vars/secrets.yml --vault-password-file .vault-password