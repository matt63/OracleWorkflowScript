# OracleWorkflowScript

We can automate the execution of a SQL script against an Oracle Virtual database using a workflow:

1. Install workflow.sh into /act/scripts and make it executable. You should not need to edit this file at all. All variables will be learned during run time. 
1. Install workflow.sql into /act/scripts/ Edit the file as needed to add the commands needed. 
1. Create a workflow to run the workflow.sh script. The worflow script box needs to contain both the script file and the SQL file, so state both scripts with no paths and a space in between like this: workflow.sh workflow.sql
1. When the workflow is run, after creating the Virtual Database the Actifio Connector will run the SQL script.

To manually test outside a workflow (where the DB is already mounted) do the following as root user:

1.  Set the orahome variable,  e.g.     export orahome=/home/oracle/app/oracle/product/12.2.0/dbhome_1
1.  Set databasesid variable (the SID of the Oracle DB),  e.g.   export databasesid=demodb
1.  Run the sh script using this syntax (change .sh script and .sql script names to suit):    ./workflow.sh test workflow.sql

# Running as a superscript

You can run this script in a superscript in the post phase by adding the following where you change the name of the workflow.sh and workflow.sql to match.  The phase must be POST:

~~~
-script "name=workflow.sh:phase=POST:args=workflow.sql"
~~~
A complete mount command would look something like this:
~~~
udstask mountimage -image Image_8337138 -host orademodb -restoreoption 'provisioningoptions=<provisioning-options><databasesid>avtest</databasesid><username>oracle</username><orahome>/u01/app/oracle/product/11.2.0.4/ora_1</orahome><nonid>false</nonid><noarchivemode>false</noarchivemode><clearlog>false</clearlog><notnsupdate>false</notnsupdate><nooratabupdate>false</nooratabupdate><rrecovery>true</rrecovery><useexistingorapw>false</useexistingorapw></provisioning-options>' -nowait -script "name=workflow.sh:phase=POST:args=workflow.sql"
~~~
