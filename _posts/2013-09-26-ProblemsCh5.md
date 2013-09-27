---
layout: post
title: Solutions to Chapter 3
category: haskell
---

Exercise 00.
===========
Write a recursive function copy :: [a] -> [a] that copies its list argument.
For example, copy [2] ⇒[2].

{% highlight haskell %}

> import Test.HUnit
> t1 =  ["f21 [2,3] lista con algo" ~: [2,3] ~=? (f21 [2,3])
>        ,"f21 [1] lista con un elementa" ~: [1] ~=? (f21 [1])]
> f21 :: [a]->[a]
> f21 [] = []
> f21 (x:xs) = x:f21(xs)

{% endhighlight %}

Excercise 1
===========
Define a Haskell datatype Tree1 for a tree that contains a character and an integer in each node, along with exactly three subtrees.

{% highlight haskell %}

> data Tree1 = Tree1Leaf
>                 |Tree1Node Char Integer Tree1 Tree1 Tree1


{% endhighlight %}


Exercise 2.
===========
Define a Haskell datatype Tree2 for a tree that contains an integer in each node, and that allows each node to have any number of subtrees.

{% highlight haskell %}

> data Tree2 = Tree2Leaf
>            |Tree2Node Integer [Tree2]

{% endhighlight %}

Exercise 3.
==========
Calculate the inorder traversal of tree3.

{% highlight haskell %}

> -- Escribe tu solución aquí

{% endhighlight %}


Exercise 4.
===========
Suppose that a tree has type BinTree a, and we have a function
f :: a -> b. Write a new traversal function
inorderf :: (a->b) -> BinTree a -> [b] that traverses the tree using inorder,
but it applies f to the data value in each node before placing the result in the list.
For example, inorder tree6 produces [1, 2, 3, 4, 5, 6, 7],
but inorderf (2*) tree6 produces [2, 4, 6, 8, 10, 12, 14].

{% highlight haskell %}


> data BinTree a
>     = BinLeaf
>     | BinNode a (BinTree a) (BinTree a)
>     deriving Show
>
> tree6 :: BinTree Int
> tree6 = BinNode 4
>             (BinNode 2
>                 (BinNode 1 BinLeaf BinLeaf)
>                 (BinNode 3 BinLeaf BinLeaf))
>             (BinNode 6
>                 (BinNode 5 BinLeaf BinLeaf)
>                 (BinNode 7 BinLeaf BinLeaf))
>
> inorder :: BinTree a -> [a]
> inorder BinLeaf = []
> inorder (BinNode x t1 t2) = inorder t1 ++ [x] ++ inorder t2
>
> -- tests
> t4 = ["For example, inorder tree6 produces [1, 2, 3, 4, 5, 6, 7]," ~: [1, 2, 3, 4, 5, 6, 7] ~=? (inorder tree6)
>      ,"but inorderf (2*) tree6 produces [2, 4, 6, 8, 10, 12, 14]." ~: [2, 4, 6, 8, 10, 12, 14] ~=? (inorderf (2*) tree6 )]
>
> inorderf :: (a->b) -> BinTree a -> [a]
> inorderf f BinLeaf = []

{% endhighlight %}

Exercise 5.
===========
Define two trees of size seven, one with the largest possible height and the other with the smallest possible height.

{% highlight haskell %}

> -- Escribe tu solución aquí

{% endhighlight %}

Exercise 6.
===========
Suppose that the last equation of the function balanced were
changed to the following:

  balanced (BinNode x t1 t2) = balanced t1 && balanced t2

Give an example showing that the modified function returns True for an unbalanced tree.

{% highlight haskell %}

> -- Escribe tu solución aquí

{% endhighlight %}



Exercise 7.
===========
Suppose that the last equation of the function balanced were
changed to the following:

  balanced (BinNode x t1 t2) = height t1 == height t2.

Give an example showing that the modified function returns True for an unbalanced tree.

{% highlight haskell %}

> -- Escribe tu solución aquí

{% endhighlight %}


Exercise 8.
==========
Define a function mapTree that takes a function and applies it to
every node in the tree, returning a new tree of results. The type should
be

  mapTree :: (a->b) -> BinTree a -> BinTree b

This function is analogous to map, which operates over lists.

Exercise 9.
===========
Write concatTree, a function that takes a tree of lists and concatenates
the lists in order from left to right. For example,

  concatTree (Node [2] (Node [3,4] Tip Tip) (Node [5] Tip Tip)) ==> [3,4,2,5]

Exercise 10.
============
Write zipTree, a function that takes two trees and pairs each
the corresponding elements in a list. Your function should return Nothing
if the two trees do not have the same shape. For example,

  zipTree (Node 2 (Node 1 Tip Tip) (Node 3 Tip Tip)) (Node 5 (Node 4 Tip Tip) (Node 6 Tip Tip))
  ==> Just [(1,4),(2,5),(3,6)]

Exercise 11.
============
Write zipWithTree, a function that is like zipWith except that
it takes trees instead of lists. The first argument is a function of type
a->b->c, the second argument is a tree with elements of type a,and the
third argument is a tree with elements of type b. The function returns a
list with type [c]

Exercise 12.
============
Write appendTree, a function that takes a binary tree and a
list, and appends the contents of the tree (traversed from left to right) to
the front of the list. For example,

  appendTree (BinNode 2 (BinNode 1 BinLeaf BinLeaf)
                (BinNode 3 BinLeaf BinLeaf))
               [4,5]

evaluates to [1,2,3,4,5]. Try to find an efficient solution that minimises recopying.
