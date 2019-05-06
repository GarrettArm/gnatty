#!/usr/bin/env bash

set -e

echo "root:$SSH_PASSWORD" | chpasswd

/usr/sbin/sshd -D