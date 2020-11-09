# Oracle Workflow Script

We can automate the execution of a SQL script against an Oracle Virtual database using a workflow:

1. Install workflow.sh into /act/scripts and make it executable. You should not need to edit this file at all. All variables will be learned during run time. 
1. Install workflow.sql into /act/scripts/ Edit the file as needed to add the commands needed. 
1. Create a workflow to run the workflow.sh script. The workflow script box needs to contain both the script file and the SQL file, so state both scripts with no paths and a space in between like this: workflow.sh workflow.sql
1. When the workflow is run, after creating the Virtual Database the Actifio Connector will run the SQL script.

To manually test outside a workflow (where the DB is already mounted) do the following as root user:

1.  Set the orahome variable,  e.g.     export orahome=/home/oracle/app/oracle/product/12.2.0/dbhome_1
1.  Set databasesid variable (the SID of the Oracle DB),  e.g.   export databasesid=demodb
1.  Run the sh script using this syntax (change .sh script and .sql script names to suit):    ./workflow.sh test workflow.sql

# su -m is Linux only

The script uses **su -m** to preserve the settings when switching to the Oracle user.   This option does not appear to be supported on non-Linux, so if you get an error, use workflow_AIX.sh instead.  

This script also assumes bash is available on your system.   

# Skip execution if it is a remount situation

Normally script are executed to prepare the database when initially created, and are not to be executed if the DB is remounted for anyt reason (after an unmount operation or due to an automatic remount after a DB server reboot).  Script now takes care of remount and is not executed in that case. 

# Running as a mount job superscript

The method above is for workflows.   You may want to run exactly the same script as part of a regular mount.   In which case we use super-scripts.
We install and edit the scripts exactly as above.
We then run this script in a superscript in the post phase by adding the following where you change the name of the workflow.sh and workflow.sql to match.  The phase must be POST:

~~~
-script "name=workflow.sh:phase=POST:args=workflow.sql"
~~~
A complete mount command would look something like this:
~~~
udstask mountimage -image Image_8337138 -host orademodb -restoreoption 'provisioningoptions=<provisioning-options><databasesid>avtest</databasesid><username>oracle</username><orahome>/u01/app/oracle/product/11.2.0.4/ora_1</orahome><nonid>false</nonid><noarchivemode>false</noarchivemode><clearlog>false</clearlog><notnsupdate>false</notnsupdate><nooratabupdate>false</nooratabupdate><rrecovery>true</rrecovery><useexistingorapw>false</useexistingorapw></provisioning-options>' -nowait -script "name=workflow.sh:phase=POST:args=workflow.sql"
~~~


