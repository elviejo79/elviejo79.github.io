data BinTreeInt
	= Leaf
	| Node Integer BinTreeInt BinTreeInt

tree1 :: BinTreeInt
tree1 = Leaf

tree2 :: BinTreeInt
tree2 = Node 23 Leaf Leaf
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
				(BinNode 3 BinLeaf BinLeaf))
			(BinNode 6
				(BinNode 5 BinLeaf BinLeaf)
				(BinNode 7 BinLeaf BinLeaf))

--Exercice 1
data Tree1 = Tree1Leaf
			|Tree1Node Char Int Tree1 Tree1 Tree1

--Exercice 2
data Tree2 = Tree2Leaf
			|Tree2Node Int [Tree2]

--Exercise 3
--[1,2,3,4,5,6,7,8]

--Exercise 4

inorderf :: (a->b) -> BinTree a -> [b]
inorderf f BinLeaf = []
inorderf f (BinNode x t1 t2) = inorderf f t1 ++ [f x] ++ inorderf f t2

inorderfu :: (a->b) -> BinTree a -> [b]
inorderfu f BinLeaf = []
inorderfu f (BinNode x t1 t2) = map f (inorder (BinNode x t1 t2))
--
inorder :: BinTree a ->[a]
inorder  BinLeaf =[]
inorder (BinNode x t1 t2) = inorder t1 ++ [x] ++inorder t2

preorder :: BinTree a -> [a]
preorder BinLeaf = []
preorder (BinNode x t1 t2) = [x] ++ preorder t1 ++ preorder t2

postorder :: BinTree a -> [a]
postorder BinLeaf = []
postorder (BinNode x t1 t2) = postorder t1 ++ postorder t2 ++ [x]

reflect :: BinTree a -> BinTree a
reflect BinLeaf = BinLeaf
reflect (BinNode n l r)=BinNode n (reflect r) (reflect l)

height :: BinTree a -> Integer
height BinLeaf = 0
height (BinNode x t1 t2)=1+max(height t1) (height t2)

size :: BinTree a -> Int 
size BinLeaf = 0 
size (BinNode x t1 t2) = 1 + size t1 + size t2

--Exercise 5
treeLong :: BinTree Int
treeLong = BinNode 4
			BinLeaf
				(BinNode 2 
					BinLeaf
					(BinNode 7 
						BinLeaf
						(BinNode 1 
							BinLeaf
							(BinNode 3 
								BinLeaf
								(BinNode 5 
									BinLeaf
										(BinNode 6 BinLeaf BinLeaf))))))

treeSmall :: BinTree Int
treeSmall = BinNode 1
				(BinNode 2
					(BinNode 3 BinLeaf BinLeaf)
					(BinNode 4 BinLeaf BinLeaf))
				(BinNode 5 
					(BinNode 6 BinLeaf BinLeaf)
					(BinNode 7 BinLeaf BinLeaf))

--Exercise 6 
balanced_ :: BinTree a->Bool
balanced_ BinLeaf = True
balanced_ (BinNode x r1 r2) = balanced_ r1 && balanced_ r2
--Exercise 7
balanced_2 :: BinTree a->Bool
balanced_2 BinLeaf = True
balanced_2 (BinNode x r1 r2) = (height r1 == height r2)

--Exercise 8

mapTree :: (a->b) -> BinTree a -> BinTree b
mapTree f BinLeaf = BinLeaf
mapTree f (BinNode a t1 t2) = BinNode (f a) (mapTree f t1) (mapTree f t2)

--Exercice 9
tree9 = (BinNode [2]
			(BinNode [3,4] BinLeaf BinLeaf)
			(BinNode [5] BinLeaf BinLeaf))

concatTree ::BinTree [a] ->[a]
concatTree BinLeaf =[]
concatTree (BinNode x t1 t2) = concatTree t1 ++ x ++ concatTree t2

--Exercise 10

tree10 = (BinNode 2 
			(BinNode 1 BinLeaf BinLeaf) 
			(BinNode 3 BinLeaf BinLeaf))
tree10_=(BinNode 5 
		 	(BinNode 4 BinLeaf BinLeaf)
		 	(BinNode 6 BinLeaf BinLeaf))

zipTree :: BinTree a -> BinTree b -> Maybe [(a,b)]
zipTree BinLeaf t2 = Nothing
zipTree t1 BinLeaf = Nothing
zipTree (BinNode a t1 t2) (BinNode b t3 t4) = 
		case (zipTree t1 t3) of 
			Nothing -> Nothing 
			Just lst1 ->
				case (zipTree t2 t4) of 
					Nothing -> Nothing 
					Just lst2 -> Just (lst1 ++ [(a,b)] ++ lst2)

--Exercice 11

zipWithTree ::(a->b->c)->BinTree a->BinTree b->[c]
zipWithTree f BinLeaf t2 = []
zipWithTree f t1 BinLeaf = []
zipWithTree f (BinNode a t1 t2) (BinNode b t3 t4) = zipWithTree f t1 t3 ++ [f a b] ++ zipWithTree f t2 t4
 
 --Exercise 12
tree12 = (BinNode 2 
			(BinNode 1 BinLeaf BinLeaf)
			(BinNode 3 BinLeaf BinLeaf))

appendTree :: BinTree a -> [a] -> [a]
appendTree BinLeaf ks = ks
appendTree (BinNode x t1 t2) ks = appendTree t1 (x : appendTree t2 ks)

tree7:: BinTree Integer
tree7 = BinNode 1
		BinLeaf 
		(BinNode 2
			BinLeaf
			(BinNode 3 BinLeaf BinLeaf))

tree8 :: BinTree Integer
tree8 = BinNode 1
		(BinNode 2 BinLeaf BinLeaf)
		(BinNode 3 BinLeaf BinLeaf)

balanced :: BinTree a->Bool
balanced BinLeaf = True
balanced (BinNode x r1 r2) = balanced r1 && balanced r2 && (height r1 == height r2)


linSearch :: Eq a => a -> [(a,b)] -> Maybe b
linSearch k [] = Nothing
linSearch k ((x,y):xs) =
						if k==x then Just y else linSearch k xs

