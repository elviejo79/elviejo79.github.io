---
layout: post
title: Solutions to Chapter 6
category: haskell
---

  This are the solutions to chapter 6 of [Discrete Mathematics Using a Computer](http://www.dcs.gla.ac.uk/~jtod/discrete-mathematics/). You will also need the code at:





Excercise 1
===========
Define a Haskell datatype Tree1 for a tree that contains a character and an integer in each node, along with exactly three subtrees.

{% highlight haskell %}

> import Test.HUnit
> data Tree1 = Tree1Leaf
>            |Tree1Node Char Integer Tree1 Tree1 Tree1


{% endhighlight %}
