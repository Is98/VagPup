class maven::install (
	$distServer = "http://10.50.20.18:8080/aaron",
	$mavenTarball = "apache-maven-3.3.3-bin.tar.gz",
	$mavenVersion = "apache-maven-3.3.3",
	$installLocation = "/usr/bin/mvn",
	)
	{
	Exec {
		path => ["/usr/bin", "/bin", "/usr/local/sbin", "/sbin", "/usr/sbin"],
	}
	exec { 'retrieve mavenfile':
		cwd => "/opt/",
		command => "wget ${distServer}/downloads/${mavenTarball}",
		unless => "test -f /opt/${mavenTarball}",
	}
	exec { 'unzip mavenfile':
		cwd => "/opt/",
		command => "tar zxvf ${mavenTarball}",
		unless => "test -f /opt/${mavenVersion}",
		require => Exec['retrieve mavenfile'],
	}
	exec { 'install maven':
		cwd => "/opt/${mavenVersion}",
		command => "update-alternatives --install ${installLocation} mvn /opt/${mavenVersion}/bin/mvn 120",
		require => Exec['unzip mavenfile'],
	}
	exec { 'set maven':
		cwd => "/opt/${mavenVersion}",
		command => "update-alternatives --config mvn",
		require => Exec['install maven'],
	}

}