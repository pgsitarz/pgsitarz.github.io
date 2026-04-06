---
visibility: hidden
---

# .NET Core Razor Pages

Part 2 \- Add a Model to a Razor Pages App

* The tutorial goes over creating a single model class in code  
* Creates pages for CRUD for the model  
* Created the database from code using Entity Framework migrations  
  * Add-Migration InitialCreate  
  * Update-Database  
* Warnings generated are hidden by the pragma statements or by making the properties nullable.  Alternatively they can be hidden by taking out \<Nullable\>enabled\</Nullable\> out of the project properties files  
* Do you need to run anything when updating a model to update the database?  Or just updating both manually takes care of it?  
*  Excluding keys from scaffolding  
  * \[ScaffoldColumn(false)\]  
  * Excluding this way has to be paired with some mechanism where dates are automatically set within the database (Created and Updated datetime)  
* I cleaned up the warnings by removing the \<Nullable\>Enable\</Nullable\> from the csproj file.  
* 

Part 3 \- Scaffolded Razor Pages

* @page directive makes the file an MVC action.  Now it can handle requests.  It means that now we can do razor-specific markup.  
* @model directive specifies the model type being passed to the razor page.  
* @Html.DisplayNameFor uses inspection to determine the value.  
* @Html.DisplayFor uses evaluation to pull property values.  
* Pages/Shared/\_Layout.cshtml \- layout defined in one place and used in multiple pages in the site.  
  * This \_Layout.cshtml sets the layout page for all pages in the Pages folder.  
* RenderBody() in the layout is a placeholder where page-specific views show up.  
* PageModel base class contains the ViewData dictionary which can be used to pass data to a View using a key-value pattern.  
* Create page model \- .cs file   
  * A property that uses \[BindProperty\] attribute opts-in to model binding.  The posted values bind to the property type.  
  * OnPostAsync runs when page posts form data  
  * If there are any model errors the form is redisplayed with any data posted  
  * Most errors can be handled in client-side  
* Create page \- .cshtml file  
* Tag helpers  
  * Form Tag Helper \- automatically includes an antiforgery token  
    * \<form method="post"\>  
  * Validation Tag Helper \- displays validation errors  
    * \<div asp-validation-summary\> and \<span asp-validation-for\>  
  * Label Tag Helper \- generates label caption and \[for\] attribute  
    * \<label asp-for="Person.Name" class="control-label"\>\</label\>  
  * Input Tag Helper \- uses DataAnnotations attributes and produces HTML attributes needed for jQuery Validation on the client side  
    * \<input asp-for="Person.Name" class="form-control"\>  
  * There is a separate article on tag helpers

Part 4 \- Work with a database

* Created the SeedData.cs which gets called on app start  
* If database is empty it runs SeeData to populate the database using the code

Part 5, update the generated pages in an ASP.NET Core app

* Add \[Display(Name=”Alternative Field Name”\] to a field in the Entity class or model to give the field a name which will display with @Html.GetDisplayFor(“FieldName”)  
* This functionality is within System.ComponentModel.DataAnnotations  
* Route template  
  * Adding "{id:int}" to the @page directive creates a new route  
    * i.e. /Jobs/Edit/1  
    * /jobs/details/1  
* When editing an entity that was deleted in the meantime the page will route to NotFound (404) by catching the DbUpdateConcurrencyException exception  
  * Concurrency exception handling explained in more detail [here](https://docs.microsoft.com/en-us/aspnet/core/data/ef-rp/concurrency?view=aspnetcore-6.0) 

Part 6, add search to ASP.NET Core Razor Pages

* \[BindProperty\] attribute added to a class variable in the IndexModel class  
* \[BindProperty\] binds form values and query strings with the same name as the property.  
* \[BindProperty(SupportsGet \= true)\]  
* Adding @page "{searchString?}" to the @page directive now accepts the parameter as part of the url, i.e. /Jobs/Excel will populate SearchString with “Excel”  
* Added a drop-down to filter by Delivery Type (Report-Excel, Screen, Report)  
  * string JobDeliveryType variable in IndexModel used as param  
  * SelectList DeliveryTypes variable in IndexModel used as a drop-down  
  * The SelectList is populated within OnGetAsync  
  * \<select\> element with asp-items bound to Model.DeliveryTypes in Index.cshtml (this is bound to IndexModel model) and asp-for=”JobDeliveryType”  
  * Submit button invokes the call to invoke the OnGetAsync  
* One less in this section is that there are two models  
  * Database model   
  * Page model

Part 7, add a new field to a Razor Page in ASP.NET Core

* Trying to see what Code First Migrations can do to speed up development  
* Three main approaches to updating the database (from updated model)  
  1. EF to drop database and recreate it \- complete data loss  
  2. Manually modify the database using database tools  
  3. Use Code Migrations to update database

Razor Pages with Entity Framework Core in ASP.NET Core \- Tutorial 1 of 8  
[https://docs.microsoft.com/en-us/aspnet/core/data/ef-rp/intro?view=aspnetcore-6.0\&tabs=visual-studio](https://docs.microsoft.com/en-us/aspnet/core/data/ef-rp/intro?view=aspnetcore-6.0&tabs=visual-studio)

I’m not sure I understand the OnModelCreating method and its purpose.

In EF to use a foreign key you have to use a variable name that ends with “ID”.  The model doesn’t know which table you’re referencing with this foreign key ID property, it is just of data type integer (int).

To use the /Edit/1 URL pattern the directive format @page {id:int?} must be added at the top of the CSHTML file.

Overeposting is when a hacker sends in additional fields to save, even if the fields are not specified in the save form.

Some interesting topics to review

- [Async Overview](https://docs.microsoft.com/en-us/dotnet/standard/async)  
- [Asynchronous Programming with async and await](https://docs.microsoft.com/en-us/dotnet/csharp/programming-guide/concepts/async/)

Only these types of methods, which are sent to the database, are asynchronous:

* ToListAsync  
* SingleOrDefaultAsync  
* FirstOrDefaultAsync  
* SaveChangesAsync

Queries like .Where(a \=\> a.LastName \== “Smith”) are not asynchronous.  This query does not query a database, it only sets the query logic.

EF Core context is not thread safe, running operations in parallel will make them overlap.  Make sure any libraries in an app using EF Core are using asynchronous calls with EF.

Always do .Take(x) when pulling records from the database.  When using paging, use the .Take with a paging row count parameter.

So for this tutorial I substituted my own app \- statscale.app.  For the student entity I have the account entity.  For enrollment I have the job.  So an account can have multiple jobs.  

**Statscale relationship model \- move this to Statscale spec later on:**

* A job can only be linked to one account.  Jobs cannot be co-owned (only shared).    
  * Relationship: Account 1 : N Job  
* A job can only be linked to one query.  A single query can be linked to multiple jobs.    
  * Relationship: Job N : 1 Query  
* A query can be linked to 1 data source.  1 data source can be linked to multiple queries.  
  * Relationship: Query N : 1 Data Source.  
* A single job can have multiple notifications.    
  * Relationship: Job 1 : N Notifications  
* A single job can have multiple schedules  
  * Relationship: Job 1 : N Schedules

Do the account sign in later, for now create all jobs with Account Id \= 1\.  Code it in the place where a signed in account will be picked up.  Right now it’s in the OnPostAsync of Create.cshtml.cs.

When creating associations and navigation properties in model classes, and then running migrations, the value in a table’s FK field has to exist in the Id of the referenced table.  Someone pointed this out [here](https://stackoverflow.com/questions/21839309/the-alter-table-statement-conflicted-with-the-foreign-key-constraint) after I googled it because the error was not clear.

After I define the relationships I have to create the dropdowns in the page.

After messing up my migrations by adding too many changes at once I had to roll them back with Update-Database *SpecificMigrationName* (from the past) and perform Remove-Migration (no parameters) for each of the bad changes I made when I tried to fix the issue.  This [post](https://stackoverflow.com/questions/66153253/ef-core-add-migration-issue-how-to-fix-out-of-sync-migration) helped.

.Net Core Razor Pages prefers the view model and not the domain model because the latter contains all fields in the UI, whereas the view model only contains the necessary fields.  So far as I understand it’s only used for saving though.

Creating JobVM to use as saving and editing jobs.  Will have to do the same thing for other entities.  Creating and editing all pages works now with rudimentary relationships set.  They have to be adjusted.  So right now we may have to create the view models for saving and editing.

Somehow part 2 of this tutorial didn’t cover yet using the view model to do edits, only creates.  It does go over some delete code ideas like printing messages when delete issues come up.

Naming an entity “History” has some internal conflicts within EF or .Net Core.  An exception bubbles up that I did not try to solve.  “History” seemed to be quite a generic term.  I renamed it to ReportLog because the main importance of logging will be the results of the reports (scheduled or not).

Keep folder names different from the entity names \- i.e. if an entity is singular, make the folder name plural, otherwise this error will come up:

* **\[xyz\]** is a namespace but is used like a type

Associate a 1-to-many relationship this way in EF and Razor Pages Core app:

1. Create the FK ID field in the entity model (FK: ModelNameId) in the entity class (from which the reference is 1\) and create the public DataType Table property with the get and set properties  
2. Build the app (the .exe server will want to restart)  
3. Add-Migration AddedTableIdFKFromReferringTableModel  
4. Update-Database  
5. If this table does not have data already then it will not fail because its data is not referencing the table yet  
6. Add the navigation property in the model for which the FK in step 1 is referring  
7. Add-Migration **does not** have to be run because it is only a navigation property, not a database change  
8. 

Standard for page naming is below.  The ViewData\[‘Title’\] can be assigned the exact name per below (“Statscale |” is prepended automatically):

* Index page \- Entity plural, i.e. Reports, Schedules, Data Sources  
* Edit page \- Edit \[Entity Name\], i.e. Edit Report  
* Details page \- \[Entity Name\] Details, i.e. Report Details  
* Delete page \- Delete \[Entity Name\], i.e. Delete Report  
* Create page \- Create \[Entity Name\], i.e. Create Report, Create Schedule, etc.


Each index page:

1. Sort by Created then Updated descending date, then by the entity name  
2. Apply sortable headers on the entity name, created and updated headers, plus any other headers it would make sense to sort

To add a new entity create the class file, inherit from BaseEntity, and add it to the context.cs.  Don’t create the FK fields yet until the database table is created with the basic fields.

\-- I deleted a few records that were FKs on another table and the whole Index didn’t show up because I had .Include(r \=\> r.Account) in the OnGetAsync().

The part 4 talks about removing EnsureCreated but I’ve already removed it a while back because it recreates the entire database each time the app starts up.

Main ways to deploy database into production:

* Using migrations to create SQL scripts and using the SQL scripts in deployment.  
* Running dotnet ef database update from a controlled environment.

The first option is to create or let software create automated scripts for creating the database.  The second option is to update the database using the dotnet command.

Chapter 6

\[DataType(DataType.Date)\] \- this specifies a data type that’s more specific than the database intrinsic type.

