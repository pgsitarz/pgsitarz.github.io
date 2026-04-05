# PowerShell Guide

Here's a rolling history of some PowerShell solutions.

```
.\sync.ps1 : File C:\Users\username\source\repos\repo\script.ps1 cannot be loaded because running scripts is disabled on this system. For more information, see about_Execution_Policies at https:/go.microsoft.com/fwlink/?LinkID=135170.
At line:1 char:1
+ .\script.ps1
+ ~~~~~~~~~~
    + CategoryInfo          : SecurityError: (:) [], PSSecurityException
    + FullyQualifiedErrorId : UnauthorizedAccess
```

The solution is to create a policy to allow running 

```
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope LocalMachine
```

The `RemoteSigned` execution policy requires that:

- Scripts created locally (on your machine) can run without any digital signature.
- Scripts downloaded from the internet (including email attachments or web downloads) must be digitally signed by a trusted publisher before they can run.
