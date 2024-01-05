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
hashmaps.n

this is something I'll need to keep in mind.

### Sentnces only by type and as array

Since I suspect that working with nested arrays
is a more natural way to work with jsonata

I also made another query:

https://try.jsonata.org/XUnlg-DC7

``` json
@@groupSentencesByType_jsonata
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

# Thursday Dec 21st
## I wish I could do pattern matching.

I wish I could simply write a query like this:

``` javascript
{$id: $label, "pros":$pros, "cons":$cons}
```

And apply it to the son document,
and it could give me a result.

So I have searched several alternatives... but none seem to work.

### [ReJSON](https://github.com/squaremo/rejson)

```javscript
> Json = json:decode("[1, 2, \"foo\", 3]"),
> Pattern = rejson:parse("[1, 2, number *] ^ [S = string]"),
> rejson:match(Pattern, Json).
{ok, [{"S", "foo"}]}
```

Observe that `S = string` is where it decides to capture the value.
with the "match" instruction.

The problem is what it says here:

>A capture cannot appear is as a property name,
>or (currently) as the operand of an interleave,
>though it can appear in an operand.

So what this means is that I cannot use it to match $id property,
which is the difficult part :(

### [Jawk](https://github.com/mohd-akram/jawk)

Awk but for json.

It seems to me like a query like jsonata but mor imperatiav with For loops and ifs
```bash
$ echo '{"age":10}' | jawk '{print _["age"]}'
10

$ echo '{"person":{"name":"Jason"}}' | jawk '{print _["person","name"]}'
Jason

$ echo '[4,2,0]' | jawk '{while (++i <= _["length"]) print _[i]}'
4
2
0

$ echo '[{"x":6},{"x":7}]' | jawk '{while (++i <= _["length"]) print _[i,"x"]}'
6
7

$ printf '{"x":6}\n{"x":7}\n' | jawk '{print _["x"]}'
6
7

$ echo '{"name":{"first":"Jason"},"age":25}' | jawk '{
	keys(o); for (k in o) print k, _[o[k],JSON]
}'
name {"first":"Jason"}
age 25

$ echo '{"name":"Jason"}' | jawk '{print _["name",JSON]}'
"Jason"

# Try it with real data!
curl -Ls https://api.github.com/repos/onetrueawk/awk |
jawk '{print "id:", _["id"], "owner.id:", _["owner","id"]}'

curl -Ls https://api.github.com/repos/onetrueawk/awk/commits |
jawk '{
	while (++i <= _["length"]) {
		sha = _[i,"sha"]
		message = _[i,"commit","message"]
		l = index(message, "\n")
		print sha, substr(message, 1, l ? l - 1 : 50)
	}
}'

curl -Ls https://api.github.com/repos/onetrueawk/awk/commits |
jawk '{while (++i <= _["length"]) printf("{\"sha\":%s}\n",_[i,"sha",JSON])}'
```


# Friday Dec 22

## Stumbled to a solution

I stumbled on a jsonata query that gives me the desired results:

https://try.jsonata.org/lbQzpr17x

Emphasis on *stumbled*.

So that I asked a query in stackoverflow to find a better way to do it.

https://stackoverflow.com/questions/77706465/flatten-nested-structure-by-two-keys

Plus I'm also worried that it only works for trees, not graphs.
but It's good enough to help me continue moving:

```bash
$ cat ./lord_of_the_rings.yaml | jfq --accept-yaml --query-file ./ibis_to_array_of_objects.jsonata
[
  {
    "kind": "Question",
    "parent": "null",
    "id": "root",
    "label": "What should we do about the one ring?"
  },
  {
    "kind": "Idea",
    "parent": "root",
    "id": "gg",
    "label": "Give it to golumm"
  },
  {
    "kind": "Idea",
    "parent": "root",
    "id": "gh",
    "label": "Give it to humans"
  },
  {
    "kind": "Idea",
    "parent": "root",
    "id": "bm",
    "label": "Burn it in mordor"
  },
  {
    "kind": "pro",
    "parent": "bm",
    "id": "ow",
    "label": "its the only way to destroy it"
  },
  {
    "kind": "pro",
    "parent": "bm",
    "id": "ofora",
    "label": "once and for all"
  },
  {
    "kind": "pro",
    "parent": "bm",
    "id": "dr",
    "label": "the road is extremely dangerous"
  },
  {
    "kind": "Question",
    "parent": "null",
    "id": "root2",
    "label": "Why do we need to destroy it?"
  }
]

```

Now I can transform it in to the json for visjs

This query was easy
https://try.jsonata.org/9m8IlB-Ge

now lets look at it from the command line:

```bash
$ cat ./lord_of_the_rings.yaml | jfq --accept-yaml --query-file ./ibis_to_array_of_objects.jsonata  | jfq --query-file ./array_of_objecs_to_visjs.jsonata
{
  "data": {
    "nodes": [
      {
        "group": "Question",
        "id": "root",
        "label": "What should we do about the one ring?"
      },
      {
        "group": "Idea",
        "id": "gg",
        "label": "Give it to golumm"
      },
      {
        "group": "Idea",
        "id": "gh",
        "label": "Give it to humans"
      },
      {
        "group": "Idea",
        "id": "bm",
        "label": "Burn it in mordor"
      },
      {
        "group": "pro",
        "id": "ow",
        "label": "its the only way to destroy it"
      },
      {
        "group": "pro",
        "id": "ofora",
        "label": "once and for all"
      },
      {
        "group": "pro",
        "id": "dr",
        "label": "the road is extremely dangerous"
      },
      {
        "group": "Question",
        "id": "root2",
        "label": "Why do we need to destroy it?"
      }
    ],
    "edges": [
      {
        "from": "null",
        "to": "root"
      },
      {
        "from": "root",
        "to": "gg"
      },
      {
        "from": "root",
        "to": "gh"
      },
      {
        "from": "root",
        "to": "bm"
      },
      {
        "from": "bm",
        "to": "ow"
      },
      {
        "from": "bm",
        "to": "ofora"
      },
      {
        "from": "bm",
        "to": "dr"
      },
      {
        "from": "null",
        "to": "root2"
      }
    ]
  }
}

```

# Saturday Dec 23rd

## Why the solution was too easy?

The final query that translates from: a doubled nested yaml to flat list of objects was extremely easy to write.

Then why did it take me so long to build it?
And more importantly... How can I shorten that time the next time that I have a similar problem?

### Wha was the key for the solution?
  When I had given up, on trying to find the solution for myself I started to write the question in stack overflow.

  And in the process of writing the rigth question I came up with the solution by myself.

#### How did you approach asking the question:

1. I wrote the well formated input.
2. Then I typed by hand the output that I wanted.

!!! Note: But here I actually wrote the *Output that I wanted. NOT the intermediate process that I tought I needed to follow.

3. Then I tried to describe the propertie of the output.
 - that the type was the Parent
 - the "parent" was the oldest sibling

4. And that the answer was deeply nested. Because I didn't want the solution to be limetd to only two levels deep. So it needed some kind of recursive function.

And with those elemenst was enough to write the solution for myself.
I think this worked well, because jsonata is a declarative language... so
thiking of what I really wanted, as opposed of what I thought where the prosses required to achive it was a good fit.

##### How could jsonata work in order to do this?

Well maybe the interface of jsonata should be such that:

it asks the input, then the desired output.
Then you write your jsonata query,
and it shows you the calculated output.
and then also another window that shows the difference between the expected output,
and the calculated output.
so that you know what is going on.

Even better with that interface there could be a genetic algorithm that is testing the json window and calculatingthe output and then given the diffs trying to come up with the algorithm.

#### How does this relate to PyRet
In pyret you name the method.
Then write the docs
then the examples (which are the expected outpus given known inputs)
then could be the prec-conditions and post-conditions
and finally the code.

which could be seen as:

|pyret | jsonata |
|name  with the  goal | comment with the goal|
|exmplaes | testcase|
|example input| input window|
|example output| output window|
| input types| input json-schema|
|pre-conditions| other predicates in the data that are not part of the schema|
| output types | output json-schema |
|post-conditions| other predicates that cannot be part of the schema|
|actual code | actual jsonata query|
| results of the tests | diff between expected output and calculated output|

And this relates to programming of functions in general.

## I finally understood how to write a paper
This stackoverfow answer about "argument diagramming"
 https://ux.stackexchange.com/a/91762/169709

Put me in the pat to discover Toulmind Diagrams for argument diagramming.

This lead me to read about Macro-toulmin to write papers.

And I thikn I have finally understood how papers should be written!

# Sunday Dec 24th 12:19

I feel that it's already too late to start working on anything... but common lets do  alittle bit.

## How to update my diagram on every file change?

### How to generate the correct json for visjs from command line:

```bash
cat ./lord_of_the_rings.yaml | \
jfq --accept-yaml --query-file ./ibis_to_array_of_objects.jsonata  |\
jfq --query-file ./array_of_objecs_to_visjs.jsonata | \
cat <(echo -n "var data=") - <(echo ";") > ibis_for_visjs.js
```

### watchexec
is a rust cli command

### entr
is a common linux command.

``` bash
$ cat ./lord_of_the_rings.yaml | jfq --accept-yaml --query-file ./ibis_to_array_of_objects.jsonata  | jfq --query-file ./array_of_objecs_to_visjs.jsonata  >
```


Now in order to generate the json everytime we change the yaml files.

# Tue Dec 26th 2023

## Refocus

### What do I really want? (for this tool)

I want to write any ibis map in vs code and then having a preview window side by side that keeps updating the diagram as I type.

Also that I can open that preview windon in its own window so that I can share the map on google meet while typing.

Also that I can create a map and from the command line generate an image.

### After that?

I want to use the VSCode code sharing platform so that I can colaboratelly developed a map.

Then maybe use rethink db to develop a collaborative platform that allows a lot of people to work on their own maps. Because with rethink we can save to a central server and the database can push the updates to all the connected clients.

Then have each map stored as a json document, so that we can have all the maps linked as json-ld documents that AI can learn from to anwser questions.

# Saturday Dec 30th

I finally got around to use the code generated by chatgpt

The code is in `../graph-to-png/` and is executed by

    ``` bash
    graph-to-png-with-puppeteer.js ./my_graph_file.json
    ```

And that will create `./my_graph_file.png`

# Sunday dec 31st

    It's almost the end of the year. And  I want to "finish" this IBIS map before the next one starts.
    So what do I need to do?

## Todos (at least to let it rest for a while)

- [ ] Add the correct styling in the website for the PNG.
- [ ] Create a website, and use the same website for the user and the PNG generation.
- [ ] Correct the error so that Cons also appear properly displayed.

<!-- Don't delete this line -->

<style class="fallback">body{visibility:hidden}</style><script>markdeepOptions={tocStyle:'medium'};</script>
<!-- Markdeep: --><script src="https://casual-effects.com/markdeep/latest/markdeep.min.js?" charset="utf-8"></script>
