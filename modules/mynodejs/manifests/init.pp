class mynodejs {
	nodejs::version { '0.12.0': }
	nodejs::version { '0.10.0': }
	class { 'nodejs::global': version => '0.12.0' }

	npm_module { "bower for 0.12": module => 'bower', version => '~> 1.4.1', node_version => '0.12.0' }
	npm_module { "yo for 0.12": module => 'yo', version => '~> 1.4.7', node_version => '0.12.0' }
	npm_module { "node inspector for 0.12": module => 'node-inspector', version => '~> 0.12.1', node_version => '0.12.0' }
	npm_module { "git commander for 0.12": module => 'git-commander', version => '~> 0.0.12', node_version => '0.12.0' }
	npm_module { "grunt for 0.12": module => 'grunt', version => '~> 0.4.5', node_version => '0.12.0' }
	npm_module { "grunt-cli for 0.12": module => 'grunt-cli', version => '~> 0.1.13', node_version => '0.12.0' }
	npm_module { "ract-native-cli for 0.12": module => 'react-native-cli', version => '~> 0.1.4', node_version => '0.12.0' }
	npm_module { "tern for 0.12": module => 'tern', version => '~> 0.16.0', node_version => '0.12.0' }
	npm_module { "diff-so-fancy for 0.12": module => 'diff-so-fancy', version => '~> 0.1.2', node_version => '0.12.0' }
	npm_module { "phonegap 0.12": module => 'phonegap', version => '~> 6.0.0', node_version => '0.12.0' }
}