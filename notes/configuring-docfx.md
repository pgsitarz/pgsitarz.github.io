# Configuring DocFX

- Install latest .NET if you haven't yet

After you install .NET, run this command if you don't want Microsoft to collect your .NET usage data:

```
setx DOTNET_CLI_TELEMETRY_OPTOUT 1
```
- Follow the DocFX <a href="https://dotnet.github.io/docfx/index.html" target="_blank">Quick Start</a>, it's quite straight forward.

And here are some more tips on how to customize your DocFX experience.

## Git adjustments
- Add ``_site`` folder to ``.gitignore`` in addition to any other items your DocFX git repository should avoid having.

## Favicons configuration
- Add all the favicons to the root folder.  It's advisable to generate all the favicons using a generator.
- Add all the favicon images to the resource list in the ``docfx.json``.

## UI customizations
- Add customizations using your own new template (i.e. logo and its size).
    - Add a new template folder in the root of your repo - name it repo-name-template, as an example.
    - Add ``main.css`` to the repo-name-template\public\ subfolder.
    - Use the ``main.css`` to specify customizations.
- Add the source folder for the modern template to the root of your DocFX repo and add it to the list of templates in the ``docfx.json``.
- Edit the modern template's ``_master.tmpl`` and add all the ``<link>`` references for all the icon sizes and the Apple touch icon.

## DocFX Companion Tools

These tools are very useful, for example, using the DocFXTocGenerator your site will generate all the menu links from existing content (.md files) recursively.

- <a href="https://github.com/Ellerbach/docfx-companion-tools" target="window">DocFX Companion Tools</a>

To set up DocFxTocGenerator, simply install the DocFxTocGenerator on your machine using the dotnet tool:

```powershell
dotnet tool install DocFxTocGenerator -g
```

The instructions for doing the above are <a href="https://github.com/Ellerbach/docfx-companion-tools?tab=readme-ov-file" target="window">here</a>.

Then add this line of code for each of your documentation folder in your DocFx site:

```powershell
DocFxTocGenerator -d ./docs -vs
```

The explanation for the parameters v and s is <a href="https://github.com/Ellerbach/docfx-companion-tools/tree/main/src/DocFxTocGenerator">here</a>.

With the DocFxTocGenerator it's easiest to employ a couple of these commands to your git sync file, so that the table of contents are generated automatically before the pages are pushed to the repository.

To find more extensions to DocFX be sure to visit <a href="https://dotnet.github.io/docfx/extensions/tools.html">DocFX Tools</a>.

A list of organizations that use DocFX:
- https://github.com/dotnet/docfx/discussions/9002

To use DocFX, include it in your API project to generate its documentation.
