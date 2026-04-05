---
tags:
  - powerapps
  - power-automate
  - power-platform
---

# Power Apps Tips and Notes

### Get inspired

See examples of how other people have used Power Apps to get more from their data.

https://www.microsoft.com/en-us/customers/search?sq=%22Power+Apps%22&ff=&p=2&so=story_publish_date+desc

### Data flow connection reference issue fix

A new dataflow may not detect a connection reference created inside a solution, even if the connection exists in the environment.

**Solution:**
- Add a connection reference in your solution that points to the existing environment connection.
- Ensure SQL server hostnames use the format `server-name.domain.com` for Power Platform SQL connections.
- After updating an on-premises Azure data gateway, refresh it in Power Platform admin center by clicking the green circle.

### Listing distinct choices in a drop-down

Set the **Items** property as:
```
Distinct(Choices([@'SharePoint-List-Name'].'Look-Up-Field'), Value)
```

`Look-Up-Field` refers to the column in your SharePoint list that is configured as a lookup to another list. This is the field where your power app form will store the selected value.


### Intro to power apps components and other functions

These notes are based on the video below:
https://www.youtube.com/watch?v=MQGqHwZdUes

- Components are reusable pieces of code that can be changed in a central place and their improvements will be "propagated" wherever they are used.
- The fewer the controls you have in your app the better, there is less to maintain.
- Components solve this problem - their goal is reusability.
- Create it once, and it can be used in multiple power apps and multiple screens.
- Use components tab in the tree view in power apps designer.

- Custom functions in Power Apps components
  IsCurrency
  IsPercent
  IsTime

- aka.ms/powerplatform-samples

Component library is a tab next to Apps tab in powerapps.com
- User defined functions
- PowerFx

- Component apps
- Component libraries
- Custom functions

# Other notes

Team in production environment
	Intra security groups

Per user licensing - premium connectors, premium features
Per app license - provisioned at environment level (group of users can use a connector per app)
Premium power app, premium power automate

# Adding file upload to your power app

https://www.youtube.com/watch?v=QUwzvUXgj58

## Bypassing consent when opening a new power app

You have to be a power platform admin to run this command.

``Set-AdminPowerAppApisToBypassConsent -EnvironmentName [environment-id] -AppName [app-id]]``

# Power Platform Community Conference

https://powerplatformconf.com/#!/session/Enhancing%20Power%20Platform%20Governance%20Through%20Terraform:%20Embracing%20Infrastructure%20as%20Code/7663

