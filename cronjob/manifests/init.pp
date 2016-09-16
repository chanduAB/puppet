class cronjob
     {
        file { '/puppet/pls.sh':
                 content => "#!/bin/sh\necho \"Hello World\"\nls -ltr /etc/puppet > /puppet/dump.txt",
#                 mode    => 0755, 
             }

cron { 'helloworld':   
   command => "/puppet/pls.sh",   
   user    => root,
   hour    => '*',   
   minute  => '*/5',
   require => File['/puppet/pls.sh']
}
}
