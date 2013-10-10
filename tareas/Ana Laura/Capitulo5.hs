-- Exercise 1. Define a Haskell datatype Tree1 for a tree that contains a character
-- and an integer in each node, along with exactly three subtrees.

data Tree1 a = Leaf | Node a (Tree1 a) (Tree1 a) deriving Show

ex1 :: Tree1 (Integer,Char)
ex1 = Node (23,'a') Leaf (Node (49,'b') Leaf Leaf)

-- Exercise 2. Define a Haskell datatype Tree2 for a tree that contains an integer
-- in each node, and that allows each node to have any number of subtrees.

data Tree2 = Leaf2 | Node2 Integer Tree2 Tree2 deriving Show

ex2 :: Tree2
ex2 = Node2 1 (Node2 2 Leaf2 Leaf2)(Node2 3 Leaf2 Leaf2)

-- Exercise 3. Calculate the inorder traversal of tree3.

-- tree3 :: BinTreeInt
-- tree3 = Node 4 (Node 2 (Node 1 Leaf Leaf) (Node 3 Leaf Leaf)) (Node 7 (Node 5 Leaf (Node 6 Leaf Leaf)) (Node 8 Leaf Leaf))

-- inorder Node 4 (Node 2 (Node 1 Leaf Leaf) (Node 3 Leaf Leaf)) (Node 7 (Node 5 Leaf (Node 6 Leaf Leaf)) (Node 8 Leaf Leaf))
-- = inorder (node 2 (node 1 Leaf Leaf) (node 3 Leaf Leaf)) ++ [4] ++ (Node 7 (Node 5 Leaf (Node 6 Leaf Leaf) (Node 8 Leaf Leaf)))
-- = (inorder (Node 1 Leaf Leaf) ++ [2] ++ (Node 3 Leaf Leaf)) ++ [4] ++ (inorder (Node 5 Leaf (Node 6 Leaf Leaf) ++ [7] ++ (inorder (Node 8 Leaf Leaf)))
-- = inorder Leaf ++ [1] ++ inorder Leaf ++ [2] ++ inorder Leaf ++ [3] ++ inorder Leaf ++ [4] ++ inorder Leaf ++ [5] ++ inorder Leaf ++ [6] ++ inorder Leaf ++ [7] ++ inorder Leaf ++ [8] ++ inorder Leaf
-- = [] ++ [1] ++ [] ++ [2] ++ [] ++ [3] ++ [] ++ [4] ++ [] ++ [5] ++ [] ++ [6] ++ [] ++ [8]
-- = [1,2,3,4,5,6,7,8]


-- Exercise 4. Suppose that a tree has type BinTree a, and we have a function f
-- :: a -> b. Write a new traversal function inorderf :: (a->b) ->
-- BinTree a -> [b] that traverses the tree using inorder, but it applies f
-- to the data value in each node before placing the result in the list. For
-- example, inorder tree6 produces [1, 2, 3, 4, 5, 6, 7], but inorderf (2*)
-- tree6 produces [2, 4, 6, 8, 10, 12, 14].

inorder :: Tree1 a -> [a]
inorder Leaf = []
inorder (Node x t1 t2) = inorder t1 ++ [x] ++ inorder t2

-- Solucion problema 4
inorderf :: (a->b) -> Tree1 a -> [b]
inorderf f Leaf = []
inorderf f (Node x t1 t2) = inorderf f t1 ++ [f x] ++ inorderf f t2

-- Solucion 2
inorderf' :: (a->b) -> Tree1 a -> [b]
inorderf' f Leaf = []
inorderf' f (Node x t1 t2) = map f (inorder (Node x t1 t2))


-- Ejemplo de funcion de balancear
 
height :: Tree1 a -> Integer
height Leaf = 0
height (Node x t1 t2) = 1 + max (height t1) (height t2)

size :: Tree1 a -> Int
size Leaf = 0
size (Node x t1 t2) = 1 + size t1 + size t2

balanced :: Tree1 a -> Bool
balanced Leaf = True
balanced (Node x t1 t2) = (balanced t1 && balanced t2 && (height t1 == height t2))

-- Exercise 5. Define two trees of size seven, one with the largest possible height
-- and the other with the smallest possible height.

-- Arbol 1

ex5 :: Tree2
ex5 = Node2 1 (Node2 2 (Node2 3 Leaf2 Leaf2) (Node2 4 Leaf2 Leaf2))(Node2 5 (Node2 6 Leaf2 Leaf2) (Node2 7 Leaf2 Leaf2))

-- Arbol 2

ex5' :: Tree2
ex5' = Node2 1 Leaf2 (Node2 2 Leaf2 (Node2 3 Leaf2 (Node2 4 Leaf2 (Node2 5 Leaf2 (Node2 6 Leaf2 (Node2 7 Leaf2 Leaf2))))))

-- Exercise 6. Suppose that the last equation of the function balanced were
-- changed to the following: balanced (BinNode x t1 t2) = balanced
-- t1 && balanced t2. Give an example showing that the modified function
-- returns True for an unbalanced tree.

balanced' :: Tree1 a -> Bool
balanced' Leaf = True
balanced' (Node x t1 t2) = balanced' t1 && balanced' t2

-- por ejemplo dada
-- balanced' (Node 1 Leaf (Node 2 Leaf (Node 3 Leaf Leaf)))
-- = balanced' Leaf && balanced' (Node 2 Leaf (Node 3 Leaf Leaf))
-- = True && balanced' Leaf && balanced' (Node 3 Leaf Leaf)
-- = True && True && balanced' Leaf && balanced' Leaf
-- = True && True && True && True
-- = True

-- Exercise 7. Suppose that the last equation of the function balanced were
-- changed to the following: balanced (BinNode x t1 t2) = height t1
-- == height t2. Give an example showing that the modified function
-- returns True for an unbalanced tree.

balanced2 :: Tree1 a -> Bool
balanced2 Leaf = True
balanced2 (Node x t1 t2) = height t1 == height t2

-- Dado el siguiente ejemplo

-- balanced2 (Node 2 Leaf (Node 2 Leaf (Node 3 Leaf Leaf)))
-- = height Leaf == height (Node 2 Leaf (Node 3 Leaf Leaf))
-- = 0 == 1 + max (height Leaf) (height (Node 3 Leaf Leaf))
-- = 0 == 1 + max 0 (1 + max (height Leaf) (height Leaf))
-- = 0 == 1 + max 0 (1 + max 0 0)
-- = 0 == 1 + max 0 1
-- = 0 == 1 + 1
-- = False


-- Exercise 8. Define a function mapTree that takes a function and applies it to
-- every node in the tree, returning a new tree of results. The type should
-- be mapTree :: (a->b) -> BinTree a -> BinTree b. This function
-- is analogous to map, which operates over lists.

mapTree :: (a -> b) -> Tree1 a -> Tree1 b
mapTree f Leaf = Leaf
mapTree f (Node x t1 t2) = Node (f x) (mapTree f t1) (mapTree f t2)

-- Exercise 9. Write concatTree, a function that takes a tree of lists and concatenates
-- the lists in order from left to right. For example,
-- concatTree (Node [2] (Node [3,4] Tip Tip)
-- (Node [5] Tip Tip))
-- ==> [3,4,2,5]

concatTree :: Tree1 [a] -> [a]
concatTree Leaf = []
concatTree (Node x t1 t2) = concatTree t1 ++ x ++ concatTree t2


-- Exercise 10. Write zipTree, a function that takes two trees and pairs each of
-- the corresponding elements in a list. Your function should return Nothing
-- if the two trees do not have the same shape. For example,
-- zipTree (Node 2 (Node 1 Tip Tip) (Node 3 Tip Tip))
-- (Node 5 (Node 4 Tip Tip) (Node 6 Tip Tip))
-- ==> Just [(1,4),(2,5),(3,6)]

-- zipTree :: Tree1 a -> Tree1 b -> Maybe [(a,b)]
-- zipTree Leaf (Node x t1 t2) = []
-- zipTree (Node x t1 t2) Leaf = []
-- zipTree (Node x1 t1 t2) (Node x2 t3 t4) = zipTree t1 t3 ++ Just [(x1,x2)] ++ zipTree t2 t4


-- Exercise 11. Write zipWithTree, a function that is like zipWith except that
-- it takes trees instead of lists. The first argument is a function of type
-- a->b->c, the second argument is a tree with elements of type a,and the
-- third argument is a tree with elements of type b. The function returns a
-- list with type [c].


zipWithTree :: (a -> b -> c) -> Tree1 a -> Tree1 b -> [c]
zipWithTree f Leaf (Node x t1 t2) = []
zipWithTree f (Node x t1 t2) Leaf = []
zipWithTree f (Node x t1 t2) (Node x2 t3 t4) = zipWithTree f t1 t3 ++ [f x x2] ++ zipWithTree f t2 t4


-- Exercise 12. Write appendTree, a function that takes a binary tree and a
-- list, and appends the contents of the tree (traversed from left to right) to
-- the front of the list. For example,
-- appendTree (BinNode 2 (BinNode 1 BinLeaf BinLeaf)
-- (BinNode 3 BinLeaf BinLeaf))
-- [4,5]
-- evaluates to [1,2,3,4,5]. Try to find an efficient solution that minimises
-- recopying.

appendTree :: Tree1 a -> [a] -> [a]
appendTree Leaf [] = []
appendTree (Node x t1 t2) ys = inorder t1 ++ [x] ++ inorder t2 ++ ys


appendTree' :: Tree1 a -> [a] -> [a]
appendTree' Leaf ks = ks
appendTree' (Node x t1 t2) ks = appendTree' t1 (x : appendTree' t2 ks)
