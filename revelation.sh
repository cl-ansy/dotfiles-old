#!/bin/bash
# ================================================================
# Easy dev environment setup
# Created for Fedora 19 and possibly other RPM-based systems
# by Chris Lansing
# run with 'sudo bash ./revelation.sh'
# ================================================================

# Variables used in this script. Change as necessary
# --------------------------------------------------
sublimebuild='sublime_text_3_build_3047_x64.tar.bz2'
user='clansing'

# Install git and subversion
# --------------------------
yum -y install git subversion

# Create data folder in root to store repos
# -----------------------------------------
mkdir /data

# Checkout my personal git repo
# You will need to manually login here when prompted
# --------------------------------------------------
mkdir /data/cslansing-com
cd /data/cslansing-com
git init
git remote add origin https://github.com/cslansing/cslansing-com.git
git pull origin master
cd

# Checkout necessary morris repos
# You will need to manually login here when prompted
# You also need to be either on the morris network or connected to the VPN to have access
# ---------------------------------------------------------------------------------------
svn co https://development.morristechnology.com/svn/atx/trunk /data/ask
svn co https://development.morristechnology.com/svn/marketplace/branches/autos /data/autos
svn co https://development.morristechnology.com/svn/marketplace/branches/brains /data/brains
svn co https://development.morristechnology.com/svn/community/trunk /data/community
svn co https://development.morristechnology.com/svn/daily/branches/three /data/daily
svn co https://development.morristechnology.com/svn/daily/trunk /data/daily_old
svn co https://development.morristechnology.com/svn/django/branches/django_1 /data/django_1
svn co https://development.morristechnology.com/svn/django/branches/django_96 /data/django_96
svn co https://development.morristechnology.com/svn/marketplace/branches/iservices /data/dtimarketplace
svn co https://development.morristechnology.com/svn/marketplace/branches/baseview /data/marketplace
svn co https://development.morristechnology.com/svn/media/trunk /data/media
svn co https://development.morristechnology.com/svn/realestate/trunk /data/realestate
svn co https://development.morristechnology.com/svn/r_guide/branches/rlp_searchengine /data/rguide
svn co https://development.morristechnology.com/svn/sports/trunk /data/sports
svn co https://development.morristechnology.com/svn/tools/trunk /data/tools
svn co https://development.morristechnology.com/svn/xen /data/xen

# Get Django-1.5.2 for personal site development
# ----------------------------------------------
cd /data
wget -O Django-1.5.2.tar.gz https://www.djangoproject.com/download/1.5.2/tarball/
tar xzvf Django-1.5.2.tar.gz
rm -r Django-1.5.2.tar.gz
cd

# Create morris group with rwxrwx--- access to /data and all subdirs and subfiles
# -------------------------------------------------------------------------------
groupadd morris
chown -R root:morris /data
chmod -R 770 /data

# Create developer group 
# Give this group rwxrwxr-x permission to /data (non recursive, overwrite morris)
# and rwxrwxr-x to /data/cslansing-com and /data/Django-1.5.2 (recursive)
# -----------------------------------------------------------------------
groupadd devs
chown root:devs /data
chown -R root:devs /data/cslansing-com
chown -R root:devs /data/Django-1.5.2
chmod 774 /data
chmod -R 774 /data/cslansing-com
chmod -R 774 /data/Django-1.5.2

# Add user to the newly create groups
# You will need to relog for these changes to take effect
# -------------------------------------------------------
usermod -a -G morris $user
usermod -a -G devs $user

# Add user to sudo group ( /etc/sudoers )
# ---------------------------------------
# echo '$user ALL=(ALL) ALL' >> /etc/sudoers

# Add google-chrome repository
# ----------------------------
touch /etc/yum.repos.d/google-chrome.repo
echo '[google-chrome]' >> /etc/yum.repos.d/google-chrome.repo
echo 'name=google-chrome - 64-bit' >> /etc/yum.repos.d/google-chrome.repo
echo 'baseurl=http://dl.google.com/linux/chrome/rpm/stable/x86_64' >> /etc/yum.repos.d/google-chrome.repo
echo 'enabled=1' >> /etc/yum.repos.d/google-chrome.repo
echo 'gpgcheck=1' >> /etc/yum.repos.d/google-chrome.repo
echo 'gpgkey=https://dl-ssl.google.com/linux/linux_signing_key.pub' >> /etc/yum.repos.d/google-chrome.repo

# Install google-chrome
# ---------------------
yum -y install google-chrome-stable

# Install chat clients
# --------------------
yum -y install xchat pidgin

# Install apache and mysql
# ------------------------
yum -y install httpd mod_wsgi mysql mysql-server MySQL-python

# Install PIL (Python Image Library. Required for running local server)
# ---------------------------------------------------------------------
yum -y install python-imaging

# Install vim and sublime text 3
# ------------------------------
yum -y install vim
cd /opt
wget http://c758482.r82.cf2.rackcdn.com/$sublimebuild
tar -xvf $sublimebuild
ln -s /opt/sublime_text_3/sublime_text /usr/bin/sublime
rm -rf $sublimebuild
cd

# Get Wine and PlayOnLinux for IE testing
# ------------------------------
#yum -y install wine
#yum -y install gnupg
#cd /etc/yum.repos.d
#wget http://rpm.playonlinux.com/playonlinux.repo
#yum -y update
#yum -y install playonlinux

# Install i3 tiling window manager
# --------------------------------
yum -y install i3

# Get updates
# -----------
yum -y update

# Logout of root
# --------------
exit
