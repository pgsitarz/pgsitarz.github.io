---
label: Home
icon: home
---

# Azure Cosmos DB Conf 2026

https://www.youtube.com/watch?v=OdPFriVuKtU&list=PLlrxD0HtieHh0o6VplO6WczH89pVWJwP1

# Introducing Azure AI Foundry - Everything you need for AI development

https://www.youtube.com/watch?v=GD7MnIwAxYM

## Microsoft Fabric | Unify your data for analytics & AI with Shortcuts, Mirroring & Data Factory

https://www.youtube.com/watch?v=jjNlksIlDnE


## GitHub education for students

https://www.youtube.com/watch?v=umRy69br51E

## Latest posts

{{ for post in content.blog.posts | array.limit 4 ~}}
[!card vert]({{ post.filePath }})
{{ end }}
