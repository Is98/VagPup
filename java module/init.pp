class java {
	include java::install
	include java::config
	
	notify => Class['java::install'],
}