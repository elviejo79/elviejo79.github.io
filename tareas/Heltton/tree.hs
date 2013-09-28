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

data Tree2 
	= Tree2Leaf | Tree2Node Integer [Tree2]

inorder :: BinTree a -> [a]
inorder BinLeaf = []
inorder (BinNode x t1 t2) = inorder t1 ++ [x] ++ inorder t2

preorder :: BinTree a -> [a]
preorder BinLeaf = []
preorder (BinNode x t1 t2) = [x] ++ preorder t1 ++ preorder t2

postorder :: BinTree a -> [a]
postorder BinLeaf = []
postorder (BinNode x t1 t2) = postorder t1 ++ postorder t2 ++ [x]


--inorder (BinNode 4 (BinNode 2 (BinNode 1 BinLeaf BinLeaf) (BinNode 3 BinLeaf BinLeaf)) (BinNode 7 (BinNode 5 BinLeaf (BinNode 6 BinLeaf BinLeaf)) (BinNode 8 BinLeaf BinLeaf)))


inorderf :: (a->b) -> BinTree a -> [b]
inorderf f BinLeaf = []
inorderf f (BinNode x t1 t2) = inorderf f t1 ++ [f x] ++ inorderf f t2

--inorderf2 :: (a->b) -> BinTree a -> [b]
--inorderf2 f BinLeaf = []
--inorderf2 f (BinNode x t1 t2) = map f (inorder (BinNode x t1 t2))

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

balancedMod :: BinTree a -> Bool 
balancedMod BinLeaf = True 
balancedMod (BinNode x t1 t2) = balanced t1 && balanced t2

balancedMod2 :: BinTree a -> Bool 
balancedMod2 BinLeaf = True 
balancedMod2 (BinNode x t1 t2) = (height t1 == height t2)

zipWithTree :: (a->b->c) -> BinTree a -> BinTree b -> [c]
zipWithTree f BinLeaf t2 = []
zipWithTree f t1 BinLeaf = []
zipWithTree f (BinNode a t1 t2) (BinNode b t3 t4) = zipWithTree f t1 t3 ++ [f a b] ++ zipWithTree f t2 t4

mapTree :: (a->b) -> BinTree a -> BinTree b
mapTree f BinLeaf = BinLeaf
mapTree f (BinNode x t1 t2) = BinNode(f x) (mapTree f t1)  (mapTree f t2)

treeConcat = (BinNode [1,2]
				(BinNode [3,5] BinLeaf BinLeaf)
				(BinNode [6,7] BinLeaf BinLeaf))


concatTree :: BinTree [a] -> [a]
concatTree BinLeaf = []
concatTree (BinNode x t1 t2) =  concatTree t1 ++ x ++ concatTree t2






appendTree2 :: BinTree a -> [a] -> [a] 
appendTree2 BinLeaf ks = ks 
appendTree2 (BinNode x t1 t2) ks = appendTree2 t1 (x : appendTree2 t2 ks)
