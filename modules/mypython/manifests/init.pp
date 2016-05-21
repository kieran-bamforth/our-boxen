class mypython {
	python::version { '2.7.6': }

	python::package { 'awscli for 2.7.6':
		package => 'awscli',
		python => '2.7.6'
	}

	python::package { 'psutil for 2.7.6':
		package => 'psutil',
		python => '2.7.6'
	}

	class { 'python::global': version => '2.7.6' }
}
