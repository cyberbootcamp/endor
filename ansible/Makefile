PWD = $(shell pwd)
.PHONY: default
default:
	echo default target

.PHONY: build
build:
	sudo -E docker build -t ansible .
	sudo -E docker tag ansible kirscht/ansible-docker:latest
	sudo -E docker push kirscht/ansible-docker:latest

.PHONY: start
start:
	#sudo -E docker run -d -p 3128:3128 -p 3129:3129 --name squid squid
	sudo -E docker run -d --name ansible \
		--mount type=bind,source="$(PWD)",target="/ansible" \
		--mount type=bind,source="$(PWD)/etc/ansible",target="/etc/ansible" \
		--mount type=bind,source="$(PWD)/log",target="/var/log/entrypoint" \
		kirscht/ansible-docker:latest
		#

.PHONY: connect
connect:
	sudo -E docker exec -it ansible /bin/bash

.PHONY: stop
stop:
	sudo -E docker stop ansible

.PHONY: rm
rm: stop
	sudo -E docker rm ansible

.PHONY: pull
pull:
	sudo -E docker pull kirscht/ansible-docker:latest