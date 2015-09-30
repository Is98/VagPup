class maven::install {
	$distServer = "http://10.50.20.49:8080/aaron",
	$mavenTarball = "apache-maven-3.3.3-bin.tar.gz",
	$mavenVersion = "apache-maven-3.3.3",
	$installLocation "/usr/bin/maven",
	
	exec { 'retrieve file':
		cwd => "/opt/",
		command => "wget '${distServer}'/downloads/'${mavenTarball}'",
	}
	exec { 'unzip file':
		cwd => "/opt/",
		command => "tar zxvf '${mavenTarball}'",
		require => Exec['retrieve file'],
	}
	exec { 'install maven':
		cwd => "/opt/'${javaVersion}'",
		command => "update-alternatives --install '${installLocation}' maven /opt/'${mavenVersion}'/bin/maven 120",
		require => Exec['unzip file'],
	}
	exec { 'set maven':
		cwd => "/opt/'${mavenVersion}'",
		command => "update-alternatives --config maven -y",
		require => Exec['install maven'],
	}

}
}