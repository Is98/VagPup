sudo apt-get install -y puppet
echo -e "$1 $2 puppetmaster\n127.0.0.1 $(facter fqdn) puppet\n$(facter ipaddress) $(facter fqdn) puppet" >> /etc/hosts
sed -i.bkp "/\[main\]/a server=$3" /etc/puppet/puppet.conf
puppet agent --enable
puppet agent -tv