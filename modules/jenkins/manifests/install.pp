class jenkins::install{
	
 Exec {
               path            =>      [ "/usr/bin", "/bin", "/usr/sbin" ]
          }

	
	exec { 'download jenkins':
		cwd => "/opt/",
		command => "wget -q -O - http://pkg.jenkins-ci.org/debian/jenkins-ci.org.key | sudo apt-key add -",
	}
	
	file { "/etc/apt/sources.list.d/jenkins.list":
      mode => '644',
     owner => root,
     group => root,
    source => "puppet:///modules/jenkins/etc/apt/sources.list.d/jenkins.list",
		}
		
	exec { 'update apt-get' :
	    command => 'apt-get update'	
	}

	package { 'jenkins':
		ensure => latest, 
	require => [ Exec['download jenkins'],
				 File['/etc/apt/sources.list.d/jenkins.list'], ],
	
	}	
	
	service { 'jenkins':
		ensure => running,
  }

}
