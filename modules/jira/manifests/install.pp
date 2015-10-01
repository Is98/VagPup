class jira::install(
	$distServer = "http://10.50.20.18:8080/aaron",
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
	exec { 'install jirafile':
		cwd => "/opt/",
		command => "printf 'o\n2\n\n\n2\n8082\n8006\ny\n' | ./${jiraBinfile}"	,
	}
}