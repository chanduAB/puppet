class myweb
    {
    include myweb::chandu
    include myweb::jaya::jaya 
       case $operatingsystem
           {
             'RedHat': {$pkg="httd"}
             'Debian': {$pkg="apache2"}
              default: {$pkg="httpd"}
           }
                package{"httpd":
                         name => $pkg,
                         ensure => present,
                        }
                    file{"/var/www/html/index.html":
                          ensure => file,
                          source => 'puppet:///modules/myweb/index.html',
                          notify => Service['httpd'],
                        }
                service{"httpd":
                         name => $pkg,
                         ensure => running,
                         subscribe => File['/var/www/html/index.html'],
                         require => Package['httpd'],
                       }
    }
                      
   


