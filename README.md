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

