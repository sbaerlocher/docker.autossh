#!/bin/sh

if [[ ! -d /home/${USER}/.ssh ]]; then
  echo "Creating .ssh"
  mkdir /home/${USER}/.ssh
  chmod 600 /home/${USER}/.ssh
fi

if [ ! -z "$SSH_KEY" ]; then
    echo "Creating ssh Key"
	cat >> /home/${USER}/.ssh/id_rsa <<-EOF
		$SSH_KEY
	EOF
	chmod 600 \
		/home/${USER}/.ssh/id_rsa
fi

echo "Connection Tunnel"
exec autossh -N -M 0 \
	${DEBUG_MODE:-v} \
	-o StrictHostKeyChecking=no \
	-N $SSH_TUNNEL_HOST \
	${SSH_MODE:--L} *:$SSH_LOCAL_PORT:${SSH_REMOTE_HOST:-localhost}:$SSH_REMOTE_PORT \
	-l ${SSH_HOSTUSER:-root} \
	&& while true; do sleep 30; done;
