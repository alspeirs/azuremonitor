Configuration Main
{

	Param ( [string] $nodeName )

	Import-DscResource -ModuleName PSDesiredStateConfiguration

	Node $nodeName
	{

	#Install IIS Server role
		WindowsFeature IIS 
		{
			Ensure = "Present"
			Name = "Web-Server"
		}

	#Install ASP Role
		WindowsFeature AspNet45 
		{
			Ensure = "Present"
			Name = "Web-Asp-Net45"
		}
	#Install IIS Management Console		 
		 WindowsFeature WebManagementConsole
        {
			Ensure = "Present"
			Name = "Web-Mgmt-Console"
		}	
	}
}