# Post Deployment Setup
## Connect VM's to OMS Workspace
We need to connect the VM's to the OMS workspace in order to collect stats on the VM's. This should be done at least 24 hours prior to demo as it will have a chance to collect data.

1.  After the deployment has completed, find the resource group you deployed the resources into and click on one of the VM's

2.  From the over page click on **"Insights (preview)"** under the Monitoring section

3.  Click on the **"Performance"** tab

4. On the Azure Monitor Insights OnBoarding blade, click on the the **"Choose a Log Analytics Workspace"** drop down and select the workspace that was created as a part of this deployment
