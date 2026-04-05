---
visibility: hidden
---

# Using Razor Pages with Entra



```
public class IndexModel : PageModel
{
    public string UserEmail { get; set; }

    public void OnGet()
    {
        // 1. Get the user's display name or email from the standard header
        UserEmail = Request.Headers["X-MS-CLIENT-PRINCIPAL-NAME"];

        // 2. If you need the unique ID (Object ID) from Entra
        var userId = Request.Headers["X-MS-CLIENT-PRINCIPAL-ID"];
    }
}
```
