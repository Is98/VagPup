class java::config (
	$javaVersion = "jdk1.8.0_45",
	)
	{
	file { '/etc/profile.d/java.sh':
		ensure => present,
		content => "export JAVA_HOME=/opt/${javaVersion}\n
export JRE_HOME=/opt/${javaVersion}\n
export PATH=\$PATH:/opt/${javaVersion}/bin:/opt/${javaVersion}/jre/bin/",
        mode => '0744',
	}
}