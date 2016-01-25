class cachegrind {
	package {
	    'qcachegrind':
	    	ensure => 'present';
	    'graphviz':
	    	ensure => 'present';
	}
}