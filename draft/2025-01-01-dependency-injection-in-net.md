# Dependency Injection in ASP.NET Core

Manual Scope Creation

Another course exists for Hosted Services and Background Services

* Extending the container usingScrutor  
* Scanning for services  
* Decorating services  
* Using a Third-party container

Scrutor

- Assembly scanning   
- Decorator pattern  
- Get the PackageReference and paste it into the **csproj** ItemGroup

What is assembly scanning?

**Some additional notes I found in a local file pasted below:**

public class MyClass  
	\- uses MyProjectContext instance, accepts it as IProjectContext in constructor, declares it class-global

public interface IProjectContext

public class MyProjectContext  
	\- inherits/implements from DbContext, implements IProjectContext  
\--  
also make sure they are registered in the service container

\--

IServiceProvider  
	registered at start-up  
	added to IServiceCollection  
	BuildSercviceProvider to create the service container

Inject the service into the constructor of the class where it's used  
Framework is responsible for creating an instance and disposal

\-  
You must have a service interface with the concrete type that implements it to have a full service  
It must be registered with AddScoped/AddSingleton to the service provider  
It must register the worker service where the service will be used
