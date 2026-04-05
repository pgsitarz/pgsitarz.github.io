---
visibility: hidden
---

# Programming in C\# JumpStart

1 \- Object Oriented Programming, Managed Languages and C\#

* Object oriented language: Encapsulation, Polymorphism, Inheritance  
  * Encapsulation via  
    * Unified type system  
    * Classes and interfaces  
    * Properties, methods and events

Encapsulation isn't really done with properties.  Object implementation is done via properties.  Methods are a form of encapsulation, but events aren't.  Events are just events.

* Managed Language: has services that support the runtime environment (language libraries, i.e. System.Net)  
* Managed code is executed by CLR, common language runtime  
* CLR manages: memory automatically, exception handling, standard types, security  
* Type is the language foundation  
* Standard Types  
  * Type defines what object is  
    * Metadata based on what Type it is  
      * memory allocation  
      * what properties are exposed  
      * what methods implemented  
      * levels of access  
* Value types directly store values; Reference types store objects, Pointer types (available in unsafe code \- talks to memory directly w/o C\# system libraries)  
* Object metadata: about space allocation and for compile-time type checking  
* Features in C\#

![][image1]

   

* Generics can help you templetize  
* Unified Type System  
  * Identified all universal or repetitive types, bringing commonality  
* Inheritance: class may only inherit from one class  
* Polymorphism  
  * Class can be used as its own type  
  * If you overwrite a virtual method in derived class and cast it back to base class, the derived object method will still be the extended one  
* C\# Productivity  
  * var keyword (variant)  
  * Anonymous types  
    * Not a full definition of type, no name, just a container for variables  
    * Not shareable outside of class library  
* Extension Methods  
  * Does not break encapsulation, not possible to modify code already in class  
  * Useful for sealed classes (or not yours)  
  * Declared as static methods in a static class (first parameter is "this", a modifier)  
* Dynamics  
  * Setting compiler to ignore data type (which isn't possible to compile)  
  * Dangerous because it's per environment  
* Generics  
* Boxing  
  * Take value \- treat as an object  
  * Expensive computationally \- doubling memory space (value and copying value to point an object to it)  
  * hard to keep track what's going on  
  * When do you have to do it?  
    * Avoid using in loops

2 \- Constructing Complex Types

* Classes  
  * Hold data (properties)  
  * Do something with data (methods)  
  * Raise events  
    * EventHandler (defines the shape of a method that event expects to be handling when you raise it)  
      * ie: public event EventHandler HasSpoken;  
      * "event" access modifier  
      * EventHandler is a delegate  
      * If no one is listening (nobody has subscribed) and you call the event, a null is returned  
      * Common class for handling events (more interested in handling an event rather than data that's passed per se)  
      * i.e. After data is loaded raise an event to indicate it is done (instead of passing data around)  
      * Many listeners can be tied to one event

**Declare event handler:**

**public event EventHandler HasSpoken;**

**Subscribe to event handler:**

**dog.HasSpoken \+= dog\_HasSpoken(object sender, EventArgs args)**

* EventHandler has to be specified in a class  
* Instance of a class subscribes to it by setting a method name to call when event occurs

**EventListener1 \> listening on event1**

**EventListener2 \> listening on event1**

**EventListener3 \> listening on event1**

Then event HasSpoken is called, and the 3 EventListeners invoke their methods upon that event because they were listening.

* Inheritance  
  * If you cast up to base class, you don't lose properties of subclass (they're there but hidden)  
  * If you cast up, you change shape of the object (not its "essence" or its current state)

**internal class BaseClass**

    **{**

        **internal virtual void Name()**

        **{**

            **Console.WriteLine("BaseClass");**

        **}**

    **}**

    **internal class DerivedOverride : BaseClass**

    **{**

        **internal override void Name()**

        **{**

            **Console.WriteLine("DerivedClass");**

        **}**

    **}**

    **internal class DerivedNew : BaseClass**

    **{**

        **internal new void Name()**

        **{**

            **Console.WriteLine("DerivedNew");**

        **}**

    **}**

    **internal class DerivedOverwrite : BaseClass**

    **{**

        **internal void Name()**

        **{**

            **Console.WriteLine("DerivedOverwrite");**

        **}**

    **}**

* Reason for overriding  
  * Add additional operations for a specific i.e. database that didn't exist in base class  
    * Even if casted up to base class, this instance will still have the new capabilities for the new database  
      * In this case call base.method() if needing to use base functionality also  
* Generics  
  * Replaces the need for implementing functionality for a specific type  
  * You can implement the functionality for all types  
  * New concept of type parameters  
* Boxing / Unboxing  
  * Boxing  
    * Casting into a reference type from value type  
    * Doubling on memory  
    * Hard time keeping track

Important point on boxing using an example:

**int count \= 1;**

**object countReference \= count;**

The countReference has its own copy of the count value.  If you increment count integer the countReference won't reflect it.  The object countReference doubled the memory used up by using this one variable.

* **foreach** works with IEnumerable collections  
* Casting or checking data type  
  * var d \= dog as Dog;  
  * var d \= (Dog)dog;  
  * i.e.: if dog is Dog  
* String, StringBuilder  
  * Any methods used with strings create a new string object  
* Regular Expressions (text namespace)  
  * create patterns...

4 \- Features of C\#

code reflection

window into object metadata and allows us to use it programmatically

isn't free, use it with "care"

using reflection we interrogate objects

Activator.CreateInstance

Getting reflection data

1\. Type y \= x.GetType();

2\. typeof(x);

PropertyInfo \- datatype for properties of class

using .Equals when comparing strings:

.Equals("sampleString", StringComparison.InvariantCulture);

You can work with generics using reflection.

**working with garbage collection**

\-automatic mem mgmt / clr

\-doesn't do it right away (for performance)

\--objects used for short time, get collected quicker

\--objects living for a long time, get collected slower

\--gc targets easy ones first, then harder ones later

\--gc is automatic, but we can influence

\--gc is expensive, per algorithm

\--gc runs when it detects pressure

**// just collecting...everything stops...while collecting**

**GC.Collect();**

**// waits for processes to finish, calling finalizers (what does that mean?) before it collects again**

**GC.WaitForPendingFinalizers();**

**// collects ones that finalized?**

**GC.Collect();**

starting up gc is "calling in a lion to eat up other animal orphans\!" :P

**disposable patterns**

**IDisposable** \- allows us to implement, marks up an object, pre-emptively dispose itself prior to gc

makes you implement Dispose() method

\~ConstructorName:

\-generally used to implement IDisposable

Disposed object is unusable.

**using** will call Dispose() at the end

1\. Close \- things that you've opened, ie file

2\. Dispose \- superset of close, if you dispose you should close, but also set things to null (?)

3\. Stop \- i.e. timer, to stop a timer, restart a timer, but maintains its state

**memory leaks**

\- managed memory leaks

\- out of scope objects (still referenced)...are memory leaks

\- unsubscribe from events proactively (they can be leaks)

5 \- Advanced C\#...

**type & value validation**

as a developer trust nobody/nothing coming into the system, to prevent:

\-overflow....???

\-incorrect results

\-side-effects

\-security intrusions

and provide guidance to systems or users

* Data validation  
* Validate object type is correct  
* Debug / trace Assert() methods

couple of examples, ie:

1\. if(string.IsNullOrWhiteSpace(value)){ throw new ArguementNullException("value"); }

2\. if(value \== this.Name) { throw new ArguementException("value is duplicate"); }

throw exceptions of type:

\-ArguementNullException

\-ArgumentException

\-NotSupportedException

\-Exception

\-NotImplementedException

**data contracts**

"design by contract"

\-predefine how to interact with methods, properties

\-predicate indicates membership is true

\-predicate is a contract

Contract.Requires(\!string.IsNullOrWhiteSpace(value), "value is empty ");

this.Name \= value;

Contract.Ensures(\!string.IsNullOrWhiteSpace(Contract.Result\<string\>()))r;

Contract.EndContractBlock(); // any validation above it makes it a contract...any violations become contract exceptions...  awesome?

Basic approach to data validation?

Handle events from contract validation (can be ignored).

**unhandled exceptions** \- exception thrown outside of try block

\-in wpf / desktop environments, an event gets raised when unhandled exception occurs (you can trap on that level)

\-specific exception catches give you ability to tell what went wrong (use it\!)

\-then use a bucket to catch others..., i.e.: catch (Exception e)

\-finally..is a promise, no matter what happens, finally block will run

\-in finally you can check if anything in try went wrong and rectify... i.e. close all opened files in try block (that were left open when exception occurred)

**encryption techniques** \- take encryption and making it unreadable

\-not really about security

\-you can encrypt manually from file properties \> advanced

\-hashing...value derived from content

**6 \- Splitting assemblies, WinMD, Diagnostics**

**assemblies and namespaces**

Project : assembly (1:1), single file, whatever your project ends up being (exe, dll, winmd \- windows component)

Namespace \- logical grouping of code, can span multiple assemblies, a scope

Assembly can be digitally signed

Example of same namespace in multiple assemblies:

\-base code of app

\-unit tests

Components, dlls, are installed into global assembly cache.  GAC replaces having to register in COM days.

You can use GPO (group policy) to deploy assemblies in the GAC.

**sharing assemblies**

\-class libraries \- assemblies that can be shared

\-portable class libraries \- assemblies to share across OSs

\-WinMD/Windows Metadata \- for windows store apps to be shared across languages

**diagnostics instrumentation**

instrumentation \- code reporting performance

telemetry \- gathers instruments for analysis

analysis \- using telemetry to track error trends

not making things faster, but better

establish a baseline, to base whether things are slow or not

.net windows has telemetry

**performance counters**

have to have permissions to do performance counters

var perfCounter \= new PerformanceCounter

{

    CategoryName \= category,

    CounterName \= counter,

    MachineName \= machine,

    ReadOnly \= false

}

perfCounter.IncrementBy(10);

Tracing \- info msgs during regular runtime

Event logs \- 

1/ user logged in

2/ invoice submitted

etc, great way to see what's going on

Write stacktrace in the event log

To do diagnostics...go to:

Analyze \> Launch Performance Wizard \> Instrumentation \> select project

Now it's capturing instrumentation outputs (profiling)

(Observing might change what's being observed)

Hot paths \- methods that take longest... (sorted longest on top)

Compilers smartly optimize the code, so human looking at code sometimes can't be right determining something's slow \- instead run analysis first.

Do profile analysis in release build to **production (true environment)**.

When you change build in VS you change build configuration you change optimization, which changes execution path behind the scenes.

Control when to write to performance counters.

**Questions**

1. What are Optional Args?  
2. What is Covariance?  
3. What is Caller Attr?  
4. What's the shortcut for duplicating a method?  
5. Is it possible to use Generics with Interfaces?  How?  
   1. If a class implements an interface (has specific methods), can a generic class taking in a specific type (that implements that interface, and do something specific?  
   2. Meaning can a generic class be a class that takes in a type that implements something and do operations on that type calling that instances methods? (because it implemented that specific interface)?

[image1]: <data:image/png;base64,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>