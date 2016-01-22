#!/bin/bash

ID=`mysql hosting_database -N -e "SELECT domain_id FROM admin_domains WHERE domain_name='$1'"` export ID;

mysql hosting_database -e "UPDATE admin_dns SET server_id = '4' WHERE domain_id = '$ID'";
mysql hosting_database_ftp -e "UPDATE users SET server_id = '4' WHERE domain_id = '$ID'"

