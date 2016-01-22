#!/bin/bash

echo -n '{"web1": {"hosts": [';
mysql hosting_database -N -e "SELECT CONCAT('\"', domain_name, '\", ') FROM admin_domains \
INNER JOIN admin_dns ON admin_domains.domain_id=admin_dns.domain_id \
INNER JOIN admin_dns_apache ON admin_domains.domain_id=admin_dns_apache.domain_id \
WHERE admin_dns.server_id=1 \
ORDER BY admin_domains.domain_type DESC,admin_domains.domain_id ASC" | tr -d '\n'
echo -n ']}, "web2": {"hosts": [';
mysql hosting_database -N -e "SELECT CONCAT('\"', domain_name, '\", ') FROM admin_domains \
INNER JOIN admin_dns ON admin_domains.domain_id=admin_dns.domain_id \
INNER JOIN admin_dns_apache ON admin_domains.domain_id=admin_dns_apache.domain_id \
WHERE admin_dns.server_id=13 \
ORDER BY admin_domains.domain_type DESC,admin_domains.domain_id ASC" | tr -d '\n'
echo -n ']}, "web3": {"hosts": [';
mysql hosting_database -N -e "SELECT CONCAT('\"', domain_name, '\", ') FROM admin_domains \
INNER JOIN admin_dns ON admin_domains.domain_id=admin_dns.domain_id \
INNER JOIN admin_dns_apache ON admin_domains.domain_id=admin_dns_apache.domain_id \
WHERE admin_dns.server_id=3 \
ORDER BY admin_domains.domain_type DESC,admin_domains.domain_id ASC" | tr -d '\n'
echo -n ']}, ';
echo -n '"_meta": {"hostvars": {'
mysql hosting_database -N -e "SELECT CONCAT('\"', domain_name, '\": {\"hostname\": \"', domain_name, '\", \"ansible_ssh_host\": \"web', admin_dns.server_id, '.hosting_domain.tld\"}, ') FROM admin_domains \
INNER JOIN admin_dns ON admin_domains.domain_id=admin_dns.domain_id \
INNER JOIN admin_dns_apache ON admin_domains.domain_id=admin_dns_apache.domain_id \
WHERE admin_dns.server_id IN(1, 13, 3) \
ORDER BY admin_domains.domain_type DESC,admin_domains.domain_id ASC" | tr -d '\n'
echo -n '}';
echo -n '}';
echo -n '}';
