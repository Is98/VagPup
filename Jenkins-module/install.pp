class jenkins::install{
	

	
	exec { 'download jenkins':
		cwd => "/opt/",
		command => "wget -q -O - https://jenkins-ci.org/debian/jenkins-ci.org.key | sudo apt-key add -",
	}
	
	file { "/etc/apt/sources.list.d/jenkins.list":
      mode => 644,
     owner => root,
     group => root,
    source => "puppet:///modules/jenkins/etc/apt/sources.list.d/jenkins.list",
		}
		
	package { 'jenkins':
		ensure => latest, 
	require => [ Exec {'download jenkins'],
				 File['/etc/apt/sources.list.d/jenkins.list'], ],
	
	}	
	
	service { 'jenkins':
		ensure => running,
  }

}