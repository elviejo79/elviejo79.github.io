     <meta charset="utf-8" emacsmode="-*- markdown -*-"><link rel="stylesheet" href="https://casual-effects.com/markdeep/latest/apidoc.css?"">

                          ** My Idea of an IBIS Languga**

IBIS is a way to map conversations and dialogues to solve, wicked problems.
I'm a big fan of it, because that is how my brain works.
However I don't like the point and click tools to create IBIS maps.
I rather write them as conversations.

This is my working map of what it.


## The goal

### First version

#### I want to type this:


``` 
@@ex1/mytyping
```

#### When the formating happens
But I want the code editor, when it does the reformating to show this:

``` 
@@ex1/reformated
```

Notice that it kind of re-organizes the code, putting the question first... and the id ...
because when I start typing I'm not 100% sure if its a proporsar or an idea.
the 

`.` is used to represent note?? mabye not... I want to be able to add details to a node, like links and stuff.. but not too many nodes. (maybe like icons surrounding the text?
`!` is used to represent an idea
`?` is used to represent a question)

#### I want to see 

[1st version of map](https://eight2late.files.wordpress.com/2009/04/no_silver_bullet_stage11.jpg)


### 2nd verion

Once I have the first version the map can grow like this:

```
@@ex2/mytyping
```

#### The autoforamtter 

Would of course change it to icons first:

``` yaml
@@ex2/reformatted
```

<div class="admonition note">
Notice that it seems that the colons are the id... maybe something to consider for when I need
</div>

#### The image
What I want to see:

[2nd iteration](https://eight2late.files.wordpress.com/2009/04/no_silver_bullet_stage4.jpg?w=700&h=729)


### 3rd edition

Now the important thing... sometimes the pros and cons are the same

#### I want to write

``` yaml
? Why is there no silver bullet in software engineering?
 . Silver Bullet: any software engineering development that can produce a tenfold or better improvement in programming productivity.
 * Essential difficulties : Those related to conceptualization design
    ? What are the essential difficultios of designing software?
        * Complexity: no two parts alike; many states; nonlinear interactions between modules.
        * Comformity: must conform to arbritray conditions (business rules, existin systems)
        * Changeability: often required to change difficulty of change understimated.
        * Invisibility: structure cannot be vsualized (flowcharts and visual modelling languages are very limited)
 ? What silver bullets have been proposed to date?
    * These address indcidental difficulties (those related to implementation).
         for example?
            * OOP
                + Improved programmer productivity (ipp)
                - Do not help in software design (nodesing)
            * Better Hardware
                # ipp ---- notice that I mean a reference to the same above
                # nodesign ----notice that I mean a reference to the one above (so a pro and a con the same way)
            * High level languages
                # ipp
                # nodesign
            * Better tools - IDEs, etc.
                # ipp
                # no design
            * AI / Expert systems
                - limited applicability (la)
                # no design
            * Program Verification
                # la
```

##### But the auto formatter should show:

``` yaml
? Why is there no silver bullet in software engineering?
 . Silver Bullet: any software engineering development that can produce a tenfold or better improvement in programming productivity.
 * Essential difficulties : Those related to conceptualization design
    ? What are the essential difficultios of designing software?
        * Complexity: no two parts alike; many states; nonlinear interactions between modules.
        * Comformity: must conform to arbritray conditions (business rules, existin systems)
        * Changeability: often required to change difficulty of change understimated.
        * Invisibility: structure cannot be vsualized (flowcharts and visual modelling languages are very limited)
 ? What silver bullets have been proposed to date?
    * These address indcidental difficulties (those related to implementation).
         for example?
            * OOP
                + Improved programmer productivity (ipp)
                - Do not help in software design (nodesing)
            * Better Hardware
                + ipp ---- notice that I mean a reference to the same above
                - nodesign ----notice that I mean a reference to the one above (so a pro and a con the same way)
            * High level languages
                + ipp
                - nodesign
            * Better tools - IDEs, etc.
                + ipp
                - no design
            * AI / Expert systems
                - limited applicability (la)
                - no design
            * Program Verification
                - la
``````


Obeserve that the pros and cons are insert with the correct sign.
this is because a pro can be a con in another... this is common.


##### How it should look

[3rd](https://eight2late.files.wordpress.com/2009/04/no_silver_bullet_stage4.jpg?w=700&h=729)


**Thing** is a thing used to do stuff for various platforms. Some of the things it can do:

* Run on a computer
* Exit with an exit code
* Be a replacement for our old system, `theoldthing.exe`


## Invoking it

<div class="admonition note">
This is a note by the way!
</div>

From the root folder, run "thing" with the target name, e.g.: `thing Yes`

* On Mac, Linux or Windows PowerShell, you'll want to use `./thing` instead of just `thing`.
* Target and option names are case sensitive!
* Several things to do can be specified: `thing Yes No FileNotFound`

Additional options can be passed via `-sNAME=VALUE` arguments. Most common ones are CONFIG
(used to indicate debug or release thing) and PLATFORM (used to indicate 32 vs 64 bit thing).


### Subsection on stuff


Thing Name              | Description        |Notes
------------------------|--------------------|-----
Yes                     | Yup!               |
No                      | Nope :(            |
FileNotFound            | Doesn't find files | Pass `-sFIND_FILE=maybe` to maybe find them


## Markdeep syntax test

Regular styling like **bold**, _italics_, ~~strikethrough~~, `inline code`, the stuff.

* A
* Bullet
* List

And:

1. A
1. Numbered
1. List!

Symbol substitutions: a 45-degree turn; som x -> y arrows; some whoa ==> fancy <==> arrows.

Is this a definition list?
:   Looks like one to me
Is that right?
:   Possibly!

And a code listing:

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
int main()
{
    return 1;
}
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Markdeep diagrams:

*******************************************  Here's a text to the right of the diagram,
* +-----------------+           .-.       *  ain't that fancy. Pretty fancy indeed, I
* |\                |        .-+   |      *  must say! Markdeep diagrams are generally
* | \     A-B   *---+--> .--+       '--.  *  enclosed into a rectangle full made of `*`
* |  \              |   |     Cloud!    | *  symbols; and are "drawn" using ASCII-art
* +---+-------------+    '-------------'  *  style, with `- | + / \ * o` etc.
*******************************************  Suh-weet!


Another random diagram, just because:

********************
*    +-+-+-+-*-o   *
*   / / ^ /        *
*  / v / /         *
* +-+-+-+          *
********************

!!! Note
    Hey I'm a note. Don't mind me, I'm just sitting here.

!!! WARNING
    I'm a warning, perhaps. *Something might happen!*

And other admonitions:

!!! Error: Never Pass `nullptr` to a Shader
    Invoking a shader with a null argument can seg fault.
    This is a multi-line admonition.

    Seriously, don't call shaders like that.



The table of contents that Markdeep produces is stuffed on the right side, 
if the browser window is wide enough. Otherwise it is hidden.

<style class="fallback">body{visibility:hidden}</style><script>markdeepOptions={tocStyle:'medium'};</script>
<!-- Markdeep: --><script src="https://casual-effects.com/markdeep/latest/markdeep.min.js?" charset="utf-8"></script>
