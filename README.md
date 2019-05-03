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
To trigger the alert you will need to shut down one of the web servers. Shutting down a server **from the Azure Portal will not work**. You will need to RDP into one of the webservers and shut it down via windows. Once the webserver has been down for a minute or two an alert will be generated. To view the alert go to the **Alerts** under the **Monitoring** section in the resource group.

### Resolving the Alert (Manually)
To resolve the alert simply go to the VM that you shutdown and hit **Restart** from the Azure portal. The VM will restart and the Alert condition will change to resolved.

### Adding an action to an Alert (Email)
Now that we have triggered an Alert and viewed it in the Azure Portal we will add an action to send an email when the alert is triggered. We will be using a pre-created Action Group to send the email. To add this action to the alert follow these steps.

1. From your Resource Group go to **Alerts**
2. Click **Manage Alert Rules**
3. Click the **LoadBalancerBackend** Alert
4. Under **Actions** click **Add**
5. Click **Add Action Group**
6. Select **Email Alert 1**
	> This Alert will use the email address that was provided at the time of deployment
7. Click **Add**
8. Click **Save**
	> Can take up to 10 minutes for this change to be applied
9. Trigger an Alert following the process in the previous section

### Create an Action Group to trigger a runbook (Self Heal)
Now that we have seen a regular alert and added an email component to it, we will add an action that will automatically resolve this error for us. During deployment a simple runbook was created with a powershell scrtipt to reboot the VM if it is not responding. You can view this runbook by clicking on the **WebAppRestart** resource in your Resource Group. In the following steps we will create the Action Group and add the runbook to it.

1. From your Resource Group go to **Alerts**
2. Click **Manage Alert Rules**
3. Click **Manage action groups**
4. Click **Add action group**
5. Fill in the following fields
	* **Action Group Name:** Web App Restart
	* **Short Name:** Restart
	* **Subscription:** *Current Subscription you are using*
	* **Resource Group:** *Resource group where everything is deployed*

6. Under **Actions** give the action a name and select **Automation Runbook** from the Action type dropdown
7. From the slide out the following fileds should be
	* **Run runbook:** Enabled
	* **Runbook source:** User
	* **Subscription:** *select your subsription*
	* **Automation Account:** AlertAutomation
	* **Runbook:** WebAppRestart
8. Click **Configure parameters**
9. Type in the name of the current resource group
10. Click Ok on the open blades
11. You should now see your Action group listed
	> Now that action group is created we will need to add it to our alert the same way we did previously
12. From your Resource Group go to **Alerts**
13. Click **Manage Alert Rules**
14. Click the **LoadBalancerBackend** Alert
15. Under **Actions** click **Add**
16. Click **Add Action Group**
17. Select **Web App Restart**
18. Click **Add**
19. Click **Save**
	> Can take up to 10 minutes for this change to be applied
20. Trigger an Alert following the process in the previous section

### Monitoring the runbook
Now that the action group is setup the alert will fire and the runbook will automatically restart the webapp that is not responding. You should see in the Alerts section that alert will be triggered and then will be resolved. We can also see the number of times that runbook has been run from the dashboard that was created at deployment. The other way to see how often this runbook is running is to click on the runbook resource in the resaource group. The overview section will show recent jobs and status.



       
