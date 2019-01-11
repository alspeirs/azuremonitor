Configuration Main
{

Param ( [string] $nodeName )

Import-DscResource -ModuleName PSDesiredStateConfiguration

Node $nodeName
{
WindowsFeature -Name Web-Server -IncludeAllSubFeature
}
}