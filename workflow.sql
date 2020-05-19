/* Leave the two lines below in place as they ensure the workflow fails if the SQL fails */
WHENEVER OSERROR EXIT FAILURE
WHENEVER SQLERROR EXIT SQL.SQLCODE

/* Insert all your commands here.   */
SELECT * FROM user_users;

/* Leave the exit in place so we exit cleanly */
exit;
