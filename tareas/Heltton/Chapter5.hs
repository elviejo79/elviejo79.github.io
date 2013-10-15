--Tree Haskell

-- Exercise 1. Define a Haskell datatype Tree1 for a tree that contains a character
-- and an integer in each node, along with exactly three subtrees.
data TreeCharInt a
	= Leaf | Node a (TreeCharInt a) (TreeCharInt a) deriving Show

-- Exercise 2. Define a Haskell datatype Tree2 for a tree that contains an integer
-- in each node, and that allows each node to have any number of subtrees.

data Tree2 
	= Tree2Leaf | Tree2Node Integer [Tree2]



--Exercise 3. Calculate the inorder traversal of tree3.
--Main> inorder tree3
--[1,2,3,4,5,6,7,8]


--Exercise 4. Suppose that a tree has type BinTree a, and we have a function f ::	a -> b. Write a new traversal function inorderf ::	(a->b) -> BinTree a -> [b] that traverses the tree using inorder, but it applies f to the data value in each node before placing the result in the list. For example, inorder tree6 produces [1, 2, 3, 4, 5, 6, 7], but inorderf (2*) tree6 produces [2, 4, 6, 8, 10, 12, 14].

inorderf :: (a->b) -> BinTree a -> [b]
inorderf f BinLeaf = []
inorderf f (BinNode x t1 t2) = inorderf f t1 ++ [f x] ++ inorderf f t2



--Exercise 5. Define two trees of size seven, one with the largest possible height
--and the other with the smallest possible height.

treeHeight :: BinTree Int
treeHeight = BinNode 1
			BinLeaf
			(BinNode 2
				BinLeaf
				(BinNode 3
					BinLeaf
					(BinNode 4
						BinLeaf
						(BinNode 5
							BinLeaf
							(BinNode 6
								BinLeaf
								(BinNode 7 BinLeaf BinLeaf))))))

treeNoHeight :: BinTree Int
treeNoHeight = BinNode 1 
			(BinNode 2 (BinNode 4 BinLeaf BinLeaf) (BinNode 5 BinLeaf BinLeaf) )
			(BinNode 3 (BinNode 6 BinLeaf BinLeaf) (BinNode 7 BinLeaf BinLeaf) )



--Exercise 6. Suppose that the last equation of the function balanced were changed to the following: balanced (BinNode x t1 t2) = balanced t1 && balanced t2. Give an example showing that the modified func- tion returns True for an unbalanced tree.

balancedMod :: BinTree a -> Bool 
balancedMod BinLeaf = True 
balancedMod (BinNode x t1 t2) = balanced t1 && balanced t2

--Exercise 7. Suppose that the last equation of the function balanced were changed to the following: balanced (BinNode x t1 t2) = height t1 == height t2. Give an example showing that the modified function returns True for an unbalanced tree.

balancedMod2 :: BinTree a -> Bool 
balancedMod2 BinLeaf = True 
balancedMod2 (BinNode x t1 t2) = (height t1 == height t2)

--Exercise 8. Define a function mapTree that takes a function and applies it to every node in the tree, returning a new tree of results. The type should be mapTree :: (a->b) -> BinTree a -> BinTree b. This function is analogous to map, which operates over lists.

mapTree :: (a->b) -> BinTree a -> BinTree b 
mapTree f BinLeaf = BinLeaf 
mapTree f (BinNode a t1 t2) = BinNode (f a) (mapTree f t1) (mapTree f t2)

--Exercise 9. Write concatTree, a function that takes a tree of lists and con- catenates the lists in order from left to right. For example,
--concatTree (Node [2] (Node [3,4] Tip Tip) (Node [5] Tip Tip))
-- ==> [3,4,2,5]

concatTree :: BinTree [a] -> [a]
concatTree BinLeaf = []
concatTree (BinNode x t1 t2) = concatTree t1 ++ x ++ concatTree t2


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

zipWithTree :: (a->b->c) -> BinTree a -> BinTree b -> [c]
zipWithTree f BinLeaf t2 = []
zipWithTree f t1 BinLeaf = []
zipWithTree f (BinNode a t1 t2) (BinNode b t3 t4) = zipWithTree f t1 t3 ++ [f a b] ++ zipWithTree f t2 t4

-- Exercise 12. Write appendTree, a function that takes a binary tree and a
-- list, and appends the contents of the tree (traversed from left to right) to
-- the front of the list. For example,
-- appendTree (BinNode 2 (BinNode 1 BinLeaf BinLeaf)
-- (BinNode 3 BinLeaf BinLeaf))
-- [4,5]
-- evaluates to [1,2,3,4,5]. Try to find an efficient solution that minimises
-- recopying.

appendTree2 :: BinTree a -> [a] -> [a] 
appendTree2 BinLeaf ks = ks 
appendTree2 (BinNode x t1 t2) ks = appendTree2 t1 (x : appendTree2 t2 ks)


--Ejemplos.....

tree3 :: BinTree Int
tree3 =
	BinNode 4
	(BinNode 2
		(BinNode 1 BinLeaf BinLeaf)
		(BinNode 3 BinLeaf BinLeaf))
	(BinNode 7
		(BinNode 5
			BinLeaf
			(BinNode 6 BinLeaf BinLeaf))
		(BinNode 8 BinLeaf BinLeaf))



			


data BinTree a
	= BinLeaf
	| BinNode a (BinTree a) (BinTree a)
	deriving Show

tree4 :: BinTree String
tree4 = BinNode "cat" BinLeaf (BinNode "dog" BinLeaf BinLeaf)

tree5 :: BinTree (Integer,Bool)
tree5 = BinNode (23,False)
			BinLeaf
			(BinNode (49,True) BinLeaf BinLeaf)

tree6 :: BinTree Int
tree6 = BinNode 4
		(BinNode 2
			(BinNode 1 BinLeaf BinLeaf)
			(BinNode 3 BinLeaf BinLeaf)
			)
		(BinNode 6
			(BinNode 5 BinLeaf BinLeaf)
			(BinNode 7 BinLeaf BinLeaf)
			)




data Tree1 
	= Tree1Leaf | Tree1Node Char Integer Tree1 Tree1 Tree1



inorder :: BinTree a -> [a]
inorder BinLeaf = []
inorder (BinNode x t1 t2) = inorder t1 ++ [x] ++ inorder t2

preorder :: BinTree a -> [a]
preorder BinLeaf = []
preorder (BinNode x t1 t2) = [x] ++ preorder t1 ++ preorder t2

postorder :: BinTree a -> [a]
postorder BinLeaf = []
postorder (BinNode x t1 t2) = postorder t1 ++ postorder t2 ++ [x]









reflect :: BinTree a -> BinTree a 
reflect BinLeaf = BinLeaf 
reflect (BinNode n l r) = BinNode n (reflect r) (reflect l)


height :: BinTree a -> Integer 
height BinLeaf = 0 
height (BinNode x t1 t2) = 1 + max (height t1) (height t2)

size :: BinTree a -> Int 
size BinLeaf = 0 
size (BinNode x t1 t2) = 1 + size t1 + size t2

balanced :: BinTree a -> Bool 
balanced BinLeaf = True 
balanced (BinNode x t1 t2) = balanced t1 && balanced t2 && (height t1 == height t2)


treeConcat = (BinNode [1,2]
				(BinNode [3,5] BinLeaf BinLeaf)
				(BinNode [6,7] BinLeaf BinLeaf))








