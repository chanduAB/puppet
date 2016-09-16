class user
          { 
            user { 'sys001':
                    ensure => 'present',
                    home => '/home/sys2',
 		    password => '$1$YdmAEFDo$Yjlbb/XcBgoqEKmLX9HDk.',
 		    password_max_age => '99999',
 		    password_min_age => '0',
                    shell => '/bin/bash',
		    uid => '528',
                  }
          }

