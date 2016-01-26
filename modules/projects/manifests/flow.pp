# Project Manifests

class projects::flow {
	require projects::dotfiles
	$repoName = "flow"
	boxen::project { "${repoName}":
		source => "git@bitbucket.org:kieranbamforth/${repoName}.git"
	}
}