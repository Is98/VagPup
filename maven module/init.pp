class maven {
	include maven::install
	include maven::config
	
	notify => Class['maven::install'],
}