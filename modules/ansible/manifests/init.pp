class ansible {
    package { 'ansible':
      ensure => present,
    }

    file { ['/etc/ansible', '/etc/ansible/hosts', '/etc/ansible/plugins', '/etc/ansible/plugins/inventory']:
        ensure => 'directory',
        owner  => 'kieran',
        group  => 'staff',
        mode   => 755,
    }

    file { '/etc/ansible/plugins/inventory/ec2.py':
        ensure => 'present',
        owner => 'kieran',
        group => 'staff',
        source => 'puppet:///modules/ansible/ec2.py',
        mode => 755
    }

    file { '/etc/ansible/plugins/inventory/ec2.ini':
        ensure => 'present',
        owner => 'kieran',
        group => 'staff',
        source => 'puppet:///modules/ansible/ec2.ini',
        mode => 755
    }
}