class ganglia::gmond {
  package {'ganglia-monitor':
    ensure => installed
  }
  file {'/etc/ganglia/gmond.conf':
    content => template('ganglia/gmond.conf.erb'),
    notify => Service['ganglia-monitor']
  }
  service {'ganglia-monitor':
    ensure => running,
    enable => true,
    require => [ Package['ganglia-monitor'], File['/etc/ganglia/gmond.conf']]
  }
}
