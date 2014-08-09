package { 'Microsoft .NET Framework 4.5':
  ensure          => installed,
  source          => 'C:\dotNetFx45_Full_setup.exe',
  install_options => ['/Passive', '/NoRestart'],
  provider        => windows,
}
