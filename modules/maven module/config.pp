class maven::config (
	$mavenVersion = "apache-maven-3.3.3",
	)
	{
	file { '/etc/profile.d/maven.sh':
		ensure => present,
		content => "export M2_HOME=/opt/'${mavenVersion}'\n
export PATH =\$PATH:/opt/'${mavenVersion}'/bin,
	}
}