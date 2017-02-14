# murun
murun (MUlti RUN) is a tool for run one or multiple scripts or folders on one or multiple servers.

It is for configuration management. Put 'murun' and your admin, deploy scripts and configs to project folder and add to private repo, for ex.

Use a ssh key! If your key have a passphrase, make ``eval `ssh-agent` && ssh-add`` for one time passphrase request.

Usage: murun hosts|[user@]address[:port] action [action2] ...

Args:
- hosts - a single host address or a file with addresses list for ssh. Default port is 22.
- action - a script or a folder with an execution script 'run' and any files to 'scp' and local execution on each host from a 'hosts' file. Note that 'run' will be run from sudo!

## Examples

```
$ git clone git@github.com:doig-u/murun.git murun
$ cd murun/
```

Next, for ex, run a new vagrant ubuntu 16.04 intance (these examples tested on Vagrant Ubuntu 16.04).

Upgrade Ubuntu on all web servers from the hosts_web file:

`$ ./murun hosts_web server/ubuntu-upgrade.sh`

Initialize a new web server:

`$ ../murun localhost:2222 server/first-configure.sh server/ubuntu-upgrade.sh nginx/`
