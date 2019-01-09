# Monitor Azure Infrastructure Demo

[![Deploy to Azure](http://azuredeploy.net/deploybutton.png)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Faaronlafferty%2Fazuremonitor%2Fmaster%2F%2Fazuredeploy.json) 
<a href="http://armviz.io/#/?load=https%3A%2F%2Fraw.githubusercontent.com%2Faaronlafferty%2Fazuremonitor%2Fmaster%2Fazuredeploy.json" target="_blank">
    <img src="http://armviz.io/visualizebutton.png"/>
</a>

## Microsoft Virtual Machine with OMS Workspace Azure Resource Manager Template

This template will deploy n number of VM's, OMS Workspace and Azure Monitoring services into a Resource Group

* Azure Log Analytics

Instead of spending time adding data sources to your workspace and constructing the search queries for common scenarios, you will have multiple solutions enabled by default, common Windows and Linux logs present, as well as some of the most used performance counters regardless of platform. With saved searches categorized in the workspace, it is easy to get started immediately after you have added your machines to the workspace


### Post Deployment

The template will enable the following solutions:
	
	* Change Tracking
	* Security and Audit
	* System Update Assessment
	* Agent Health
	* Service Map


*This template will be updated to add more capabilities*

       
