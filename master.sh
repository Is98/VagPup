apt-get install puppet puppetmaster
echo -e 127.0.0.1 "$(facter fqdn) puppetmaster\n$(facter ipaddress) $(facter fqdn) puppetmaster" >> /etc/hosts
echo -e '*.netbuilder.private' >> /etc/puppet/autosign.conf
touch /etc/puppet/manifests/site.pp