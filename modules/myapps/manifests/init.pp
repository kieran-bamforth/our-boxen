class myapps {
	include alfred
	include chrome
	include dropbox
	include evernote
	include flux
	include phpstorm
	include sequel_pro
	include skype
	include spotify

	class { 'vagrant': completion => true }

	class { 'virtualbox':
		version => '5.0.14',
		patch_level => '105127'
	}
}
