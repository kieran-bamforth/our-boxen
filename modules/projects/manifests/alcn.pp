# Project Manifests

class projects::alcn {
	require projects::dotfiles
	$repoName = "alcn"
	boxen::project { "${repoName}":
		source => "git@bitbucket.org:kieranbamforth/${repoName}.git"
	}
}
