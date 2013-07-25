puppet-netvault
===============

This puppet module automates installation/management of the Bakbone netvault package

Parameters

<br>
contract: this is the client machine name
<br>
backupip: this is the IP of the client when you connect it to the netvault backup server
<br>
<h1>Usage:<h1>

It wil download the netvault package from the puppetmaster , inside the .tar.gz file there is a respone file:

<br>HOST_OS=Linux 
<br>
PKG_BASE=/usr/netvault 
<br>
DB_DIR=/usr/netvault/db 
<br>
LOGICAL_NAME=puppet
<br>
PASSWORD=SECRET
<br>
HOMEFILE=/etc/.nv6_home 
<br>
NVLANGUAGE=English 
<br>
CHOSEN_CLASSES="core dataplugin devicectl gui onlinehelp" 
<br>
COMPONENT_core=TRUE 
<br>
COMPONENT_dataplugin=TRUE 
<br>
COMPONENT_devicectl=TRUE 
<br>
COMPONENT_gui=FALSE
<br>
COMPONENT_onlinehelp=TRUE 

You need to edit the password file , so the password will be set correctly , in the next update this wil be done with
the paramater file.

