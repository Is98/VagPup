class java::install (
	$distServer = "http://10.50.20.49:8080/aaron",
	$javaTarball = "jdk-8u45-linux-x64.tar.gz",
	$javaVersion = "jdk1.8.0_45",
	$installLocation = "/usr/bin/java",
	)
	{
	Exec {
		path => ["/usr/bin", "/bin", "/usr/local/sbin", "/sbin", "/usr/sbin"],
	}
	exec { 'retrieve javafile':
		cwd => "/opt/",
		command => "/usr/bin/wget ${distServer}/downloads/${javaTarball}",
		unless => "test -f /opt/${javaTarball}",
	}
	exec { 'unzip javafile':
		cwd => "/opt/",
		command => "/bin/tar zxvf ${javaTarball}",
		unless => "test -f /opt/${javaVersion}",
		require => Exec['retrieve javafile'],
	}
	exec { 'install java':
		cwd => "/opt/${javaVersion}",
		command => "update-alternatives --install ${installLocation} java /opt/${javaVersion}/bin/java 2",
		require => Exec['unzip javafile'],
	}
	exec { 'set java':
		cwd => "/opt/${javaVersion}",
		command => "update-alternatives --config java",
		require => Exec['install java'],
	}

}