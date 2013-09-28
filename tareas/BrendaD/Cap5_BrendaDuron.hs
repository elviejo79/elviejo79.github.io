import Test.HUnit

data BinTreeInt = Leaf | Node Integer BinTreeInt BinTreeInt deriving Show
data BinTree a = BinLeaf | BinNode a (BinTree a) (BinTree a) deriving Show 

-- x -> Nodo
-- t1 -> Lado izquierdo
-- t2 -> LAdo derecho

inorder :: BinTree a -> [a]
inorder BinLeaf = []
inorder (BinNode x t1 t2) = inorder t1 ++ [x] ++ inorder t2

preorder :: BinTree a -> [a]
preorder BinLeaf = []
preorder (BinNode x t1 t2) = [x] ++ preorder t1 ++ preorder t2

postorder :: BinTree a -> [a]
postorder BinLeaf = []
postorder (BinNode x t1 t2)= postorder t1 ++ postorder t2 ++ [x]

reflect :: BinTree a -> BinTree a
reflect BinLeaf = BinLeaf
reflect (BinNode x t1 t2) = BinNode x (reflect t2) (reflect t1)

height :: BinTree a -> Int
height BinLeaf = 0
height (BinNode x t1 t2) = 1 + max(height t1) (height t2)

size :: BinTree a -> Int
size BinLeaf = 0
size (BinNode x t1 t2) = 1 + size t1 + size t2

balanced :: BinTree a -> Bool
balanced BinLeaf = True
balanced (BinNode x t1 t2) = balanced t1 && balanced t2 && (height t1 == height t2)


-- ++++++++++++Excercise 1++++++++++++
data Tree1 = Tree1Leaf | Tree1Node Char Integer Tree1 Tree1 Tree1 deriving Show

{-
tree0 :: Tree1 
tree0 = Tree1Node 'a' 1 Tree1Leaf Tree1Leaf Tree1Leaf


tree1 :: Tree1
tree1 = Tree1Node 'a' 1
			(Tree1Node 'b' 1
				(Tree1Node 'c' 1 Tree1Leaf Tree1Leaf Tree1Leaf)
				(Tree1Node 'c' 2 Tree1Leaf Tree1Leaf Tree1Leaf)
				(Tree1Node 'c' 3 Tree1Leaf Tree1Leaf Tree1Leaf))
			(BinNode 'b' 2
				(Tree1Node 'd' 1 Tree1Leaf Tree1Leaf Tree1Leaf)
				(Tree1Node 'd' 2 Tree1Leaf Tree1Leaf Tree1Leaf)
				(Tree1Node 'd' 3 Tree1Leaf Tree1Leaf Tree1Leaf))
			Tree1Leaf
-}



-- ++++++++++++Exercise 2+++++++++++
data Tree2 = Tree2Leaf | Tree2Node Integer [Tree2]


-- +++++++++++++Excercise 3+++++++  Calculate inorder traversal of tree3
tree3 :: BinTree Int
tree3 = BinNode 4
			(BinNode 2
				(BinNode 1 BinLeaf BinLeaf)
				(BinNode 3 BinLeaf BinLeaf))
			(BinNode 7
				(BinNode 5
					BinLeaf
					(BinNode 6 BinLeaf BinLeaf))
			(BinNode 8 BinLeaf BinLeaf))

ex3 = [1,2,3,4,5,6,7,8]

-- +++++++++++++++Excercise 4++++++++++++++++ 
inorderf :: (a->b) -> BinTree a -> [b]
inorderf f BinLeaf = []
inorderf f (BinNode x t1 t2) = inorderf f t1 ++ [f x] ++ inorderf f t2

tree4 :: BinTree Int
tree4 = BinNode 4
			(BinNode 2
				(BinNode 1 BinLeaf BinLeaf)
				(BinNode 3 BinLeaf BinLeaf))
			(BinNode 6
				(BinNode 5 BinLeaf BinLeaf)
				(BinNode 7 BinLeaf BinLeaf))

t4 = ["For example, inorder tree4 produces [1, 2, 3, 4, 5, 6, 7]," ~: [1, 2, 3, 4, 5, 6, 7] ~=? (inorder tree4) ,"but inorderf (2*) tree4 produces [2, 4, 6, 8, 10, 12, 14]." ~: [2, 4, 6, 8, 10, 12, 14] ~=? (inorderf (2*) tree4 )]
-- map f (Inorder (Node x t1 t2)) --> Solución Agus


-- +++++++++++++Excercise 5++++++++++++++
tree5_1 :: BinTree Int
tree5_1 = BinNode 1 
			(BinNode 2
				(BinNode 3
					(BinNode 4
						(BinNode 5
							(BinNode 6
								(BinNode 7 BinLeaf BinLeaf)
							BinLeaf)
						BinLeaf)
					BinLeaf)
				BinLeaf)
			BinLeaf)
		BinLeaf	


tree5_2 :: BinTree Int
tree5_2 = BinNode 1
			(BinNode 2
				(BinNode 3 BinLeaf BinLeaf)
				(BinNode 4 BinLeaf BinLeaf)
			)
			(BinNode 5
				(BinNode 6 BinLeaf BinLeaf)
				(BinNode 7 BinLeaf BinLeaf)
			)

-- +++++++++++Excercise 6++++++++++++++
balanced6 :: BinTree a -> Bool
balanced6 BinLeaf = True
balanced6 (BinNode x t1 t2) = balanced6 t1 && balanced6 t2 

tree6 :: BinTree Int
tree6 = BinNode 1
			(BinNode 2
				(BinNode 3 BinLeaf BinLeaf)
				(BinNode 4 
					(BinNode 8 BinLeaf 
						(BinNode 9 BinLeaf BinLeaf)) BinLeaf)
			)
			(BinNode 5
				(BinNode 6 BinLeaf BinLeaf)
				(BinNode 7 BinLeaf BinLeaf)
			)
ex6 = balanced6 tree6
t6 = ["tree6 es un arbol no balanceado por lo que" ~: False ~=? (balanced tree6) ,"cambiando la funcion ahora ya regresa verdadero" ~: True ~=? (balanced6 tree6)]



-- ++++++++++++Excercise 7+++++++++++
balanced7 :: BinTree a -> Bool
balanced7 BinLeaf = True
balanced7 (BinNode x t1 t2) = height t1 == height t2

tree7 :: BinTree Int
tree7 = BinNode 1
			(BinNode 2
				(BinNode 3
					(BinNode 4 BinLeaf BinLeaf)
					(BinNode 5 BinLeaf BinLeaf))
				(BinNode 6
					BinLeaf
					(BinNode 7 BinLeaf BinLeaf))
			)
			(BinNode 8
				BinLeaf
				(BinNode 9
					(BinNode 10 BinLeaf BinLeaf)
					BinLeaf)
			)

ex7= balanced7 tree7
t7 = ["tree7 es un arbol no balanceado por lo que" ~: False ~=? (balanced tree7) ,"cambiando la funcion ahora ya regresa verdadero" ~: True ~=? (balanced7 tree7)]


-- ++++++++++Excercise 8++++++++++++++
mapTree :: (a->b) -> BinTree a -> BinTree b
mapTree f BinLeaf = BinLeaf
mapTree f (BinNode x t1 t2) = BinNode (f x) (mapTree f t1) (mapTree f t2)

ex8 = mapTree (*2) tree4


-- ++++++++Excercise9++++++++++++
concatTree :: BinTree [a] -> [a]
concatTree BinLeaf = []
concatTree (BinNode x t1 t2) = concatTree t1 ++ x ++ concatTree t2

tree9 :: BinTree [Int]
tree9 = BinNode [4,2,5]
			(BinNode [2,8]
				(BinNode [1,0,1] BinLeaf BinLeaf)
				(BinNode [3,5] BinLeaf BinLeaf))
			(BinNode [6]
				(BinNode [5,8] BinLeaf BinLeaf)
				(BinNode [7] BinLeaf BinLeaf))

ex9= concatTree tree9

-- +++++++++Excercise 10++++++++++++
zipTree :: BinTree a -> BinTree b -> Maybe [(a,b)]
zipTree BinLeaf t2 = Nothing
zipTree t1 BinLeaf = Nothing
zipTree (BinNode x t1 t2) (BinNode y t3 t4) = case (zipTree t1 t3) of
                    Nothing -> Nothing
                    Just lst1 ->
                      case (zipTree t2 t4) of
                        Nothing -> Nothing
                        Just lst2 -> Just (lst1 ++ [(x,y)] ++ lst2) 

tree10 :: BinTree Int
tree10 = BinNode 10
			(BinNode 20
				(BinNode 14 BinLeaf BinLeaf)
				(BinNode 36 BinLeaf BinLeaf))
			(BinNode 67
				(BinNode 51 BinLeaf BinLeaf)
				(BinNode 71 BinLeaf BinLeaf))

tree10_1 :: BinTree Int
tree10_1 = BinNode 2
			(BinNode 1 BinLeaf BinLeaf) 
			(BinNode 3 BinLeaf BinLeaf) 
tree10_2 :: BinTree Int
tree10_2 = BinNode 5 
			(BinNode 4 BinLeaf BinLeaf) 
			(BinNode 6 BinLeaf BinLeaf)

ex10= zipTree tree4 tree10


-- +++++++++++Excercise11++++++++++++++

zipWithTree :: (a->b->c) -> BinTree a -> BinTree b -> [c]
zipWithTree f t1 BinLeaf = []
zipWithTree f BinLeaf t2 = []
zipWithTree f (BinNode x t1 t2)(BinNode y t3 t4) = zipWithTree f t1 t3 ++ [f x y] ++ zipWithTree f t2 t4


ex11= zipWithTree (*) tree4 tree10

-- +++++++++Excercise12++++++++
appendTree :: BinTree a -> [a] -> [a]
appendTree arbol xs = inorder arbol ++ xs 

appendTree2 :: BinTree a -> [a] -> [a]
appendTree2 BinLeaf xs = xs
appendTree2 (BinNode a t1 t2) xs = appendTree2 t1 (a : appendTree2 t2 xs)

ex12= appendTree tree4 [10,11]
ex12b= appendTree2 tree4 [10,11]


tests = test (t4++t6++t7)