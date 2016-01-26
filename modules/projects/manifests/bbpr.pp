# Project Manifests

class projects::bbpr {
	require projects::dotfiles
	$repoName = "bbpr"
	boxen::project { "${repoName}":
		source => "git@bitbucket.org:kieranbamforth/${repoName}.git"
	}
}
