#!/usr/bin/env bash
set -e
# Creates a new go-agent with the ID you specify as forst argument
AGENTID=$1
if [ A == A${AGENTID} ]
  then
    echo "Usage (as root): $(basename $0) <AGENT_ID>"
    exit 1
fi

# Make sure only root can run our script
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

cp /etc/init.d/go-agent /etc/init.d/go-agent-${AGENTID}
sed -i 's/# Provides: go-agent$/# Provides: go-agent-${AGENTID}/g' /etc/init.d/go-agent-${AGENTID}
ln -s /usr/share/go-agent /usr/share/go-agent-${AGENTID}
cp -p /etc/default/go-agent /etc/default/go-agent-${AGENTID}
mkdir /var/{lib,log}/go-agent-${AGENTID}
chown go:go /var/{lib,log}/go-agent-${AGENTID}

echo OK
