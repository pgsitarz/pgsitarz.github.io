---
visibility: hidden
---

# Configuring and Managing SharePoint Online

**Permanently deleting a site via PowerShell**

Remove-SPOSite \-Identity https://site.sharepoint.com  
RemoveSPODeletedSite \-Identity https://site.sharepoint.com

Make sure you know what you're doing through PowerShell because it won't prompt you.  There \*may be\* a way for Microsoft to restore a deleted site, but MS would have to be involved.

 

**Managing Hub Sites**

* 2,000 hub sites per tenant  
* A modern SharePoint site can be promoted to a Hub site  
  * As a team site  
  * As a communications site  
* Global navigation added automatically

 

**Configure who is allowed to add sites to the hub**

* Can also configure an approval workflow  
* Hub site can be registered in the admin center  
* Admins can choose who can associate sites with hub \- Users, Security Groups, Office 365 Groups

Hub site can be registered with PowerShell (to make it a hub site)

Register-SPOHubSite \-Site https://site.sharepoint.com/sites/hubsite \-Principals $null

To associate other sites to a hub:

Add-SPOHubSiteAssociation 

\-Site https://sites.sharepoint.com/sites/newsite

\-HubSite https://sites.sharepoint/sites/thehub

 

Unregistering a hubsite disconnects it from the hub 

Unregister-SPOHubSite

\-Identity https://sites.sharepoint.com/sites/an-existing-associated-site

 

In the admin center you can go to Active sites and select one site and register as hub site, or associate with a hub.

 

Unregistering a site as a hub site will disassociate all associated sites with it.

 

Managing Hub Navigation

* To do global navigation you have to join sites to the hub  
* Navigation management is manual (cannot connect to managed metadata navigation)  
* Hub navigation is separate from site navigation 

This PowerShell cmdlet will add Research with the following URL to the top navigation bar:

 Add-PnPNavigationNode

\-Location TopNavigationBar

\-Title "Research"

\-Url https://site.sharepoint.com/sites/site

 

When doing PowerShell the page cache isn't refreshed, and the navigation is cached.  But if you Edit the menu in the hub site you'll see the change.

 

**Managing Permissions** 

4 site permission levels

* Site administrators  
* Site owners  
* Site members (edit permissions on the site)  
* Site visitors \- read-only

 

Who can assign what?

* Primary/secondary administrators can be assigned in SPO admin center  
* Other site administrators can be assigned by primary/secondary admins  
* Site owners can be assigned by site administrators  
* Site members can be assigned by other site members  
* Site visitors can be assigned site members or higher

Adding site owners and site collection admins using PowerShell:

Set-SPOSite

\-Identity https://site.sharepoint.com/sites/thehub

\-Owner jack@smith.com

Set-SPOUser

\-Site https://site.sharepoint.com/sites/thehub

\-LoginName jack@smith.com

\-IsSiteCollectionAdmin $True

**Intro to modern SharePoint info architecture**

* No subsites anymore  
* Modern SharePoint template  
* Managing Hub Sites  
* Managing Navigation  
* Managing Permissions

 

Configuring External Sharing

* At the tenant level  
* At the site collection level  
* Scenarios... 

Types of external users

* \- Authenticated external users (prove you own an email address)  
* \- Anonymous users \- anyone via a link (only to specific documents or folders in libraries)

 

 

Types of links

\- Anyone

A link that will work anytime by anyone if transferred, can be revoked/cancelled

\- People in my organization

A link that will work anytime by people only in our organization (IP restricted?)

\- Specific people

A link that's non-transferable, won't work if forwarded

Access can be revoked anytime

Cannot be shared with anyone other than the specific person (emailed code confirmation)

External user licensing

 

\- No cost inviting external users in O365 to collab on docs

\- Users can read/create/update/delete docs using office online

\- Users cannot get the offline desktop client for free (you must assign them a license)

 

Sharing docs externally 

\- Copy link \- creates a link, permissions are shown below (i.e. Anyone with the link can view)

\- Can set expiry date \- how long a link is valid

\- Can set a password when sharing

\- Can block download of a file (viewable only in a browser)

\- Can create a Microsoft account with any email address to share documents with

 

In the demo, an external user got access to a SharePoint Online site using his/her Gmail account by creating a Microsoft account using that Gmail address.

 

 

Where can we control settings \- external sharing

 

\- Tenant level

\- Site collection level \- more restrictive

 

Types of sharing controls

\- Internal only

\- External authenticated

\- Existing external users

\- Anonymous

\- Limit external by domain

\- Can specify a group of people that can share externally

\- More settings exist

 

Anonymous access links expiration & permissions

 

\- Maximum length until anonymous link expires \- 7 days

\- Set max permissions for anonymous links

\-- Files \- View, view and edit

\-- Folders \- View, edit, and upload

 

Who can share outside your organization

 

\- You can set which users can share externally at two levels

\-- Only users in selected security groups share with authenticated external users

\-- Only users in selected security groups share with authenticated external users and using anonymous links

 

You can plan governance / training before users are allowed to share.

 

There are lots of checks that can be implemented to abide by standards.

 

Default link type

 

\- Type of link that is created by default when users get a link

\- Can limit external sharing by domains (known partners)

\- Block specific domains (all allowed except the ones on a list) although "Anyone" links will still be accessible

\- Additional settings

\-- Prevent external users from sharing items they don't own

\-- External users must accept invitations using the same account that invitations were sent to

\-- Continue recipients to continually prove account ownership when they access items

\-- Customized external sharing policy URL \- users trying to share but aren't allowed to

 

Notifications

 

SharePoint can add email address to BCC (i.e. Security team) on all notifications like sharing notifications

 

Admin center \> Policies \> Sharing

 

\- External sharing section

\- This section is the overall policy that dictates how permissive your SharePoint and OneDrive sharing can be

\- SharePoint sharing permissions will need to be more permissive than OneDrive

 

Advanced settings

* Allow specific domains list  
* Block specific domains list (one or the other)  
* Guests must sign in using the same account to which sharing invitations are sent \- setting is not enabled by default (but should be)  
* Allow guests to share items they don't own \- should stay disabled.  
* 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

