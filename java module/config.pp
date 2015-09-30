class java::config {
	$jmavenVersion = jdk1.8.0_45
	
	file { '/etc/profile.d/java.sh':
		ensure => present
		content => "export M2_HOME=/opt/'${mavenVersion}'\n
export JRE_HOME=/opt/'${javaVersion}'\n
export PATH =\$PATH:/opt/'${javaVersion}'/bin:/opt/'${javaVersion}'/jre/bin/"
	}
}