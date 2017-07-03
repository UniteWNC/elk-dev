# elk-dev
elk stack development

## Overview
Repository for code development on Elastic Search for UniteWNC.  This repo contains all the necessary config to spin up a basic development VM on your laptop
Using [Vagrant](https://www.vagrantup.com/).

## Installing Vagrant
To get up and running you will need [VirtualBox](https://www.virtualbox.org/wiki/VirtualBox) and [Vagrant](https://www.vagrantup.com/).  If you're using OS X, its recommended
to install these using homebrew, as it makes the process simpler.  Instructions to accomplish this are listed below:

#### Homebrew
Install homebrew from [here](https://brew.sh/).  There are instructions listed at the link.

#### Virtualbox
Once homebrew is installed, you can use it to install Virtualbox.  Open a terminal window and type:

`brew install caskroom/cask/virtualbox`

#### Vagrant
Similarly, you can install vagrant with homebrew:

`brew install caskroom/cask/vagrant`

You can verify the Vagrant install by testing the Vagrant command:

```
$ vagrant
Usage: vagrant [options] <command> [<args>]

    -v, --version                    Print the version and exit.
    -h, --help                       Print this help.

Common commands:
     box             manages boxes: installation, removal, etc.
     connect         connect to a remotely shared Vagrant environment
     destroy         stops and deletes all traces of the vagrant machine
     global-status   outputs status Vagrant environments for this user
     halt            stops the vagrant machine
     help            shows the help for a subcommand
     init            initializes a new Vagrant environment by creating a Vagrantfile
     login           log in to HashiCorp's Atlas
     package         packages a running vagrant environment into a box
     plugin          manages plugins: install, uninstall, update, etc.
     port            displays information about guest port mappings
     powershell      connects to machine via powershell remoting
     provision       provisions the vagrant machine
     push            deploys code in this environment to a configured destination
     rdp             connects to machine via RDP
     reload          restarts vagrant machine, loads new Vagrantfile configuration
     resume          resume a suspended vagrant machine
     share           share your Vagrant environment with anyone in the world
     snapshot        manages snapshots: saving, restoring, etc.
     ssh             connects to machine via SSH
     ssh-config      outputs OpenSSH valid configuration to connect to the machine
     status          outputs status of the vagrant machine
     suspend         suspends the machine
     up              starts and provisions the vagrant environment
     version         prints current and latest Vagrant version

For help on any individual command run `vagrant COMMAND -h`

Additional subcommands are available, but are either more advanced
or not commonly used. To see all subcommands, run the command
`vagrant list-commands`.
```

Documentation on the individual commands can be found [here](https://www.vagrantup.com/docs/cli/).

## Usage

With Vagrant is installed, you can create a new development VM by changing to the vagrant directory included in this repo and issuing a `vagrant up`.
This will use the included Vagrant file to create a new Elastic Search VM on your system.  

Once the setup process completes, you can access the VM by issuing a `vagrant ssh`.  This will open a new ssh session on the guest vm as the vagrant user.
This user has sudo access, so you can escalate to root as needed.

Additionally, the Kibana frontend will be accessible on your system at `http://localhost:8080`.  The login credentials for the web server are:

```
user: elastic
pass: changeme
```


