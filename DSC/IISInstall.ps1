Configuration Main
{

Param ( [string] $nodeName )

Import-DscResource -ModuleName PSDesiredStateConfiguration

Node $nodeName
{
Install-WindowsFeature -Name Web-Server -IncludeAllSubFeature
}
}