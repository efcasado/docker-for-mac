#!/bin/sh

readonly HOME_DIR=/home/vagrant
readonly SSH_DIR=${HOME_DIR}/.ssh
readonly AUTHORIZED_KEYS_FILE=${SSH_DIR}/authorized_keys

for f in ${SSH_DIR}/*.pub
do
    echo $f
    public_key=$(cat ${f})
    grep -qxF "${public_key}" ${AUTHORIZED_KEYS_FILE} || echo "${public_key}" >> ${AUTHORIZED_KEYS_FILE}
done


cat <<EOF >> ~/.profile
if [ ! -S ~/.ssh/ssh_auth_sock ]; then
  eval \$(ssh-agent)
  ln -sf "\$SSH_AUTH_SOCK" ~/.ssh/ssh_auth_sock
fi
export SSH_AUTH_SOCK=~/.ssh/ssh_auth_sock
ssh-add -l > /dev/null || ssh-add
EOF

cat <<EOF >> ~/.bashrc
if [ ! -S ~/.ssh/ssh_auth_sock ]; then
  eval \$(ssh-agent)
  ln -sf "\$SSH_AUTH_SOCK" ~/.ssh/ssh_auth_sock
fi
export SSH_AUTH_SOCK=~/.ssh/ssh_auth_sock
ssh-add -l > /dev/null || ssh-add
EOF
