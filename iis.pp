dism { 'NetFx3':
  ensure => present,
  all => true,
}

dism { 'IIS-WebServerRole':
  ensure => present,
}

dism { 'IIS-WebServer':
  ensure  => present,
  require => Dism['IIS-WebServerRole'],
}



dism { 'IIS-ISAPIExtensions':
  ensure => present,
 
}


dism { 'IIS-ISAPIFilter':
  ensure => present,
 
}


dism { 'IIS-RequestFiltering':
  ensure => present,
 
}

dism { 'IIS-NetFxExtensibility':
  ensure => present,
  require => Dism['IIS-RequestFiltering'],
}


dism { 'IIS-DefaultDocument':
  ensure => present,
}











