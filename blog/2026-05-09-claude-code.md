---
title: Claude Code Setup
tags: [ai, claude-code]
visibility: visible
---

# Claude Code Setup Notes

Run this in the command prompt (not PowerShell):

```
curl -fsSL https://claude.ai/install.cmd -o install.cmd && install.cmd && del install.cmd
```

This message showed up:

```
⚠ Setup notes:
Native installation exists but C:\Users\user\.local\bin is not in your PATH. Add it by opening: System Properties → Environment Variables → Edit User PATH → New → Add the path above. Then restart your terminal
```

To run ``claude`` from the command, add the path above to the PATH environment variable.

Run ``claude``.  Then this shows up:


```
Claude Code can be used with your Claude subscription or billed based on API usage through your Console account.

Select login method:

 ❯ 1. Claude account with subscription · Pro, Max, Team, or Enterprise
   2. Anthropic Console account · API usage billing
   3. 3rd-party platform · Amazon Bedrock, Microsoft Foundry, or Vertex AI
```

It looks like we hit a paywall here.

Check out [Claude Code Docs for Google Vertex AI](https://code.claude.com/docs/en/google-vertex-ai).

Here we can probably hook up our Firestore database with Claude models.

Where to start to set it up - [Claude Code Docs](https://code.claude.com/docs/en/admin-setup)





