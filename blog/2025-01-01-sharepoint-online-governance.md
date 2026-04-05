# SharePoint Online Governance Guidelines

## Basic guidelines

- What's a great sharepoint online governance tool? 
- How to get a full listing of all sites and site types?
- How to make permissions to all of these sites consitent?
- How to give only specific AD groups the ownership of the root site?
- How to give only specific AD groups the member role?
- How to give everyone the viewer role on the root site?
- No AD members, except people of a specific AD group, can create SharePoint sites.
- Site owners can only give permissions, they cannot create subsites.
- Unique permissions can only exist at the site level (no unique permissions on a list for example).
- Enforce only three roles - owners, members, and visitors.  No roles like "Members without delete", etc.

## Recommendations

Keeping SharePoint from turning into the "Wild West" is all about balance. If you're looking for a "plain and simple" approach that focuses on centralization and consistency, here is a foundational set of rules to keep your environment clean.

## 1. Site Provisioning (The "Who Can Build" Rule)

To prevent "site sprawl," creating new sites should be a controlled process rather than a free-for-all.

* **Rule:** **Self-service site creation is disabled.**
* **The Workflow:** Users must submit a request (via a simple form or ticket). Only members of a specific **Active Directory (AD) Group** (e.g., "SharePoint Admins" or "IT Service Desk") have the technical rights to click the "Create Site" button.
* **The Benefit:** This ensures every site has a clear purpose, a defined owner, and follows naming conventions before it even exists.

---

## 2. Permission Structure (The "AD Group" Rule)

Managing individual users inside SharePoint is a nightmare for scaling. Consistency comes from using groups.

* **Rule:** **Never assign permissions to individual people.** * **The Workflow:** 1.  Create an AD Group (or Microsoft 365 Group).
2.  Add the user to that AD Group.
3.  Add the AD Group to the SharePoint Site Group (Owners, Members, or Visitors).
* **The Benefit:** When an employee leaves or changes roles, IT updates their AD account, and their access is automatically revoked or updated across all SharePoint sites simultaneously.

---

## 3. Inheritance (The "Keep It Simple" Rule)

Breaking permissions at the folder or document level creates "hidden" access that is hard to audit.

* **Rule:** **Permissions are managed at the Site or Library level only.**
* **The Workflow:** If a specific folder needs secret access that the rest of the site shouldn't see, **create a new site** or a separate library instead of "breaking inheritance" on that folder.
* **The Benefit:** You can tell exactly who has access to what just by looking at the top-level settings.

---

## 4. External Sharing (The "Lock the Gate" Rule)

Uncontrolled sharing can lead to data leaks.

* **Rule:** **External sharing is disabled by default** and only enabled on a per-site basis for specific "Extranet" sites.
* **The Workflow:** If a team needs to collaborate with a vendor, they request a specific "External-Enabled" site. All other internal sites remain strictly "Internal Only."
* **The Benefit:** No one can accidentally share a sensitive internal payroll folder with a Gmail address.

---

## 5. Lifecycle Management (The "Cleanup" Rule)

Sites shouldn't live forever if they aren't being used.

* **Rule:** **Annual Site Attestation.**
* **The Workflow:** Once a year, Site Owners receive a notification to confirm the site is still needed. If the owner has left the company or doesn't respond, the site is backed up and deleted.
* **The Benefit:** Keeps your storage costs down and ensures your search results aren't cluttered with "Project Alpha - 2019" drafts.

---

### Summary Table for Quick Reference

| Feature | Policy |
| --- | --- |
| **Site Creation** | Centralized (Only via IT/AD Group) |
| **Access Control** | AD Groups Only (No individual users) |
| **Permission Level** | Top-level (No unique folder permissions) |
| **External Sharing** | Off by default (Enabled only by request) |
| **Site Naming** | Must follow prefix (e.g., DEPT-SiteName) |

The Logic: This prevents "accidental oversharing" where a user thinks they are sharing a file with a colleague but actually sends an anonymous link to the whole internet.
