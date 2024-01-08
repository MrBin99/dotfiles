#!/bin/sh

set -e

export ANSIBLE_ROLES_PATH=$PWD/roles

ansible-playbook -K -M ./library/* -i inventory.ini playbooks/uninstall.yml -e '{"cwd": "'$PWD'"}'
