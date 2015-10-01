class nexus::install {
	
	Exec { path => [ "/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/" ] }

	exec { 'download_nexus':
		cwd => "/opt",
		command => "wget http://download.sonatype.com/nexus/oss/nexus-${nexus::version}-${nexus::revision}-bundle.tar.gz",
		logoutput => on_failure,
		creates => "/opt/nexus-${nexus::version}-${nexus::revision}-bundle.tar.gz",
		require => Class['java']
	}
	
	exec {'unarchive_nexus':
		cwd => "/opt",
		command => "tar zxf nexus-${nexus::version}-${nexus::revision}-bundle.tar.gz -C /usr/local/",
		creates => "/usr/local/sonatype-work",
		require => Exec["download_nexus"],
	}
	
	exec {'symbolic_link_nexus':
		cwd => "/usr/local",
		command => "ln -s nexus-${nexus::version}-${nexus::revision} nexus",
		creates => "/usr/local/nexus",
		require => Exec["unarchive_nexus"],
	}
	
	exec {'add_user_nexus':
		cwd => "/usr/local/nexus",
		command => "adduser -disabled-password -disabled-login nexus",
		creates => "/home/nexus",
		require => Exec['symbolic_link_nexus'],
	}
	
	exec {'change_owner_nexus':
		cwd => "/usr/local",
		command => "chown -R nexus:nexus nexus-${nexus::version}-${nexus::revision} sonatype-work",
		require => Exec['add_user_nexus'],
	}
	
	exec {'nexus_start':
		cwd => "/usr/local/nexus",
		command => 'su nexus -c "./bin/nexus start"',
		require => Exec['change_owner_nexus'],
	}
}
