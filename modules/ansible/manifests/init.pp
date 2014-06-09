class ansible {
    package { 'ansible':
      ensure => present,
    }

    file { ['/etc/ansible', '/etc/ansible/hosts', ]:
        ensure => 'directory',
        owner  => 'kieran',
        group  => 'staff',
        mode   => 755,
    }

    file { '/etc/ansible/ec2.py':
        ensure => 'present',
        owner => 'kieran',
        group => 'staff',
        source => 'puppet:///modules/ansible/ec2.py',
        mode => 755
    }
}