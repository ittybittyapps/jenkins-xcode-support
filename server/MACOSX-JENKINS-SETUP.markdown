# Setting up Jenkins on Mac OS X
The following are instructions on how to set up Jenkins on a Mac Mini in order to do builds of MacOS X and iOS projects.

My general instruction is not to use the existing MacOS X installer `.pkg` provided by the Hudson project.  Though the instructions below are based in part on work done by the maintainer of that package.

# Pre-requsites
  * Install Java.  Java is no longer shipped with MacOS X.  You can install it by downloading and installing this package from Apple: `http://support.apple.com/kb/DL1421`

## Create a Jenkins user
  * Create a "jenkins" user, give them a password (write the password down somewhere)
  * Login as the `jenkins` user (or `sudo su - jenkins` in a Terminal to switch)

## Install Hudson
  * As the `jenkins` user on the Mac issue the following Terminal commands:
  	mkdir -p ~/Library/Application\ Support/Jenkins/Home
  	cd ~/Library/Application\ Support/Jenkins
  	curl -L http://mirrors.jenkins-ci.org/war/latest/jenkins.war -o jenkins.war
    mkdir ~/Applications
    
  * Copy the `Applications/Jenkins` script from this repository into `~/Applications` for the `jenkins` user.
  
  * Copy the `Preferences/orj.jenkins-ci.plist` file from this repository into `~/Library/Preferences` for the `jenkins` user.
  
  * Edit the preferences file as necessary.  In particular the `httpListenAddress` and `httpsListenAddress` items will need to be updated with appropreiate IPs or hostnames.  You might also want to change the `httpPort` and `httpsPort`.  You can edit this XML file directly or use the `defaults` command.  Eg:
  ** `defaults write org.jenkins-ci.plist httpsPort 8443`

## Start Hudson
  * Use the following command to launch hudson:
	launchctl load /Library/LaunchDaemons/org.jenkins-ci.plist
  * Jenkins logs to syslog so you can see its output in Console or via the file `/var/log/system.log`.
  
# Configuring Hudson
  * You should now be able to visit http://localhost:8080/ (or whatever host/port) you configured previously) to start configuring Hudson to your liking.
  
## Plugin Specific Setup
### Git
#### Set up SSH (for git)
  * As the `jenkins` user run the folowing commands:
	cd ~
	mkdir .ssh
	chmod 700 .ssh
	ssh-keygen
  * **Don't** give the generated key a pass-phrase.
  



