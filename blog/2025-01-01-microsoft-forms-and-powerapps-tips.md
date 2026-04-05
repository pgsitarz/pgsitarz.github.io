---
visibility: hidden  
# tags: [powerapps, microsoft-forms]
---

# Microsoft Forms and PowerApps Tips

## Microsoft Forms
- Recent
- Pinned
- Shared forms

### Tiles vs list view

### Likert question type
- Just like a table - multiple choice answers

### NPS score feature (net promoter score)
- Gather data on whether you'll recommend xyz to a friend (0 through 10)

### Sections in forms

### Improved themes

### Branching
- Go to different parts of the form based on answers

### Upload file with a question

### Immersive reader (icon)
- Reads the article for you
- Allows different readability options
- Translation
- Various colors, background, font names

### Math keybaord to create math tests or quizes
- When answering, math keyboard will come up

### Ability to print a form

### Ability to print summary of responses

### Shuffle questions (in a quiz or form, etc.)
- For each student taking a quiz, the questions order will change
- Go to ... in the form, Settings, under Options for responses select Shuffle questions

### Start date and end date (for taking responses)
- Under Settings, go to Options for responses

### Summary for all the responses
- Under Responses, go to ... and Create a summary link
- Direct link to the summary can be emailed

### Duplicate a form or quiz you made
- Share, Get a link to duplicate (they can copy to their forms library)
 
### Sharing and collaborating on a form
- Go to Share, Share to collaborate
- Once another person opens the link, two people will be co-authoring

### Create multi-language forms
- ... and go to Multilingual
- There are many languages to pick from
- Once you set it up, a dropdown shows up to pick the form language

### Outlook quick poll integration
- In Insert menu, there's a Poll
- Creates a form on the side, etc., and it can be configured to create a poll
- You can insert the poll in the email
- You can view and vote in the browser

### Excel web integration with forms
- In Excel online, there is Forms menu option
- Sheet will be created after the form name, and contain responses

### OneNote integration with forms
- There is a Forms button in OneNote for Windows 10 and 11
- Supports the ability to embed forms into OneNote

### Integration with Microsoft Stream (video solution)
- Insert forms into the video (knowledge check in the video)

## Power App Platform

### Products
- Power Apps
- Power Automate
- Power BI
- Power Pages (External or internal users)

### Power Platform Core Components
- AI Builder
- Dataverse
- Data Connectors (connect apps, data, devices)

### Microsoft Copilot for Power Platform
- AI assistant
- Empire you to build solutions
- Simplify process to add AI to solutions
- Many copilots available

### Administration and security
- Environments allow you to store, manage, and share your data, apps and flows in Power Platform - dev, test, new geo locations

### Types of environments
- Default environment
- Trial environment
- Sandbox environment (non-prod areas to dev and test solutions)
- Production

### Security roles
- Environment admin (all admin tasks)
- Environment maker 
- Custom roles (based on predefined roles)
  - https://learn.microsoft.com/power-platform/admin/database-security
- Managed environments 
  - https://learn.microsoft.com/power-platform/admin/managed-environment-enable

### Security on Power Platform
- Authentication and encryption
- https/tls
- Environments - single geo location
- Identity and Access Management (IAM)
- Microsoft Dataverse
  - Role-based security
  - Business units and teams
  - Entity/record access
- DLP (Data Loss Prevention) policies
- Monitoring (static analysis tools and reports)

### DLP
- Prevent data leakage (tentant and environment level)

### Admin Center tools
- Power Platform admin center
- BI admin center
- Entra admin center
- M365 (accounts, licenses, subscriptions)

### Managing compliance in the cloud
- https://www.microsoft.com/trust-center
- Access your compliance score (shows how well compliance is managed)
- Service trust portal at https://servicetrust.microsoft.com

### Accessibility
- Properties in Power Apps
- Accessible themes (colors, font styles, etc.)
- Multilingual apps
- Text to speech in apps and screen readers
- App checker (shows accesibility issues)
- https://www.microsoft.com/accessibility

## Deployment
- [Using Pipelines to Simplify Power Platform Deployments](https://www.youtube.com/watch?v=ryjImcByFl4)

## Extending connectors
- It's possible to create [custom connectors](https://www.microsoft.com/en-us/power-platform/blog/power-apps/a-sample-custom-connector-for-servicenow-using-oauth-authentication/)

## On-Premise Data Gateway

On-Premise data gateway allows you to use your on-premse data sources with M365 solutions.  More information on the data gateway is here:
- <a href="https://learn.microsoft.com/en-us/data-integration/gateway/service-gateway-onprem-indepth">On-premises data gateway architecture</a>