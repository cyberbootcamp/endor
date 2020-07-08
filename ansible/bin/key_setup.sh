#!/bin/bash -x

export AUTH_KEYS=~/.ssh/authorized_keys
export VAGRANT_KEY=~/.ssh/id_vagrant

function remount_ssh_dir () {
     mkdir -p /home/vagrant/.ssh/config.d
     echo 'Include ~/.ssh/config.d/*' > /home/vagrant/.ssh/config
     cp /ansible/ssh_config/endor /home/vagrant/.ssh/config.d/.
     chown -R vagrant:vagrant /home/vagrant/.ssh
     chmod -R 0700 /home/vagrant/.ssh
}

remount_ssh_dir


ls ~/.ssh || mkdir -p ~/.ssh/ && chmod 0700 ~/.ssh

ls ${AUTH_KEYS} || touch ${AUTH_KEYS} && chmod 0600 ${AUTH_KEYS}

ls ${VAGRANT_KEY} || ssh-keygen -N ""  -f ${VAGRANT_KEY}
ls ${VAGRANT_KEY}.pub && cat ${VAGRANT_KEY}.pub >> ${AUTH_KEYS} && \
cat ~/.ssh/*.pub >> ${AUTH_KEYS}
#cp ${AUTH_KEYS} ${AUTH_KEYS}.presort
#  sort -u ${AUTH_KEYS}.presort -o ${AUTH_KEYS}
