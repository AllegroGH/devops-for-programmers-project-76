.PHONY: install-deps prepare deploy

install-deps:
	ansible-galaxy install -r requirements.yml

prepare:
	ansible-playbook -i inventory.ini playbook.yml --vault-password-file .vault-password

deploy:
	ansible-playbook -i inventory.ini deploy.yml --vault-password-file .vault-password
