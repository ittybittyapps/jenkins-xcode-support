# Setting up Jenkins on Mac OS X
The following are instructions on how to set up Jenkins on a Mac Mini in order to do builds of MacOS X and iOS projects.

My general instruction is not to use the existing MacOS X installer `.pkg` provided by the Hudson project.  Though the instructions below are based in part on work done by the maintainer of that package.

# Pre-requsites
  * Install Java.  Java is no longer shipped with MacOS X.  You can install it by downloading and installing this package from Apple: `http://support.apple.com/kb/DL1421`
  * Install Xcode.  Download Xcode 4.1 from the Mac App Store.
  
## Create a Jenkins user
  * Create a "jenkins" user, give them a password (write the password down somewhere)
  * Login as the `jenkins` user (or `sudo su - jenkins` in a Terminal to switch)

## Install Hudson
  * As the `jenkins` user on the Mac issue the following Terminal commands:

```
mkdir -p ~/Library/Application\ Support/Jenkins/Home
cd ~/Library/Application\ Support/Jenkins
curl -L http://mirrors.jenkins-ci.org/war/latest/jenkins.war -o jenkins.war
mkdir ~/Applications
```

  * Copy the `Applications/Jenkins` script from this repository into `~/Applications` for the `jenkins` user.
  
  * Copy the `Preferences/orj.jenkins-ci.plist` file from this repository into `~/Library/Preferences` for the `jenkins` user.
  
  * Edit the preferences file as necessary.  In particular the `httpListenAddress` and `httpsListenAddress` items will need to be updated with appropreiate IPs or hostnames.  You might also want to change the `httpPort` and `httpsPort`.  You can edit this XML file directly or use the `defaults` command.  Eg:
  ** `defaults write org.jenkins-ci httpsPort 8443`

## Start Jenkins
  * Use the following command to launch hudson:
	launchctl load /Library/LaunchDaemons/org.jenkins-ci.plist
  * Jenkins logs to syslog so you can see its output in Console or via the file `/var/log/system.log`.
  
# Configuring Jenkins
  * You should now be able to visit http://localhost:8080/ (or whatever host/port) you configured previously) to start configuring Jenkins to your liking.

## Setting the Workspace data directory
  When installing on a Mac Mini server with a 2nd hard drive it can be a good idea to set the Jenkins *Workspace Root Directory* to the second hard drive rather than the default location.
  * In the Mac OS X Finder rename the drive `Macintosh HD2` to `Data`
  * From the Jenkins web interface select *Manage Jenkins* and update the *Workspace Root Directory* to be `/Volumes/Data/JenkinsData/workspace/${ITEM_FULLNAME}`.
  
## Other global settings to enable
  * Prevent Cross Site Request Forgery exploits (turn on and use the default Crumb Issuer).
  * Change Subversion Workspace Version to 1.6.
  
## Plugins to install
  Installing the following plugins is probably a good idea:
  * TestFlight Plugin
  * Active Directory Plugin
  * Audit Trail Plugin
  * Favorite Plugin
  * View Job Filters
  * All Changes Plugin
  * Analysis Collector Plugin
  * Clang Scan-Build Plugin
  * Disk Usage Plugin
  * Doxygen Plugin
  * Log Parser Plugin
  * Task Scanner Plugin
  * Warnings Plugin
  * Post Build Task
  * Promoted Builds Plugin
  * Build Keeper Plugin
  * Build Timeout Plugin
  * Mask Passwords Plugin
  * Release Plugin
  * Version Number Plugin
  * Timestamper
  * Build Secret Plugin
  * Project Statistics Plugin
  * Backup Plugin
  * Claim Plugin
  * Git Plugin
  * Hudson Personal View
  
## Plugin Specific Setup
### Git
#### Set up SSH (for git)
  * As the `jenkins` user run the folowing commands:

```
cd ~
mkdir .ssh
chmod 700 .ssh
ssh-keygen
ssh <git servername>
```

  * **Don't** give the generated key a pass-phrase.
  



