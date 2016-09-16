class apache {
      if $osfamily == 'RedHat'
               {
                  $pkg = "httpd"
                }
              elsif $osfamily == 'debian'
                      {
                        $pkg = "apache2"
                       }
                    else 
                         {
                           $pkg = "httpd"                         }
                            package { "myweb":
                                  name => $pkg,
                                  ensure => present,
                                    }
                              file{ "/var/www/html/index.html":
                                    ensure => file, 
                                    source => 'puppet:///modules/apache/index.html',
                                    notify => Service['myweb'],
                                  }
                                 service{ "myweb":
                                         name => $pkg,
                                         ensure => running,
                                         require => Package['myweb'],
                                        }
              }       
