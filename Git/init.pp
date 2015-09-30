class git::config (
	include git::install,
	include git::config,

	notify => Class["git::install"],
)