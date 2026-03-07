```
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
