# murun
murun (MUlti RUN) is a tool for run scripts on one or multiple servers.

It is for configuration management. Like [Ansible](https://www.ansible.com/) but much simple.
Put 'murun' and your admin, deploy scripts and configs to a project folder and add to a private repo, for ex.
Murun works over ssh, so use an ssh key. _HINT: If the key has a passphrase, make ``eval `ssh-agent` && ssh-add`` for one time passphrase request._

Usage: `murun hosts|[user@]address[:port] \[sudo-user@\]folder/script`

Args:

- hosts|address - a file with addresses list for ssh or a single host. Default port is 22.
- folder/script - a 'folder' to 'scp' to 'adress:/home/user/$TMPDIR' and then 'sudo -u sudo-user script'. The folder can contain another needed sub-scripts, configs etc. By default the 'sudo-user' is the 'root'. After successful script execution the folder '$TMPDIR' will be removed.


## Examples

For ex, run a new vagrant ubuntu 16.04 intance (these examples tested on Vagrant Ubuntu 16.04):

```
$ cd examples

# Upgrade all hosts:
$ ../murun hosts_all common/ubuntu-upgrade.sh

# Initialize a new host as web frontend. first-configure.sh also includes ubuntu-upgrade.sh:
$ ../murun iam@web3.example.com:2222 common/first-configure.sh
$ ../murun iam@web3.example.com:2222 nginx/install.sh

# Initialize a new host as web frontend with specified role:
$ ../murun iam@web3.example.com:2222 role_web.sh

# Or for Python scripts (or any executables):
$ ../murun iam@web3.example.com:2222 role_web.py
```

You can make hosts_all file for common tasks such ubuntu-upgrade.sh, actions like db/setup_master.sh and db/setup_replica.sh, etc.
And try to keep your actions idempotent. 
