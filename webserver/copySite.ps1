$ComputerName = $env:COMPUTERNAME

if($ComputerName -eq "WebApp1")
{
    $url = "https://raw.githubusercontent.com/aaronlafferty/azuremonitor/master/webserver/webServer1.html"
    $output = "C:\inetpub\wwwroot\index.html"
    Import-Module BitsTransfer
    Start-BitsTransfer -Source $url -Destination $output
}
else 
{
    $url = "https://raw.githubusercontent.com/aaronlafferty/azuremonitor/master/webserver/webServer2.html"
    $output = "C:\inetpub\wwwroot\index.html"
    Import-Module BitsTransfer
    Start-BitsTransfer -Source $url -Destination $output
}