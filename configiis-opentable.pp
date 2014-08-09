

class mywebsite {
  iis::manage_app_pool {'sam_app_pool':
    enable_32_bit           => true,
    managed_runtime_version => 'v4.0',
  }
   iis::manage_site {'www.sameersite.com':
    site_path     => 'C:\inetpub\wwwroot\sameersite',
    port          => '80',
    ip_address    => '*',
    host_header   => 'www.sameersite.com',
    app_pool      => 'sam_app_pool'
  }
   iis::manage_virtual_application {'application1':
    site_name   => 'www.sameersite.com',
    site_path   => 'C:\inetpub\wwwroot\application1',
    app_pool    => 'sam_app_pool'
  }
   iis::manage_virtual_application {'application2':
    site_name   => 'www.sameersite.com',
    site_path   => 'C:\inetpub\wwwroot\application2',
    app_pool    => 'sam_app_pool'
  }

}

include mywebsite
