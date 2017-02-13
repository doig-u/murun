# murun
murun (MUlti RUN) is a tool for run one or multiple scripts or folders on one or multiple servers.

Usage: murun <hosts|[user@]address[:port]> <action> [action2] ...

Args:
- hosts - a single host address or a file with addresses list for ssh. Default port is 22.
- action - a script or a folder with a execution script 'run' and any files to 'scp' and local execution on each host from a 'hosts' file. Note that 'run' will be run from sudo!

Examples (tested on Vagrant Ubuntu 16.04):

Upgrade Ubuntu on all web servers from the hosts_web file:
'$ murun hosts_web server/ubuntu-upgrade.sh'

Initialize a new web server:
'$ murun iam@web-new.example.com:2222 server/first-configure.sh server/ubuntu-upgrade.sh nginx/'
