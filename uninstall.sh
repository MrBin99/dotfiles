#!/bin/bash

set -e

export ANSIBLE_ROLES_PATH=$PWD/roles

if [[ $# > 0 ]]; then
  ANSIBLE_ARGS="cwd=$PWD roles_to_run='$@'"
else
  ANSIBLE_ARGS="cwd=$PWD roles_to_run=all"
fi

ansible-playbook -K -M ./library/* -i inventory.ini playbooks/uninstall.yml -e $ANSIBLE_ARGS
