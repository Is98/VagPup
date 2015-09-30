class java::install {
	$distServer = http://10.50.20.49:8080/aaron
	$javaTarball = jdk-8u45-linux-x64.tar.gz
	$javaVersion = jdk1.8.0_45
	$installLocation = /usr/bin/java
	
	exec { 'retrieve file':
		cwd => "/opt/"
		command => "wget '${distServer}'/downloads/'${javaTarball}'"
	}
	exec { 'unzip file':
		cwd => "/opt/"
		command => "tar zxvf '${javaTarball}'"
		require => Exec['retrieve file']
	}
	exec { 'install java':
		cwd => "/opt/'${javaVersion}'"
		command => "update-alternatives --install '${installLocation}' java /opt/'${javaVersion}'/bin/java 2"
		require => Exec['unzip file']
	}
	exec { 'set java':
		cwd => "/opt/'${javaVersion}'"
		command => "update-alternatives --config java -y"
		require => Exec['install java']
	}

}