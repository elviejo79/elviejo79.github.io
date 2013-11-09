Exercise 1.
===========
Define a Haskell datatype Tree1 for a tree that contains a character and an integer in each node, along with exactly three subtrees.

>data Tree1
>   = Leaf1
>   | Node1 (Integer, Char) Tree1 Tree1
>   deriving Show

*****************************************************

Exercise 2.
===========
Define a Haskell datatype Tree2 for a tree that contains an integer in each node, and that allows each node to have any number of subtrees.

>data Tree2
> = Leaf2
> | Node2 Integer [Tree2]
> deriving Show

*****************************************************

Exercise 3.
===========

Calculate the inorder traversal of tree3.

*****************************************************

Exercise 4.
===========

Suppose that a tree has type BinTree a, and we have a function f
:: a -> b. Write a new traversal function inorderf :: (a->b) ->
BinTree a -> [b] that traverses the tree using inorder, but it applies f
to the data value in each node before placing the result in the list. For
example, inorder tree6 produces [1, 2, 3, 4, 5, 6, 7], but inorderf (2*)
tree6 produces [2, 4, 6, 8, 10, 12, 14].

>data BinTree a
> = BinLeaf
> | BinNode a (BinTree a) (BinTree a)
> deriving Show

>inorderf :: (a->b) -> BinTree a -> [b]
>inorderf f BinLeaf = []
>inorderf f (BinNode x t1 t2) = inorderf f t1 ++ [f x] ++ inorderf f t2

*****************************************************

Exercise 5.
===========

Define two trees of size seven, one with the largest possible height
and the other with the smallest possible height.


primero::Tree Int
primero = Nodo 1 
    (Nodo 2 
     (Nodo 3
        (Nodo 4
            (Nodo 5
                (Nodo 6
                     (Nodo 7
                     Leaf
                        Leaf)
                        Leaf)
                Leaf)
            Leaf)
        Leaf) 
    Leaf) 
    Leaf

segundo::Tree Int
segundo = Nodo 1
    (Nodo 2
        (Nodo 3
            Leaf
            Leaf)
        (Nodo 4
            Leaf
            Leaf))
    (Nodo 5
        (Nodo 6
            Leaf
            Leaf)
        (Nodo 7
            Leaf
            Leaf))

*****************************************************

Exercise 6.
===========

ej_6::BinTree Int
ej_6 = BinNode 1
    BinLeaf
    (BinNode 2
        BinLeaf
        BinLeaf)



balanced :: BinTree a -> Bool
balanced BinLeaf = True
balanced (BinNode x t1 t2) = height t1 == height t2

height :: BinTree a -> Integer
height BinLeaf = 0
height (BinNode x t1 t2) = 1 + max (height t1) (height t2)

*****************************************************

Exercise 7.
===========

ej_7::BinTree Int
ej_7 = BinNode 1
    (BinNode 2
        (BinNode 3
            (BinNode 4
                BinLeaf
                BinLeaf)
            BinLeaf)
        BinLeaf)
    (BinNode 5
        (BinNode 6
            BinLeaf
            BinLeaf)
        (BinNode 7
            (BinNode 8
                BinLeaf
                BinLeaf)
            BinLeaf))

*****************************************************

Exercise 8.
===========

mapTree :: (a->b) -> BinTree a -> BinTree b
mapTree f BinLeaf = BinLeaf
mapTree f (BinNode a t1 t2) = BinNode (f a) (mapTree f t1) (mapTree f t2)

*****************************************************

Exercise 9.
===========

concatTree::BinTree [a]->[a]
concatTree BinLeaf = []
concatTree (BinNode x t1 t2) = concatTree t1 ++ x ++concatTree t2

*****************************************************

Exercise 10.
===========

zipTree :: BinTree a -> BinTree b -> Maybe [(a,b)]
zipTree BinLeaf t2 = Nothing
zipTree t1 BinLeaf = Nothing 
zipTree (BinNode a t1 t2) (BinNode b t3 t4) 
	= case (zipTree t1 t3) of
	  Nothing -> Nothing
	  Just lst1 -> 
	       case (zipTree t2 t4) of
	       	    Nothing -> Nothing
		    Just lst2 -> Just (lst1 ++ [(a,b)] ++ lst2)

*****************************************************

Exercise 11.
===========

zipWithThree::(a->b->c)->BinTree a->BinTree b->[c]
zipWithThree f t1 BinLeaf = []
zipWithThree f BinLeaf t2 = []
zipWithThree f (BinNode a t1 t2) (BinNode b t3 t4) 
	     = zipWithThree f t1 t3 ++ [f a b] ++ zipWithThree f t2 t4

*****************************************************

Exercise 12.
===========

appendTree :: BinTree a -> [a] -> [a]
appendTree BinLeaf xs = xs
appendTree (BinNode x t1 t2) xs = appendTree t1 (x : appendTree t2 xs)