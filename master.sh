apt-get install puppet puppetmaster
touch /etc/puppet/manifests/site.pp
sed -i '/puppetmaster/d' /etc/hosts
sed -i '/private/d' /etc/puppet/autosign.conf
echo -e 127.0.0.1 "$(facter fqdn) puppetmaster\n$(facter ipaddress) $(facter fqdn) puppetmaster" >> /etc/hosts
echo -e '*.netbuilder.private' >> /etc/puppet/autosign.conf

