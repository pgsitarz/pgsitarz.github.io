---
Tags:
  - local-dev
  - .net-dev
  - codespaces
  - github
---
# Local .NET Development
(This is very much in progress.)

The best way to do dev these days is to store code in GitHub and use Codespaces, if you aren't afraid of doing coding in the browser.  If you still want to use your OS based software, do use GitHub for code source storage (versioning, pipelines, etc.) and release management.

<a href="https://docs.github.com/en/codespaces/guides" target="window">Codespace guides</a>

## Install .NET on your local machine
- Download and install the latest .NET from <a href="https://dotnet.microsoft.com/en-us/download" target="_blank">Microsoft</a>.
- Download and install the Visual Studio 2026 and Visual Studio Code

## Install the git CLI tool for your environment
- <a href="https://git-scm.com/downloads" target="_blank">Git CLI</a>
- Installation of Git is documented in the Git Guide

## Install most recent Visual Studio
- Go to https://code.visualstudio.com/download and download the correct package
- Accept the agreement
- When installing do not select VS Code as default editor for known file types

## Include MSSQL Extension in VS Code
- <a href="https://learn.microsoft.com/en-us/sql/tools/visual-studio-code-extensions/mssql/connect-database-visual-studio-code?view=sql-server-ver16" target="_blank">Quickstart: Connect to and query a database with the MSSQL extension for VIsual Studio Code</a>

## Local cert issue resolution
When lauching your .Net project for the first time, you may run into this SSL error: `NET::ERR_CERT_INVALID`.

Make sure to set your local certificate as trusted:

```powershell
dotnet dev-certs https --trust
```

Setting up the server environment for .NET web app:

- When an app is published, the IIS complains about the app's web.config authentication settings.  We have to give the right file permissions on the folder used in IIS first:
  - ``IISAppPool\[app pool name]``
  - ``IUSR`` (account internal to the server)
- If you're not using DevOps pipelines, give your domain or machine account permissions to the web app folder on the server so that you can publish to it.

