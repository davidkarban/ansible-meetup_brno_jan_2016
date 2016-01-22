#!/bin/bash

ID=`mysql hosting_database -N -e "SELECT domain_id FROM admin_domains WHERE domain_name='$1'"` export ID;

mysql hosting_database -e "UPDATE admin_dns_settings SET dns_set_value='217.16.190.85' WHERE domain_id = $ID AND dns_set_type='A' AND dns_set_value='$2'";

