#!/bin/bash
#
# Wrapper script for commands executed from monit start/stop programm.
# Due to limitation of monit[1] we need to restore all environment variables
# in order to make the cartridge control scripts to succeed.
#
# [1] http://mmonit.com/wiki/Monit/FAQ#execution
#

if [ ! -f ~/monit/var/env ]; then
  echo "ERROR: Unable to restore OpenShift environment."
  exit 1
fi

( export `cat ~/monit/var/env` && "$@" >>${OPENSHIFT_MONIT_DIR}log/monit.log 2>&1 )
