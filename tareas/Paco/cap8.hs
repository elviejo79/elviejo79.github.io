type Set a = [a]

normalForm :: (Eq a, Show a) => [a] -> Bool
normalForm [] = True
normalForm (x:xs) = if (elem x xs) then False else normalForm xs


normalizeSet :: Eq a => Set a -> Set a
normalizeSet [] = []
normalizeSet (x:xs) = if (elem x xs) then normalizeSet xs else x:normalizeSet xs

--Union
(+++) :: (Eq a, Show a, Ord a) => Set a -> Set a -> Set a
(+++) xs ys = normalizeSet (xs ++ ys)

difference :: Eq a => Set a -> Set a -> Set a
difference xs ys = foldr diff [] xs
	   where diff new x = if (elem new ys) then x
	   	      	      	   	     	 else new:x

