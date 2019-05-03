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

### Refer to the PostDeploymentTasks.md in the docs folder for post deployment setup tasks


*This template will be updated to add more capabilities*

### Metrics Dashboard
A metrics dashboard has been created as part of this deployment. The dashbaord is named **ServiceOpsDashboard**. Navigate to the dashboard in the reosurce group where this deployment was created. The following are the metrics this dashbaord is using.

	* Average health probe status by backend IP
	* Average percentage of CPU for webapp 1 & 2
	* Total packet count In & Out
	* Total number of Runbook Jobs

Later in this demo we will reference this dashboard in order to show real time status in the event of a failure.

### Configured Alerts
We have pre-configured a single alert at the time of deployment. This alert will monitor the probe status of the Network Load Balancer. This alert is currently configured to fire when the health probe status for either of the web servers drops below 80%. To view this Alert follow these steps.

1. In the resource group where this template was deployed navigate to **Alerts**
	> You may already have one or more Alerts that have been triggered duiring the deployment process
2. Click **Manage Alert Rules**

3. Click the **LoadBalancerBackend** rule


### Testing the Web Servers and Load Balancer
There are two servers running a basic web application behind an Azure Load balancer. In order to test that these servers are responding and the load balancer is routing correctly we will need to do the following steps.

1. Naviagte to the **webapp-nlb** resource that was created as part of this deployment

2. Take note of the **Public Ip address** that is displayed in the overview tab of this resource

3. Open a web browser and navigate to the public IP address from the previous step

4. A simple website should load displaying the name of the web server you are connected to

5. In the browser window hit **Ctrl+F5** to repeatedly refresh the browser, you should see the name of the server you are connected to periodically change


### Triggering an alert
To trigger the alert you will need to shut down one of the web servers. Shutting down a server **from the Azure Portal will not work**. You will need to RDP into one of the webservers and shut it down via windows.

### Resolving the Alert (Manually)

### Adding an action to an Alert (Email)

### Attaching a runbook to an Alert (Self Heal)

       
