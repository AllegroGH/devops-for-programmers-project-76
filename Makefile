.PHONY: install-deps prepare

install-deps:
	ansible-galaxy install -r requirements.yml

prepare:
	ansible-playbook -i inventory.ini playbook.yml --vault-password-file .vault-password
