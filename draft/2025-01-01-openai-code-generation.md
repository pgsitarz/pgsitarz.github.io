---
visibility: hidden
#tags:
  #- openai
  #- ai-dev
---

# OpenAI Code Generation

As a programming tool, AI is non-deterministic.  Different results will occur for the same prompt, sometimes even no results.

Creating a template (in the templates folder).

JSON file will contain the request:

- ProjectType: 0

Utility that will create for you:
  Controllers
  Foundations
  Models
  Services
  Brokers
  Exception handling
  Tests
  
Seems like this is using some kind of a template to generate all these from CLI.

You can specify ``"usings"`` in ``"global usings"`` or ``csproj`` file.

