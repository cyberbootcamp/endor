#!/bin/bash

export AUTH_KEYS=~/.ssh/authorized_keys
export ENDOR_KEY=~/.ssh/id_endor

ls ~/.ssh || mkdir -p ~/.ssh/ && chmod 0700 ~/.ssh

ls ${AUTH_KEYS} || touch ${AUTH_KEYS} && chmod 0600 ${AUTH_KEYS}

ls ${ENDOR_KEY} || ssh-keygen -f ${ENDOR_KEY}
ls ${ENDOR_KEY}.pub && cat ${ENDOR_KEY}.pub >> ${AUTH_KEYS} && \
  sort -u ${AUTH_KEYS} > ${AUTH_KEYS}
