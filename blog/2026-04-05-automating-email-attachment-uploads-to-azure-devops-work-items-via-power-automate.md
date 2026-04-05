---
date: 2026-04-05
tags:
  - devops
  - power-automate
---

# Automating Email Attachment Uploads to Azure DevOps Work Items via Power Automate

This article assumes you know how to implement the following steps first:

1. `When a new email arrives (V3)` - Outlook 365 action
2. `Create a work item` - DevOps action
3. `Apply to each` using Attachments list - Outlook 365 dynamic content item
    - `Send HTTP POST request to DevOps` to upload the attachment file content - DevOps action
    - `Parse JSON` - regular action
    - `Send HTTP POST request to DevOps` to associate uploaded file to the work item - DevOps action

There is an issue at step `3. a` where the attachment is being uploaded.  Attachments can be of various content types, and additionally (but separately) you are having to decide whether the body is Base64 or not.  

Steps:

1. Organization Name - your org name
2. Method - POST
3. Relative URI - `/_apis/wit/attachments?filename=[Attachment Name dynamic content item]&api-version=7.1`
4. Headers - Only one header: `content-type` of value `items('Apply_to_each')?['contentType']`
5. Body - `binary(items('Apply_to_each')?['contentBytes'])`
6. Body is Base64: `Yes`

## References
- <a href="https://techcommunity.microsoft.com/blog/integrationsonazureblog/attaching-a-file-to-a-devops-work-item/3747394" target="_blank">[techcommunity.microsoft.com] Attaching a file to a DevOps Work Item</a>