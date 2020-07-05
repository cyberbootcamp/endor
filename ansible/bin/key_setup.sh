#!/bin/bash

export AUTH_KEYS=~/.ssh/authorized_keys
export ENDOR_KEY=/.keys/id_endor

ls ~/.ssh || mkdir -p ~/.ssh/ && chmod 0700 ~/.ssh

ls ${AUTH_KEYS} || touch ${AUTH_KEYS} && chmod 0600 ${AUTH_KEYS}

ls ${ENDOR_KEY} || ssh-keygen -f ${ENDOR_KEY}
ls ${ENDOR_KEY}.pub && cp ${AUTH_KEYS} /.keys/. && \
  cat ${ENDOR_KEY}.pub >> /.keys/authorized_keys && \
  sort -u /.keys/authorized_keys > ${AUTH_KEYS}
