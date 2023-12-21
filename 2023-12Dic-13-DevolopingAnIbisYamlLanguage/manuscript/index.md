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

!!! Note
    Notice that it seems that the colons are the id... maybe something to consider for when I need to use ids to reference other sentences

#### The image
What I want to see:

[2nd iteration](https://eight2late.files.wordpress.com/2009/04/no_silver_bullet_stage4.jpg?w=700&h=729)


### 3rd edition

Now the important thing... sometimes the pros and cons are the same

#### I want to write

``` yaml
@@ex3/mytyping
```

##### But the auto formatter should show:

``` yaml
@@ex3/reformatted
```


Obeserve that the pros and cons are insert with the correct sign.
this is because a pro can be a con in another... this is common.


##### How it should look

[3rd](https://eight2late.files.wordpress.com/2009/04/no_silver_bullet_stage4.jpg?w=700&h=729)

# My problem a deadlock.

The problem that I've had is that I've been deadlocked in search for that tool.

```
I want to do many things.
I need to write what I want to do in file.
There are dependencies between things
I need to map the dependencies as graph datastructure.
I want to visualize the graph datastructure as a diagram.
You can use any diagram editor for that.
I **want** to write in text, and visualize in diagram
So I'll add to my list of projects.
I want to do many things, an the cycle begins again!
```

So  I need to break that cycle.

``` ibis
? How can I break the deadlock of organizing my mind?
    * use a tool that already exists, until you can develop your own
? What alternatives do I have? (aggghhh I want to put this nested but it doesn't work)
    * Dot/graphviz
        + It works now and is stable
        + It can handle subgraphs
        + it can have infinite customization.
        - I don't like the syntax
            ? Why?
                * it forces to wre the nodes first and later the edges.
                * it mixes presentation with content
    * Use Flyinglogic
        + I <3 the way it looks
        - It is monthly payment.
        - I can't insert the diagrams in other documents
        - I can't present the diagrams in order.
        - I can't create the diagram from keyboard only
    * Plantuml
        it has the same disadvantages as Dot/grahpviz (this should be a pointer)
    * Use yaml to create a DSL
        + It works today
        + it is whitespace based
        + it favors a tree representation
        + it can *copy* from one branch to another
        + Related, it supports defining ids with the &ampresnand operator and reference with *operator.
        + can be edited in vscode and lapce and many other editors
        + with the redhat extension supports json-schema
        - Dosn't have a native graph representation
            ? How can you provide that?
                * Transform yaml to json |> jsonata |> (diagramming tool: glsp, graphx, d3, cytoscope)
        - it already uses the characters (-) that I want to use for my language
            ? How can you solve that?
                * use complete word + == pros, - == cons, & == id, * == reference
        ! Deal: this is te option I'm going to use
            ? how?
                * create json-schema that forces correct use symbols
                * use an editor like vscode, lapce, doomemacs that have auto complete.
                * find a graphvusalization tool, and produce the json that it uses.
                * use watch in the filesystem so that the graphvisualization gets updated automatically.

```

!!! Note
    One of the things that makes treeNotation special is that we can mix grammars.
    for example the prevous code, could be just a line called ibisLanguage
    and everything nested below it would be parsed using the ibis grammar!
    and then maybe ibisLanguage asHTML would parse the content, and then transform it to HTML...

# What are you going to do.

So now that I have found what I want to do let's do it!


# 2024-December-14

## My current plan

Ok now let's do a simple attempt.
I'm gongo to use the json-graph-format v2
to write a yaml document, probably taken from their samples.
And will try to visualize it.
if it doesn't work then I'm going to create a jsonata query to transform to the v1
and try to visualize it again.

if it works, then I'm going to create a new json schema
basedo on the one for cytoscape or graphx
then will write a yaml document based on their json documents.
again just to test that it works.

then I'll do my next schema, based on one of the two variants
that I have, array of objects or objects with properties and will see
what it does.

## Now let's try with a yaml document

So I have takeng the json-graph examples here:
https://raw.githubusercontent.com/jsongraph/json-graph-specification/master/examples/usual_suspects.json

And transformed it to yaml so it looks like this

``` yaml
@@usual_suspects_json_as_yaml
```

and it works!! it validates the document!!
uff...

## A Visualization with cytoscape
Now we can take that json...
And visualize it using cytoscape.

Like in this link
file://./test/visualize_a_basic_usual_suspects_json.html?graphUrl=https://raw.githubusercontent.com/jsongraph/json-graph-specification/master/examples/les_miserables.json

Observe that to the webpage I send as parameters the url of the json, that is the example
`?graphUrl=https://raw.githubusercontent.com/jsongraph/json-graph-specification/master/examples/les_miserables.json`

That page is just used to execute the javascript
that reads the json data and visualize its using js.cytoscape.org to view it.
Here is the algorithm.


``` html
@@tests/visualize_a_baisc_usual_suspects_json
```

# December 15

## Jsonata to transform jsong-graph example to a version that cytoscape uses

In yesterday's example I don't like that code uses:

``` js
.then(rawData => {
        // Transform nodes
        const nodes = Object.keys(rawData.graph.nodes).map(key => {
            return {
                data: {
                    id: key,
                    ...rawData.graph.nodes[key]
                }
            };
        });

        // Transform edges
        const edges = rawData.graph.edges.map(edge => {
            return {
                data: edge
            };
        });

        // Combine nodes and edges
        const elements = nodes.concat(edges);
```
There is nothing wrong with the code,
but I prefer https://jsonata.org for all my json filtering and transformations.
I think that way the query can be resued in another page.
Or can even be shorter.

## Jsoata attempts
Given this json-graph
https://raw.githubusercontent.com/jsongraph/json-graph-specification/master/examples/les_miserables.json

I want to transform it to something close to this:


``` js
$.graph.id@$graph_title{
    "edges":$.edges.{
        "data":$
    },
    "nodes":$.nodes.$keys()@$id.*.{
        "data":{
            "id":$id,
            "label":$.label,
            "classes":[$.metadata.group.$string()],
            "parent":$graph_title
        }
    }

}
```

### Now I have a new version of the jsonata query that assemblys the result in parts:

``` js
@@tests/qryJsongraphV2ToCytoscape
```

I know, that query looks bigger than the code that it's replacing,
but it does more things.
it is preparing the graph to be displayed using nest graphs.

### Let's create a different visualization

[test/visualize_aJsongraph_withCytoscape.html](file:///home/agarciafdz/r/gh/elv79/elviejo79.github.io/2023-12Dic-13-DevolopingAnIbisYamlLanguage/test/visualize_aJsongraph_withCytoscape.html?graphUrl=https://raw.githubusercontent.com/jsongraph/json-graph-specification/master/examples/les_miserables.json )

it workded!!!

What is the next chanllenge?
Have a nice visualization with ...

### labels, captions and a subgroup

In order to do that
I tried to use the same json of les_miserables
and use grahperx.netliffy.app
because that application already had a button to upload files.

so from les_misebales.json to grapherx
I thouht this jsonato query sohuld be enough:

``` javascript

(
    $n := graph.nodes.*.{
    "id":label,
    "kind":"node",
    "label":label,
    "desc":" ",
    "tags":["transformar el metadata a array the key:value"],
    "parent":"id of thee graph that represents the root",
    "backgroundImageURL":null,
    "has_dynamic_notes":false,
    "is_collapsed":false
};

$e:=graph.edges.{
    "id":source&"-"&target,
    "kind":"edge",
    "label":"label",
    "desc":"desc",
    "tags":[],
    "directed":false,
    "weight":metadata.value,
    "fromId":source,
    "toId":target
};

{"items":$append($e,$n),
  "theme": {
    "name": "minimal",
    "bgfill": "#e5e7eb",
    "grid": false,
    "snapdist": {
      "x": 100,
      "y": 100
    },
    "selectionColor": "#1f2937",
    "highlightColor": "red",
    "nodefill": "white",
    "nodelabelstroke": "black",
    "nodelabelfontsize": 16,
    "nodenotesfontsize": 16,
    "nodeborder": "black",
    "nodeborderradius": 15,
    "nodeBackgroundImageURL": null,
    "edgestroke": "#1f2937",
    "edgeshape": "curved",
    "edgestroketype": "solid",
    "font": "PT Mono",
    "badges": [
      "✅",
      "❌",
      "⚡",
      "👎",
      "👍"
    ]
  },
  "jsondownload": true,
  "jsonupload": true,
  "contextmenu": true,
  "customjson": false,
  "exportcytoscape": true,
  "exportsvg": true,
  "title": "Sample graph",
  "description": "Compound graphs allow nodes to be nested inside each other.",
  "contact": "mailto:eshnil22@gmail.com"
}
)
```

## Test data usual suspects
Turns out that les miserables are too many nodes for grapherx,
so I'm to to test with the usual suspects that is only two nodes and one edges.

https://github.com/jsongraph/json-graph-specification/blob/master/examples/usual_suspects.json

# Saturday December 16

## Let's improve the jsonata query

As part of the transormation for the json.
I still think the query is too complex
In particular this part

``` javascript
$n := graph.nodes.*.{
    "id":label,
    "kind":"node",
    "label":label,
    "desc":" ",
    "tags":["transformar el metadata a array the key:value"],
    "parent":"id of thee graph that represents the root",
    "backgroundImageURL":null,
    "has_dynamic_notes":false,
    "is_collapsed":false
};
```

the ` "id": label` is unsatisfactory because
it shouldn't be the label it should be the ID
that is the name of the object.

### How to insert the id as part of the object
so to make the id as part of the node we can use the each and transfrom operators

``` javascript
graph.nodes.
    $each(function($n, $id) {
    /* currently a node is of the form id:node_object */
    /* we want the node_objet to contain the id itself */
    $n~>|$|{"id":$id}|
    })

```

The `$each` functios splits in value and keys
then we use the transform opertar
to take the node, and just add the "id" field
to it.
the rest of fields in the node are automatically
added to $n.

with that correction now the section looks like this:

``` javascript
$n:=graph.nodes.
    $each(function($n, $id) {
    /* notice: we are injecting the id into the node */
    $merge([$n,{"id":$id}])
    }).
    {
    /*notice: now we use the that comes with the node */
    "id":id,
    "kind":"node",
    "label":label,
    "desc":" ",
    /* notice: we use the metadata as tags */
    "tags":$each(metadata, function($v, $k) {$k & ":" & $v}),
    "parent":"id of thee graph that represents the root",
    "backgroundImageURL":null,
    "has_dynamic_notes":false,
    "is_collapsed":false
    }
```

### Stedi a new playground for jsonata queries:
+ It saves the contents of the frames as part of the URL, so we don't loose it
+ it is easy to share a link to the query
- The debugger gives a wrong position for the error messages.




### Next version of the whole jsonata query
In stedy https://stedi.link/kdqY6J0

But since I don't want to loose my query here is the backup

``` javascript
(
$node_template:=function($id,$label,$metadata,$parentId){{
    "id":$id,
    "kind":"node",
    "label":$label,
    "desc":" ",
    "tags":[$each($metadata, function($v, $k) {$k & ":" & $v})],
    "parent":$parentId,
    "backgroundImageURL":null,
    "has_dynamic_notes":false,
    "is_collapsed":false
  }
};

$rootNode := graph.($node_template(id,label,metadata,null));


 $n:=graph.nodes.
    $each(function($n, $id) {
    /* notice: we are injecting the id into the node */
    $merge([$n,{"id":$id}])
    }).(
      $node_template(id,label,metadata,$rootNode.id)
    )
    ;

$e:=graph.edges.{
    "id":source&"-"&target,
    "kind":"edge",
    "label":relation,
    "desc":"desc",
    "tags":[],
    "directed":relation?true:false,
    "weight":metadata.value,
    "fromId":source,
    "toId":target
};

$const_theme := {
    "name": "minimal",
    "bgfill": "#e5e7eb",
    "grid": false,
    "snapdist": {
      "x": 100,
      "y": 100
    },
    "selectionColor": "#1f2937",
    "highlightColor": "red",
    "nodefill": "white",
    "nodelabelstroke": "black",
    "nodelabelfontsize": 16,
    "nodenotesfontsize": 16,
    "nodeborder": "black",
    "nodeborderradius": 15,
    "nodeBackgroundImageURL": null,
    "edgestroke": "#1f2937",
    "edgeshape": "curved",
    "edgestroketype": "solid",
    "font": "PT Mono",
    "badges": [
      "✅",
      "❌",
      "⚡",
      "👎",
      "👍"
    ]
  },
  "jsondownload": true,
  "jsonupload": true,
  "contextmenu": true,
  "customjson": false,
  "exportcytoscape": true,
  "exportsvg": true,
  "title": "Sample graph",
  "description": "Compound graphs allow nodes to be nested inside each other.",
  "contact": "mailto:eshnil22@gmail.com"
};

$grapherx_formatted:={
    "items":$append($rootNode,$n)~>$append($e)},
    "theme":$const_theme
    };
)
```


# Sunday dec 17?

## Nested graphs

``` yaml
@@ex4/list_of_objects
```

## Monday dey 18

I have finally created a query that transforms the previous json
into a nested structure by types.

Here is the result.
As you can see it has the yaml from yesterday as json
then two jsonata queries
https://try.jsonata.org/ZX5swwLNE

the one that I think is the best is:

` $groupSentencesByTypeAndId`

``` json
@@groupSentencesByTypeAndId
```

However I'll need to check, because some times it seems I'm figthing jsonata a little bit.

Now let's see how it works in the command line

``` bash

$ cat ./src/ex4.list_of_objects.yaml | jfq --accept-yaml --query-file ./src/groupSentencesByTypeAndId.jsonata  > ./srex4.byTypeAndId.json

```

Now in `ex4.byTypeAndId.json` we can see the structure.
It looks well
Although I think that maky jsonata want to use
arrays for nested structures instead of
hashmaps.

this is something I'll need to keep in mind.

### Sentnces only by type and as array

Since I suspect that working with nested arrays
is a more natural way to work with jsonata

I also made another query:

https://try.jsonata.org/XUnlg-DC7

``` json
@@groupSentencesByType.jsonata
```


then executing the query like this
``` bash

$ cat ./src/ex4.list_of_objects.yaml | jfq --accept-yaml --query-file ./src/groupSentencesByType.jsonata  > ./src/ex4.byType.json

```
Gives us a new json

### Now we can see how they will look as yamls

```bash
agarciafdz@agarciafd-lg:~/r/gh/elv79/elviejo79.github.io/2023-12Dic-13-DevolopingAnIbisYamlLanguage
$ cat ./src/ex4.list_of_objects.yaml | jfq --accept-yaml --query-file ./src/groupSentencesByType.jsonata  | yq --yaml-output
Question:
  id: root
  title: What should we do about the one ring?
  Idea:
    - id: gg
      title: Give it to golumm
    - id: gh
      title: Give it to humans
    - id: bm
      title: Burn it in mount mordor
      pro:
        id: ow
        title: its the only way to destroy it
      con:
        id: rd
        title: the road is extremely dangerous
agarciafdz@agarciafd-lg:~/r/gh/elv79/elviejo79.github.io/2023-12Dic-13-DevolopingAnIbisYamlLanguage
$ cat ./src/ex4.list_of_objects.yaml | jfq --accept-yaml --query-file ./src/groupSentencesByTypeAndId.jsonata  | yq --yaml-output
Question:
  root:
    id: root
    title: What should we do about the one ring?
    Idea:
      gg:
        id: gg
        title: Give it to golumm
      gh:
        id: gh
        title: Give it to humans
      bm:
        id: bm
        title: Burn it in mount mordor
        pro:
          ow:
            id: ow
            title: its the only way to destroy it
        con:
          rd:
            id: rd
            title: the road is extremely dangerous

```

I think I like the second one better.

Although I'm not yet satisfied...
mmhhh...

But this should be good enough to create a graph with it...

## transform to jsdot or grapherx or visjs

# Wednesday december 20th

I've spen the last two days trying different queries to graph.
But I haven't done any progress :(

What I have been wondering is a better way to write this by hand
## Yet another way to write

Here is my new query:
https://try.jsonata.org/FFE-gI76l

And this is how it looks in yaml:

``` sh

$ cat ./src/ex4.list_of_objects.yaml | jfq --accept-yaml --query-file ./src/groupSentencesByTypeAndIdTitle.jsonata  | yq --yaml-output
Questions:
  - root: What should we do about the one ring?
    answers:
      - gg: Give it to golumm
        Questions:
          - addicted: Isn't he addicted to the ring?
            answers:
              - ay: Yes,but so what?
                Questions:
                  - yw: So what??!!
      - gh: Give it to humans
        pros:
          - weapon: use the enemys weapon against itself
          - deserve: we deserve it.
        cons:
          - greed: humans greed has failled us once before.
      - bm: Burn it in mount mordor
        pros:
          - ow: its the only way to destroy it
        cons:
          - rd: the road is extremely dangerous

```

This looks very brief to write...
WHich is what I want...
now  I need to learn how move from here
back to a json that can be used for graphs.



### Subsection on stuff


Thing Name              | Description        |Notes
------------------------|--------------------|-----
Yes                     | Yup!               |
No                      | Nope :(            |
FileNotFound            | Doesn't find files | Pass `-sFIND_FILE=maybe` to maybe find them


## Markdeep syntax test

Regular styling like **bold**, _italics_, ~~strikethrough~~, `inline code`, the stuff.


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


<style class="fallback">body{visibility:hidden}</style><script>markdeepOptions={tocStyle:'medium'};</script>
<!-- Markdeep: --><script src="https://casual-effects.com/markdeep/latest/markdeep.min.js?" charset="utf-8"></script>
