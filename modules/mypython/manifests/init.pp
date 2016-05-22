class mypython {
	python::version { '2.7.6': }

	python::package { 'awscli for 2.7.6':
		package => 'awscli',
		python => '2.7.6'
	}

    # Having trouble with this? xcode-select install and see this link http://stackoverflow.com/questions/27976312/how-to-cope-with-non-gcc-compatible-code-in-os-x-yosemite-core-headers
	python::package { 'psutil for 2.7.6':
		package => 'psutil',
		python => '2.7.6'
	}

	class { 'python::global': version => '2.7.6' }
}
