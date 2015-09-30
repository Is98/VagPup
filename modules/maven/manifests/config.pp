class maven::config (
	$mavenVersion = "apache-maven-3.3.3",
	)
	{
	file { '/etc/profile.d/mvn.sh':
		ensure => present,
		content => "export M2_HOME=/opt/${mavenVersion}\n
export PATH =\$PATH:/opt/${mavenVersion}/bin",
	}
}