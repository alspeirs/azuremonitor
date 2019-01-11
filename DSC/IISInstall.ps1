Configuration Main
{

Param ( [string] $nodeName )

Import-DscResource -ModuleName PSDesiredStateConfiguration

Node $nodeName
 
   <# This commented section represents an example configuration that can be updated as required.
    WindowsFeature WebServerRole #>
    {
      WindowsFeature InstallWebServer
	  }
		Ensure = "Present"
		Name = "Web-Server"
      }
    }
}