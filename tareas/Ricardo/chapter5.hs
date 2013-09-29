import Test.HUnit
{-- Chapter 5 --}

-- Exercise 1
data Tree1 = Tree1Leaf
             | Tree1Node Char Integer Tree1 Tree1 Tree1


-- Exercise 2
data Tree2 = Tree2Leaf
             | Tree2Node Integer [Tree2]


-- Exercise 3
data BinTreeInt = Leaf
                  | Node Integer BintReeInt BinTreeInt

tree3 :: BinTreeInt
tree3 = Node 4
        (Node 2
            (Node 1 Leaf Leaf)
            (Node 3 Leaf Leaf)
        (Node 7
            (Node 5 Leaf
                Node 6 Leaf Leaf)
        (Node 8 Leaf Leaf)))

-- Exercise 4
data BinTree a
= BinLeaf
  | BinNode a (BinTree a) (BinTree a)
deriving Show
tree6 :: BinTree Int
tree6 = BinNode 4
        (BinNode 2
         (BinNode 1 BinLeaf BinLeaf)
         (BinNode 3 BinLeaf BinLeaf))
        (BinNode 6
         (BinNode 5 BinLeaf BinLeaf)
         (BinNode 7 BinLeaf BinLeaf))
inorder :: BinTree a -> [a]
inorder BinLeaf = []
inorder (BinNode x t1 t2) = inorder t1 ++ [x] ++ inorder t2

inorderf :: (a->b) -> BinTree a -> [a]
inorderf f BinLeaf = []


-- Exercise 5
tree5 :: BinTree Int
tree5 = BinNode 1 
	(BinNode 2 
		(BinNode 3
			(BinNode 4
				(BinNode 5
					(BinNode 6 BinLeaf BinLeaf)
					     BinLeaf
                                )
				BinLeaf
			)
			BinLeaf
		)
		BinLeaf
	)
	BinLeaf

tree5' :: BinTree Int
tree5' = BinNode 1 (BinNode 2 
			(BinNode 3 BinLeaf BinLeaf)
			(BinNode 4 BinLeaf BinLeaf)
			)
		(BinNode 5
			(BinNode 6 BinLeaf BinLeaf)
			(BinNode 7 BinLeaf BinLeaf)
		)



-- Exercise 6
height :: BinTree a -> Integer
height BinLeaf = 0
height (BinNode x t1 t2) = 1 + max (height t1) (height t2)

tree6 :: BinTree Int
tree6 = BinNode 1
		(BinNode 2
			(BinNode 3 BinLeaf BinLeaf)
			(BinNode 4 BinLeaf BinLeaf)
		)
		(BinNode 5
			BinLeaf
			(BinNode 10 
				BinLeaf 
				(BinNode 20  BinLeaf BinLeaf)
			)
		)	


balanced6 :: BinTree a -> Bool
balanced6 BinLeaf = True
balanced6 (BinNode x t1 t2) = balanced6 t1 && balanced6 t2

-- Ejercicio 7
tree7 :: BinTree Int 
tree7 = BinNode 1 
		(BinNode 2 
			(BinNode 3 
				(BinNode 31 BinLeaf BinLeaf)
				(BinNode 32 BinLeaf BinLeaf)
			)
			(BinNode 4 					
				BinLeaf
				(BinNode 42 BinLeaf BinLeaf)
			)
		)
		(BinNode 5
			BinLeaf
			(BinNode 7 
				(BinNode 71 BinLeaf BinLeaf)
				BinLeaf
			)
		)

balanced7 :: BinTree a -> Bool
balanced7 BinLeaf = True
balanced7 (BinNode x t1 t2) = height t1 == height t2


-- Exercise 8
mapTree :: (a -> b) -> BinTree a -> BinTree b
mapTree f BinLeaf = BinLeaf
mapTree f (BinNode a t1 t2) = BinNode (f a) (mapTree f t1) (mapTree f t2)

-- Exercise 9
concatTree :: BinTree a -> [a]
concatTree BinLeaf = []
concatTree (BinNode x t1 t2) = concatTree t1 ++ [x] ++ concatTree t2

-- Exercise 10
zipTree :: BinTree a -> BinTree b -> Maybe [(a,b)]
zipTree BinLeaf t2 = Nothing
zipTree t1 BinLeaf = Nothing
zipTree (BinNode a t1 t2) (BinNode b t3 t4) =
  case (zipTree t1 t3) of
	Nothing -> Nothing
			Just lst1 -> case (zipTree t2 t4) of
				Nothing -> Nothing
					Just lst2 -> Just (lst1 ++ [(a,b)] ++ lst2)

-- Exercise 11
zipWithTree :: (a -> b -> c) -> BinTree a -> BinTree b -> [c]
zipWithTree f BinLeaf t2 = []
zipWithTree f t1 BinLeaf = []
zipWithTree f (BinNode a t1 t2) (BinNode b t3 t4) = zipWithTree f t1 t3 ++ [f a b] ++ zipWithTree f t2 t4


-- Exercise 12
inorder :: BinTree a -> [a]
inorder BinLeaf = []
inorder (BinNode x t1 t2) = inorder t1 ++ [x] ++ inorder t2

appendTree1 :: BinTree a -> [a] -> [a]
appendTree1 t xs = inorder t ++ xs
