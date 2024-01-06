#!/bin/sh

set -e

ansible-playbook -K -i inventory.ini playbooks/install.yml
