sudo apt-get install -y puppet
sed -i '/puppet/d' /etc/hosts
sed -i '/netbuilder/d' /etc/puppet/puppet.conf
sed -i.bkp "/\[main\]/a server=$3" /etc/puppet/puppet.conf
echo -e "$1 $2 puppetmaster\n127.0.0.1 $(facter fqdn) puppet\n$(facter ipaddress) $(facter fqdn) puppet" >> /etc/hosts

puppet agent --enable
puppet agent -tv