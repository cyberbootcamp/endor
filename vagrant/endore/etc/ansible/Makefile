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
	sudo -E docker run -d --name ansible kirscht/ansible-docker:latest

.PHONY: connect
connect:
	sudo -E docker exec -it ansible /bin/bash

.PHONY: stop
stop:
	sudo -E docker stop ansible

.PHONY: rm
rm: stop
	sudo -E docker rm ansible
