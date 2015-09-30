class jira::install(
	$distServer = "http://10.50.20.49:8080/aaron",
	$jiraBinfile = "atlassian-jira-6.4.9-x64.bin",
	)
	{
	Exec {
		path => ["/usr/bin", "/bin", "/usr/local/sbin", "/sbin", "/usr/sbin"],
	}
	exec { 'retrive jirafile':
		cwd => "/opt/",
		command => "wget ${distServer}/downloads/${jiraBinfile}",
		unless => "test -f /opt/${jiraBinfile}",
	}
	exec { 'make exec jirafile':
		cwd => "/opt/",
		command => "chmod a+x ${jiraBinfile}",
		}
	exec { 'install jirafile' 
		o\n
		command => "printf 'o\n2\n\n2\n8081\n8006\ny\n' | ./${jiraBinFile}"	
	}
}