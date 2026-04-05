---
tags: retype
---

# Updating the Retype app

Here are a few notes on updating the retype app.  I originally installed it with the ``dotnet`` command, so I have to continue using ``dotnet`` to update the retypeapp.

```
dotnet tool update retypeapp -g --version 4.5.0-preview5
```

However for the retype-action.yml in GitHub, this will get it to build:

```
 - uses: retypeapp/action-build@next
```
