#!/bin/bash

export AUTH_KEYS=~/.ssh/authorized_keys
export ENDORE_KEY=/.keys/id_endore

ls ~/.ssh || mkdir -p ~/.ssh/ && chmod 0700 ~/.ssh

ls ${AUTH_KEYS} || touch ${AUTH_KEYS} && chmod 0600 ${AUTH_KEYS}

ls ${ENDORE_KEY} || ssh-keygen -f ${ENDORE_KEY}
ls ${ENDORE_KEY}.pub && cp ${AUTH_KEYS} /.keys/. && \
  cat ${ENDORE_KEY}.pub >> /.keys/authorized_keys && \
  sort -u /.keys/authorized_keys > ${AUTH_KEYS}