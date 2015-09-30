class git::config (
	$string = "export GIT_HOME=/opt/git-2.5.0/"
)
{
	file {'/opt/git.sh':
		ensure => file,
		content =>$string,
		#require => Class["git::install"],
	}
}


include git::config