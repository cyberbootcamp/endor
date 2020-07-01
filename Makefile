.PHONY: default
default:
	echo "Default Tag"

.PHONY: reposync
reposync:
	rsync -zavh --delete ./ lab01:endore	
