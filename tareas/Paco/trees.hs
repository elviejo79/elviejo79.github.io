data BinTreeInt
     = Leaf
     | Node Integer BinTreeInt BinTreeInt

data BinTree a
     = BinLeaf
     | BinNode a (BinTree a) (BinTree a)
     deriving Show

data Tree1
     = Tree1Leaf
     | Tree1Node Char Integer Tree1 Tree1 Tree1

data Tree2
     = Tree2Leaf
     | Tree2Node Integer [Tree2]

inorder :: BinTree a -> [a]
inorder BinLeaf = []
inorder (BinNode x t1 t2) = inorder t1 ++ [x] ++ inorder t2

preorder :: BinTree a -> [a]
preorder BinLeaf = []
preorder (BinNode x t1 t2) = [x] ++ preorder t1 ++ preorder t2

postorder :: BinTree a -> [a]
postorder BinLeaf = []
postorder (BinNode x t1 t2) = postorder t1 ++ postorder t2 ++ [x]

tree6 :: BinTree Int
tree6 = BinNode 4
      (BinNode 2
      	       (BinNode 1 BinLeaf BinLeaf)
	       (BinNode 3 BinLeaf BinLeaf))
      (BinNode 6
      	       (BinNode 5 BinLeaf BinLeaf)
	       (BinNode 7 BinLeaf BinLeaf))

tree3 :: BinTreeInt
tree3 =
      Node 4
      	   (Node 2
	   	 (Node 1 Leaf Leaf)
		 (Node 3 Leaf Leaf))
	   (Node 7
	   	 (Node 5
		       Leaf
		       (Node 6 Leaf Leaf))
		 (Node 8 Leaf Leaf))

inorderInt :: BinTreeInt -> [Integer]
inorderInt Leaf = []
inorderInt (Node x t1 t2) = inorderInt t1 ++ [x] ++ inorderInt t2

inorderf :: (a->b) -> BinTree a -> [b]
inorderf f BinLeaf = []
inorderf f (BinNode x t1 t2) = inorderf f t1 ++ [f x] ++ inorderf f t2

reflect :: BinTree a -> BinTree a
reflect BinLeaf = BinLeaf
reflect (BinNode n l r) = BinNode n (reflect r) (reflect l)

ex6 :: BinTree Int
ex6 = BinNode 1
      	      BinLeaf
	      (BinNode 3
	      	       BinLeaf
		       BinLeaf)

--Ex7
balanced :: BinTree a -> Bool
balanced BinLeaf = True
balanced (BinNode x t1 t2) = height t1 == height t2

height :: BinTree a -> Integer
height BinLeaf = 0
height (BinNode x t1 t2) = 1 + max (height t1) (height t2)


ex7 :: BinTree Int
ex7 = BinNode 1
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

--Ex 8
mapTree :: (a->b) -> BinTree a -> BinTree b
mapTree f BinLeaf = BinLeaf
mapTree f (BinNode a t1 t2) = BinNode (f a) (mapTree f t1) (mapTree f t2)

--Ex9
concatTree :: BinTree [a] -> [a]
concatTree BinLeaf = []
concatTree (BinNode x t1 t2) = concatTree t1 ++ x ++ concatTree t2

--Ex10
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

--Ex11
zipWithTree :: (a -> b -> c) -> BinTree a -> BinTree b -> [c]
zipWithTree f BinLeaf t2 = []
zipWithTree f t1 BinLeaf = []
zipWithTree f (BinNode a t1 t2) (BinNode b t3 t4)
	      = zipWithTree f t1 t3 ++ [f a b] ++ zipWithTree f t2 t4

--Ex12
appendTree :: BinTree a -> [a] -> [a]
appendTree BinLeaf ys = ys
appendTree (BinNode x t1 t2) ys = appendTree t1 (x : appendTree t2 ys)





