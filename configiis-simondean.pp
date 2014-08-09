      file {'c:/puppet_iis_demo':
        ensure          => directory,
      }

      file {'c:/puppet_iis_demo/default.aspx':
        content         =>
'<%@ Page Language="C#" %>
<!DOCTYPE html>
<html>
<head>
    <title>Managed by Puppet</title>
</head>
<body>
    <h1>Managed by Puppet</h1>

    <strong>Time:</strong> <%= DateTime.UtcNow.ToString("s") + "Z" %>
</body>
</html>'
      }

      iis_apppool {'PuppetIisDemo':
        ensure                => present,
        managedpipelinemode   => 'Integrated',
        managedruntimeversion => 'v2.0',
      }

      iis_site {'PuppetIisDemo':
        ensure          => present,
        bindings        => ["http/*:25999:"],
      }

      iis_app {'PuppetIisDemo/':
        ensure          => present,
        applicationpool => 'PuppetIisDemo',
      }

      iis_vdir {'PuppetIisDemo/':
        ensure          => present,
        iis_app         => 'PuppetIisDemo/',
        physicalpath    => 'c:\puppet_iis_demo'
      }