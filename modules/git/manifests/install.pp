class git::install(
	$archive="git-2.5.0.tar.gz",
	$git_home="/opt/git-2.5.0/",
	$git_installation_folder="git-2.5.0",
)
{
	 Exec {
                path            =>      [ "/usr/bin", "/bin", "/usr/local/sbin", "/sbin", "usr/sbin" ]
        }

	
	exec { 'download git':
		cwd => "/opt/",
		command => "apt-get install -y git",
	
	}
}
