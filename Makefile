.PHONY: default
default:
	echo "Default Tag"

.PHONY: reposync
reposync:
	rsync -zavh --delete ./ lab01:endore	

.PHONY: create_galaxy3
create_galaxy3:
	mkdir -p ~/galaxy3.baseuci