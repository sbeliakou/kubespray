help:
	@echo make vagrant_init
	@echo make vagrant_up

vagrant_init:
	@mkdir -p inventory/vagrant
	@cp -r inventory/sample/group_vars inventory/vagrant/group_vars
	@mkdir -p vagrant
	@echo '$$inventory = "inventory/vagrant"' >> vagrant/config.rb

vagrant_up:
	@vagrant up
	@KUBECONFIG=$(shell pwd)/.vagrant/provisioners/ansible/inventory/artifacts/admin.conf bash

mitogen:
	ansible-playbook -c local mitogen.yaml -vv
clean:
	rm -rf dist/
	rm *.retry
