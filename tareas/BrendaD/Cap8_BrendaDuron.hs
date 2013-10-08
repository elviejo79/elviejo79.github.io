import qualified Data.Set as Set 
--import qualified Data.List

{-Exercise 1. Given the sets A = {1, 2, 3, 4, 5} and B = {2, 4, 6}, calculate the following sets:

(a) A ∪ (B ∩ A) = {1,2,3,4,5}
(b) (A ∩ B) ∪ B = {2,4,6}
(c) A − B = {1,3,5}
(d) (B − A) ∩ B = {6}
(e) A ∪ (B − A) = {1,2,3,4,5,6}
-}


{-Exercise 2. Work out the values of the following set expressions, and then check your answer using the Haskell expression that follows.
(a) [1,2,3] +++ [3] = [1,2,3]
(b) [4,2] +++ [2,4] = [2,4]
(c) [1,2,3] *** [3] = [1,2,3]
(d) [] *** [1,3,5] = []
(e) [1,2,3] ˜˜˜ [3] = [1,2]
(f) [2,3] ˜˜˜ [1,2,3] = []
(g) [1,2,3] *** [1,2] = [1,2]
(h) [1,2,3] +++ [4,5,6] =[1,2,3,4,5,6] 
](i) ([4,3] ˜˜˜ [5,4]) *** [1,2] = [3] *** [1,2] = []
(j) ([3,2,4] +++ [4,2]) ˜˜˜ [2,3] = [2,3,4] ~~~ [2,3] = [4]
(k) subset [3,4] [4,5,6] = False 
(l) subset [1,3] [4,1,3,6] = True
(m) subset [] [1,2,3] = True
(n) setEq [1,2] [2,1] = True
(o) setEq [3,4,6] [2,3,5] = False
(p) [1,2,3] ˜˜˜ [1] = [2,3]
(q) [] ˜˜˜ [1,2] = [1,2]
-}
ex2_a = Set.union (Set.fromList [1,2,3]) (Set.fromList [3])
ex2_b = Set.union (Set.fromList [2,4]) (Set.fromList [4,2])
ex2_c = Set.intersection (Set.fromList [1,2,3]) (Set.fromList [3])
ex2_d = Set.intersection (Set.empty) (Set.fromList [1,3,5])
ex2_e = Set.difference (Set.fromList [1,2,3]) (Set.fromList [3])
ex2_f = Set.difference (Set.fromList [2,3]) (Set.fromList [1,2,3])
ex2_g = Set.intersection (Set.fromList [1,2,3]) (Set.fromList [1,2])
ex2_h = Set.union (Set.fromList [1,2,3]) (Set.fromList [4,5,6])
ex2_i = Set.intersection (Set.difference (Set.fromList [4,3]) (Set.fromList [5,4])) (Set.fromList [1,2])
ex2_j = Set.difference (Set.union (Set.fromList [3,2,4]) (Set.fromList [4,2])) (Set.fromList [2,3])
ex2_k = subset (Set.fromList [4,3]) (Set.fromList [4,5,6])
ex2_l = subset (Set.fromList [1,3]) (Set.fromList [4,1,3,6])
ex2_m = subset (Set.empty) (Set.fromList [1,2,3])
ex2_n = setEq (Set.fromList [1,2]) (Set.fromList [2,1]) 
ex2_o = setEq (Set.fromList [3,4,6]) (Set.fromList [2,3,5]) 
ex2_p = Set.difference (Set.fromList [1,2,3]) (Set.fromList [1])
ex2_q = Set.difference (Set.fromList []) (Set.fromList [1,2])


--Excercise 3. Work out the values of the following expressions:
--powerset [3,2,4] = [[],[2],[2,3],[2,3,4],[2,4],[3],[3,4],[4]]
--powerset [2] = [[],[2]]

powerset :: (Ord a) => Set.Set a -> Set.Set (Set.Set a)
powerset s = Set.fromList $ map (Set.fromList) (powerList $ Set.toList s)
powerList :: [a] -> [[a]]
powerList [] = [[]]
powerList (x:xs) = powerList xs ++ map (x:) (powerList xs)
ex3_1 = powerset (Set.fromList [3,2,4])
ex3_2 = powerset (Set.fromList [2])


--Excercise 4. Evaluate these expressions:
--crossproduct [1,2,3] [’a’,’b’] = [(1,'a'),(1,'b'),(2,'a'),(2,'b'),(3,'a'),(3,'b')]
--crossproduct [1] [’a’,’b’] = [(1,'a'), (1,'b')]

crossproduct :: (Eq a, Show a,Ord a, Eq b, Show b, Ord b) => Set.Set a -> Set.Set b ->  Set.Set (a,b)
crossproduct aSet bSet = Set.fromList $ [(a,b) |  a <- Set.toList aSet , b <- Set.toList bSet]
ex4_1 = crossproduct (Set.fromList [1,2,3]) (Set.fromList ['a','b'])
ex4_2 = crossproduct (Set.fromList [1]) (Set.fromList ['a','b'])


{-Exercise 5. In the following exercise, let u be [1,2,3,4,5,6,7,8,9,10],
  a be [2,3,4], b be [5,6,7] and c be [1,2]. Give the elements of each set:

1. a +++ b = [2,3,4,5,6,7]
2. u˜˜˜a *** (b +++ c) = [1,5,6,7,8,9,10] *** [5,6,7,1,2] = [1,5,6,7]
3. c ˜˜˜ b = [1,2] 
4. (a +++ b) +++ c = [1,2,3,4,5,6,7]
5. u˜˜˜a = [1,5,6,7,8,9,10]
6. u˜˜˜(b *** c) = [1,2,3,4,5,6,7,8,9,10]
-}
ex5_1 = Set.union (Set.fromList [2,3,4]) (Set.fromList [5,6,7])
ex5_2 = Set.intersection (Set.difference (Set.fromList [1,2,3,4,5,6,7,8,9,10]) (Set.fromList [2,3,4])) (Set.union (Set.fromList [5,6,7]) (Set.fromList [1,2]))
ex5_3 = Set.difference (Set.fromList [1,2]) (Set.fromList [5,6,7])
ex5_4 = Set.union (Set.union (Set.fromList [2,3,4]) (Set.fromList [5,6,7])) (Set.fromList [1,2])
ex5_5 = Set.difference (Set.fromList [1,2,3,4,5,6,7,8,9,10]) (Set.fromList [2,3,4])
ex5_6 = Set.difference  (Set.fromList [1,2,3,4,5,6,7,8,9,10]) (Set.intersection (Set.fromList [5,6,7]) (Set.fromList [1,2]))


{-Exercise 6. What are the elements of the set {x+y | x ∈ {1, 2, 3}∧y ∈ {4, 5}}?
   {5,6,6,7,7,8}
-}
ex6 =  [x+y | x <-[1,2,3], y <- [4,5]]


{-Exercise 7. Write and evaluate a list comprehension that expresses the set {x |x ∈ {1, 2, 3, 4, 5} ∧x < 0}
	{}
-}
ex7 = [x | x <- [1,2,3,4,5], x<0] 


{-Exercise 8. Write and evaluate a list comprehension that expresses the set {x + y |x ∈ {1, 2, 3} ∧ y ∈ {4, 5}}
	{5,6,6,7,7,8}
-}
ex8 =  [x+y | x <-[1,2,3], y <- [4,5]]


{-Exercise 9. Write and evaluate a list comprehension that expresses the set {x |x ∈ {1, 2, 3, 4, 5, 6, 7, 8, 9, 10} ∧ even x}
	{1,3,5,7,9}
-}
ex9 = [x |x <- [1..10] , mod x 2 /= 0] 

{-Exercise 10. What is the value of each of the following expressions?
subset [1,3,4] [4,3]
subset [] [2,3,4]
setEq [2,3] [4,5,6]
setEq [1,2] [1,2,3]
-}
subset :: (Eq a, Show a, Ord a) => Set.Set a -> Set.Set a -> Bool
subset a b = Set.isSubsetOf a b
setEq :: (Eq a, Show a, Ord a) => Set.Set a -> Set.Set a -> Bool
setEq a b = if a == b then True else False
ex10_1 = subset (Set.fromList [1,3,4]) (Set.fromList [4,3])
ex10_2 = subset (Set.empty) (Set.fromList [2,3,4])
ex10_3 = setEq (Set.fromList [2,3]) (Set.fromList [4,5,6])
ex10_4 = setEq (Set.fromList [1,2]) (Set.fromList [1,2,3])

{-Exercise 11. Let A, B, and C be sets. Prove that if A ⊂ B and B ⊂ C, then A ⊂ C.
/= --> quiere decir distinto

A ⊂ B 			    --{premisa}
A ⊆ B and A /= B   -- {def. ⊆}
B ⊂ C     			--{premisa}
B ⊆ C and B /= C   -- {def. ⊆}
????
-}


{-Exercise 12. Consider the following two claims. For each one, if it is true give a proof, but if it is false give a counterexample.
(a) If A ⊆ B and B ⊆ C, then A ⊂ C.


(b) If A ⊂ B and B ⊂ C, then A ⊆ C.


-}

{-Exercise 13. For the following questions, give a proof using set laws, or find a counterexample.
(a) (A' ∪ B)' ∩ C' = A ∩ (B ∪ C)'
(A' ∪ B)' ∩ C' =
				= A'' ∩ B' ∩ C'
				= A ∩ B' ∩ C'
				= A ∩ (B ∪ C)'

(b) A − (B ∪ C)' = A ∩ (B ∪ C)
A − (B ∪ C)' =
			= A ∩ (B ∪ C)''
			= A ∩ (B ∪ C)

(c) (A ∩ B) ∪ (A ∩ B') = A
(A ∩ B) ∪ (A ∩ B') =
					= A ∩ (B ∪ B')
					= A ∩ U
					= A

(d) A ∪ (B − A) = A ∪ B
A ∪ (B − A) =
			= A ∪ (B ∩ A')
			= (A ∪ B) ∩ (A ∪ A')
			= (A ∪ B) ∩ U
			= A ∪ B

(e) A − B = B' − A'
A − B=
	= A ∩ B'
	= B' ∩ A
	= B' ∩ A''
	= B' − A'

(f) A ∩ (B − C) = (A ∩ B) − (A ∩ C)
A ∩ (B − C) =
			= A ∩ (B ∩ C')
			= (A ∩ B) - (A ∩ C)

(g) A − (B ∪ C) = (A − B) ∩ (A − C)
A − (B ∪ C) =
			= A ∩ (B ∪ C)'
			= A ∩ (B' ∩ C')
			= A ∩ A ∩ B' ∩ C'
			= (A ∩ B') ∩ (A ∩ C')
			= (A − B) ∩ (A − C)

(h) A ∩ (A' ∪ B) = A ∩ B
A ∩ (A' ∪ B) =
				= (A ∩ A') ∪ (A ∩ B)
				= 0 ∪ (A ∩ B)
				= A ∩ B

(i) (A − B') ∪ (A − C') = A ∩ (B ∩ C)
(A − B') ∪ (A − C') =
					= (A ∩ B'') ∪ (A ∩ C'')
					= (A ∩ B) ∪ (A ∩ C)
					= A ∩ (B ∪ C)
-}


--Exercise 14 Using the smaller function, write a function that takes a set and returns its powerset. Use foldr.
normalizeSet :: (Eq a, Ord a) => Set.Set a -> Set.Set a
normalizeSet set = Set.fromList $ [ x |  x <- Set.toList set , elem x (Set.toList set)]

normalizeSet1 :: (Eq a, Ord a) => [a] -> [a]
normalizeSet1 [] = []
normalizeSet1 (x:xs) = if (elem x xs) 
				then normalizeSet1 xs 
				else x:normalizeSet1 xs

smaller :: Ord a => a -> [a] -> Bool
smaller x [] = True
smaller x (y:xs) = x < y

powerSet1 :: (Ord a, Eq a) => [a] -> [[a]]
powerSet1 set = normalizeSet1 (foldr f [[]] set)
			where f x acc = [x:epset | epset <- acc, not (elem x epset) && smaller x epset] ++ acc

ex14 = powerSet1 [1,2,3]


{-Exercise 15. Prove that (A ∪ B)' = ((A ∪ A') ∩ A') ∩ ((B ∪ B') ∩ B').
(A ∪ B)' =
		 = (A' ∩ B')
		 = (U - A) ∩ (U - B)
		 = ((A ∪ A') − A) ∩ ((B ∪ B') − B)
		 = ((A ∪ A') ∩ A') ∩ ((B ∪ B') ∩ B')
-}


{-Exercise 16. Using a list comprehension, write a function that takes two sets and returns True if the first is a subset of the other.-}
isSubset :: (Eq a,Ord a) => Set.Set a -> Set.Set a -> Bool
isSubset s1 s2 =  null [x |x <- Set.toList s1, not (elem x (Set.toList s2)) ]

ex16_true = isSubset (Set.fromList [1,2,3]) (Set.fromList [1,2,3,5,6])
ex16_false = isSubset (Set.fromList [1,2,3,7]) (Set.fromList [1,2,3,5,6])


{-Exercise 17. What is wrong with this definition of diff, a function that takes two sets and returns their difference?
diff :: Eq a => [a] -> [a] -> [a]
diff set1 set2 = [e | e <- set2, not (elem e set1)]

Que recorre primero el segundo Set y compara que no sea un elemento del primero, es decir los parametros los toma al revez
-}


{-Exercise 18. What is wrong with this definition of intersection, a function that takes two sets and returns their intersection?
intersection :: [a] -> [a] -> [a]
intersection set1 set2 = [e | e <- set1, e <- set2]
Con esa definicion para cada elemento del set1 va a tomar todos los valores del set2. Forma correcta es:
-}
intersection ::Eq a => [a] -> [a] -> [a]
intersection set1 set2 = [e | e <- set1, elem e set2]
ex18 = intersection [1,3,5] [6,4,9,10,3]


{-Exercise 19. Write a function using a list comprehension that takes two sets and returns their union. -}
union ::(Eq a, Ord a) => [a] -> [a] -> [a]
union set1 set2 = [ x | x <- set1++set2]
ex19 = union [1,3,5] [6,4,9,10]


{-Exercise 20. Is it ever the case that A ∪ (B − C) = B?
Sí cuando A ⊆ B y C ⊆ A.
-}

{-Exercise 21. Give an example in which (A ∪ C) ∩ (B ∪ C) = 0.
 A = {1,2}
 B = {4,5}
 C = {}
 ({1,2} ∪ {}) ∩ ({4,5} ∪ {}) =
 								={1,2} ∩ {4,5}
 								=0 -- set vacio
-}

{-Exercise 22. Prove the commutative law of set-intersection, A ∩ B = B ∩ A.
 A ∩ B =
 = x ∈ A ∩ B { Premise }
 = x ∈ A ∧ x ∈ B { Def. ∩ }
 = x ∈ B ∧ x ∈ A { Comm. ∧ }
 = x ∈ B ∩ A { Def. ∩ }
 ∀x ∈ U.
	x ∈ A ∩ B ↔ x ∈ B ∩ A { {∀I} }
 A ∩ B = B ∩ A. { Def. set equality }

-}

{-Exercise 23. Express the commutative law of set-intersection in terms of the set operations and Boolean operations defined in the Stdm module.
	A *** B = B *** A
-}

{-Exercise 24. Prove the associative law of set-union, (A∪B)∪C = A∪(B∪C).
(A ∪ B) ∪ C =
= {x |(x ∈ A ∨ x ∈ B) ∨ x ∈ C}  -- { defn ∪ }
= {x|x ∈ A ∨ (x ∈ B ∨ x ∈ C)}   -- { ∨ associative }
= A ∪ (B ∪ C)                     -- { defn ∪ }   

-}

{-
Exercise 25. Prove that the difference between two sets is the intersection of
one with the complement of the other, which can be written as A − B = A ∩ B'
A − B =
=A − B''  --{ double complement }
= {x|x ∈ A ∧ x ∈/ B''}   -- { defn. − }
= {x|x ∈ A∧ ¬(x ∈ U ∧ x ∈/ B')}  -- { defn. complement }
= {x|x ∈ A∧ ¬(x ∈ U ∧ ¬(x ∈ B'))}  -- { defn. ∈/ }
= {x|x ∈ A∧ ¬(x ∈ U ∧ ¬(x ∈ U ∧ x ∈/ B))}  -- { defn. complement }
= {x|x ∈ A∧ ¬(x ∈ U ∧ ¬(x ∈ U ∧ ¬(x ∈ B)))}  -- { defn. ∈/ }
= {x|x ∈ A∧ ¬(x ∈ U ∧ (¬(x ∈ U) ∨ (x ∈ B)))}  -- { DM, double negation }
= {x|x ∈ A ∧ (¬(x ∈ U)∨ ¬(¬(x ∈ U) ∨ (x ∈ B)))}  -- { DM }
= {x|x ∈ A ∧ (x ∈/ U ∨ (¬¬(x ∈ U)∧ ¬(x ∈ B)))}   -- { DM }
= {x|x ∈ A ∧ (x ∈/ U ∨ (x ∈ U ∧ x ∈/ B))}  -- { double negation, defn. ∈/ }
= {x|x ∈ A ∧ (x ∈ U ∧ x ∈/ B)}   -- { ∨ null, defn. ∈/ }
= {x|x ∈ A ∧ x ∈ U − B}  -- { defn.− }
= A ∩ B'  -- { defn. complement,∩ }
=
-}

{-
Exercise 26. Prove that union distributes over intersection,
A ∪ (B ∩ C) = (A ∪ B) ∩ (A ∪ C).
A ∪ (B ∩ C) =    				
= {x|x ∈ A ∨ (x ∈ B ∧ x ∈ C)}              -- { defn ∩,∪ }
= {x|(x ∈ A ∨ x ∈ B) ∧ (x ∈ A ∨ x ∈ C)}   -- { ∨ over ∧ }
= (A ∪ B) ∩ (A ∪ C)                           -- { def . ∩, ∪ }
-}

{-
Exercise 27. Prove DeMorgan’s law for set intersection, (A ∩ B)' = A' ∪ B'.
Nota ∈/ -> quiere decir no pertenece solo que no tengo el simbolo
(A ∩ B)' =
= {x|x ∈ U ∧ x ∈/ (A ∩ B)}   -- { defn. complement }
= {x|x ∈ U ∧ ¬(x ∈ A ∧ x ∈ B)}  -- { defn. ∈/,∩ }
= {x|x ∈ U ∧ (¬(x ∈ A)∨ ¬(x ∈ B))}  -- { DM }
= {x|x ∈ U ∧ (x ∈/ A ∨ x ∈/ B)}  -- { defn. ∈/ }
= {x|(x ∈ U ∧ x ∈/ A) ∨ (x ∈ U ∧ x ∈/ B)}   -- { ∧ over ∨ }
= {x|(x ∈ U − A) ∨ (x ∈ U − B)}  -- { defn. − }
= A' ∪ B'  -- { defn. complement,∪ }

-}