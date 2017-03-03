# gocd-setup
Some setup stuff for the gocd lab

## clone-go-agent.sh
Useful to run multiple go-agents on the same host.
See: https://docs.gocd.io/current/advanced_usage/admin_install_multiple_agents.html

* Install your first agent with the installer
* You can now start or stop the second agent using /etc/init.d/go-agent-1 (passing it the start or stop) arguments as usual. Logs will be written to /var/log/go-agent-1/.
* Repeat this process for more agents. Just change the suffix "1" to "2" and so on.
* To enable starting the go-agent service during system boot:

    #### on Debian:
    ```insserv go-agent-1```

    #### on Ubuntu:
    ```update-rc.d go-agent-1 defaults```

    #### on Centos and Redhat:
    ```chkconfig go-agent-1 on```
