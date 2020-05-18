# OracleWorkflowScript

We can automate the execution of a SQL script against an Oracle Virtual database using a workflow:

Install workflow.sh into /act/scripts and make it executable. You should not need to edit this file at all. All variables will be learned during run time. This is different to the initial version of the script.
Install workflow.sql into /act/scripts/ Edit the file as needed to add the commands needed. 
Create a workflow to run the workflow.sh script. The worflow script box needs to contain both the script file and the SQL file, so state both scripts with no paths and a space in between like this: workflow.sh workflow.sql
When the workflow is run, after creating the Virtual Database the Actifio Connector will run the SQL script.
