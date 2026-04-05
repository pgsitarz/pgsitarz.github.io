---
label: Home
icon: home
---

## GitHub education for students

https://www.youtube.com/watch?v=umRy69br51E

{{ for post in content.blog.posts | array.limit 4 ~}}
[!card vert]({{ post.filePath }})
{{ end }}



