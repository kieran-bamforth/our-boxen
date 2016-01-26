# Project Manifests

class projects::blog {
	require projects::dotfiles
	$repoName = "blog"
	boxen::project { "${repoName}":
		source => "git@bitbucket.org:kieranbamforth/${repoName}.git"
	}
}
