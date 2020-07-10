#!/bin/bash -x

export THEUSER="thedr"
export THEHOME="/thedr"
export SSHDIR=${THEHOME}/.ssh

export AUTH_KEYS=${SSHDIR}/authorized_keys
export VAGRANT_KEY=${SSHDIR}/id_vagrant

function remount_ssh_dir () {
     mkdir -p ${SSHDIR}/config.d
     echo 'Include ~/.ssh/config.d/*' > ${SSHDIR}/config
     cp /ansible/ssh_config/endor ${SSHDIR}/config.d/.
}

remount_ssh_dir


ls ${SSHDIR} || mkdir -p ${SSHDIR} && chmod 0700 ${SSHDIR}

ls ${AUTH_KEYS} || touch ${AUTH_KEYS} && chmod 0600 ${AUTH_KEYS}

ls ${VAGRANT_KEY} || ssh-keygen -N ""  -f ${VAGRANT_KEY}
ls ${VAGRANT_KEY}.pub && cat ${VAGRANT_KEY}.pub >> ${AUTH_KEYS} && \
cat ${SSHDIR}/*.pub >> ${AUTH_KEYS}
#cp ${AUTH_KEYS} ${AUTH_KEYS}.presort
#  sort -u ${AUTH_KEYS}.presort -o ${AUTH_KEYS}

     chown -R ${THEUSER}:${THEUSER} ${THEHOME}
     chmod -R 0700 ${THEHOME}
