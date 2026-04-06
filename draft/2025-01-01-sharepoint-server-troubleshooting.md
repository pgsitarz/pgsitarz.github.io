---
tags:
  - sharepoint-server
visibility: hidden  
---

# SharePoint Server Troubleshooting

1. Log into the server and run PowerShell with SharePoint shell permissions
2. Run the following command

```
Get-SPLogEvent | ?{$_.Correlation -eq "a12345678-b987-1234-1234-123456789012"}
```
