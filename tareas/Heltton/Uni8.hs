--exe1 A = {1, 2, 3, 4, 5} and B = {2, 4, 6}
	
--	(a) A∪(B∩A) = A∪(2,4)
--			= {1,2,3,4,5}

--	(b) (A∩B)∪B ={2,4}∪B
--				={2,4,6}

--	(c) A−B  	= {1,3,5}
--	(d) (B−A)∩B = {1,3,5}∩B
--				= {}
	
--	(e) A∪(B−A) = A∪{6}
--				= {1,2,3,4,5,6}
type Set a = [a]

--exe2;
--(a) [1,2,3] +++ [3] = [1,2,3]
--(b) [4,2] +++ [2,4] = [4,2]
--(c) [1,2,3] *** [3] = [3]
--(d) [] *** [1,3,5]  = []
--(e) [1,2,3] ̃̃̃ [3] = [1,2]
--(f) [2,3] ̃̃̃ [1,2,3] = [1]
--(g) [1,2,3] *** [1,2] =[1,2]
--(h) [1,2,3] +++ [4,5,6] = [1,2,3,4,5,6]
--(i) ([4,3] ̃̃̃ [5,4]) *** [1,2] =(3,5)***[1,2] 
--								=[] 
--(j) ([3,2,4] +++ [4,2]) ̃̃̃ [2,3] = [2,3,4] ̃̃̃ [2,3] 
--								  = [4]
--(k) subset [3,4] [4,5,6]    = FALSE
--(l) subset [1,3] [4,1,3,6]  = TRUE
--(m) subset [] [1,2,3]  		= TRUE
--(n) setEq [1,2] [2,1] 		= TRUE
--(o) setEq [3,4,6] [2,3,5]   = FALSE
--(p) [1,2,3] ̃̃̃ [1]      	= [2,3]
--(q) [] ̃̃̃ [1,2]			= []

-- Exercise 4. The cross product of two sets A and B is defined as
-- A × B = {(a, b) | a ∈ A, b ∈ B}
-- The function
--crossproduct :: (Eq a, Show a, Eq b, Show b) => Set a -> Set b -> Set (a,b)
-- takes two sets and returns their cross product. Evaluate these expressions:
-- crossproduct [1,2,3] [’a’,’b’]
-- crossproduct [1] [’a’,’b’]


--exe5:
--U = {1,2,3,4,5,6,7,8,9,10}
--A = {2,3,4}
--B = {5,6,7}
--C = {1,2}

--a +++ b 				= [2,3,4,5,6,7]
--u ̃̃̃a *** (b +++ c) 	= u ̃̃̃a *** [2,3,4,1]
--						= [1,5,6,7,8,9,10] *** [1,2,3,4]
--						= [1]
--c ̃̃̃ b 				= [1,2,3,4,8,9,10]
--(a +++ b) +++ c  		= [2,3,4,5,6,7] +++ c  
--						= [1,2,3,4,5,6,7]
--u ̃̃̃a 					= [1,5,6,7,8,9,10]
--u ̃̃̃ (b *** c)			= u ̃̃̃ []
--						= [1,2,3,4,5,6,7,8,9,10]

--exe6: What are the elements of the set {x+y | x ∈ {1, 2, 3}∧y ∈ {4, 5}}?
--[5,6,6,7,7,8]


--Exercise 7. Write and evaluate a list comprehension that expresses the set
--{x |x ∈ {1, 2, 3, 4, 5} ∧ x < 0}
--[x| x<- [1,2,3,4,5],x<0]

--No es posible debido a que la ultima condición no encaja con el conjunto

--Exercise 8. Write and evaluate a list comprehension that expresses the set
--{x + y |x ∈ {1, 2, 3} ∧ y ∈ {4, 5}}
--[x+y| x<-[1,2,3],y<-[4,5]]
--[5,6,6,7,7,8]


--Exercise 9. Write and evaluate a list comprehension that expresses the set
--{x |x ∈ {1, 2, 3, 4, 5, 6, 7, 8, 9, 10} ∧ even x}
--[x | x <- [1,2,3,4,5,6,7,8,9,10], even x] = [2,4,6,8,10]


--Exercise 10. What is the value of each of the following expressions?
--subset [1,3,4] [4,3] = FALSE
--subset [] [2,3,4]    = TRUE
--setEq [2,3] [4,5,6]  = FALSE
--setEq [1,2] [1,2,3]  = FALSE

--Exercise 11. Let A, B, and C be sets. Prove that if A ⊂ B and B ⊂ C, then A ⊂ C.


--Exercise 13. For the following questions, give a proof using set laws, or find a counterexample.

--(a) (A␣ ∪B)␣ ∩C␣ =A∩(B∪C)␣ (b) A−(B∪C)␣ =A∩(B∪C)
--(c) (A∩B)∪(A∩B␣)=A (d) A∪(B−A)=A∪B
--(e) A − B = B␣ − A␣ (f) A∩(B−C)=(A∩B)−(A∩C)
--(g) A−(B∪C)=(A−B)∩(A−C) (h) A∩(A␣ ∪B)=A∩B
--(i) (A−B␣)∪(A−C␣)=A∩(B∩C)

-- (a) (A' ∪ B)' ∩ C' = A ∩ (B ∪ C)'
--	1.- (A' ∪ B)' ∩ C'
--	2.- A'' ∩ B' ∩ C'      {DeMorgan}
--	3.- A ∩ B' ∩ C'        {Double complement}
--	4.- A ∩ (B ∪ C)'      {DeMorgan}


-- (b) A − (B ∪ C)' = A ∩ (B ∪ C)
--	1.- A − (B ∪ C)'
--	2.- A − (B' ∩ C')        {DeMorgan}
--	3.- A ∩ (B' ∩ C')'       {5}
--	4.- A ∩ (B'' ∪ C'')     {Double complement}
--	5.- A ∩ (B ∪ C)


-- (c) (A ∩ B) ∪ (A ∩ B') = A
--	1.- (A ∩ B) ∪ (A ∩ B')
--	2.- A ∩ (B ∪ B')          {Distributiva}
--	3.- A ∩ U                  {identity}
--	4.- A 					   

-- (d) A ∪ (B − A) = A ∪ B
--	1.- A ∪ (B − A)
--	2.- A ∪ (B ∩ A')         {5}
--	3.- A ∪ (A' ∩ B)         {conmutative}
--	4.- (A ∪ A') ∩ (A ∪ B)  {Distributiva}
--	5.- U ∩ (A ∪ B)          {identity}
--	6.- (A ∪ B)

-- (e) A − B = B' − A'
--	1.- A − B
--	2.- A ∩ B'       {5}
--	3.- B' ∩ A       {conmutative}
--	4.- B' ∩ A''     {Double complement}
--	5.- B' − A'      {5}

-- (f) A ∩ (B − C) = (A ∩ B) − (A ∩ C)
--	1.- (A ∩ B) − (A ∩ C)
--	2.- (A ∩ B) ∩ (A ∩ C)'      {5}
--	3.- (A ∩ B) ∩ (A' ∪ C')    {DeMorgan}
--	4.- A ∩ ( B ∩ (A' ∩ C'))   {Asociative}
--	5.- A ∩ ( B - (A' ∩ C'))


-- (g) A − (B ∪ C) = (A − B) ∩ (A − C)
--	1.- (A − B) ∩ (A − C)
--	2.- (A ∩ B') ∩ (A ∩ C')   	{5}
--	3.- (A ∩ A) ∩ (B' ∩ C')     {Asociative}
--	4.- A ∩ (B' ∩ C')  			{DeMorgan}
--	5.- A ∩ (B ∪ C)'   			{5}
--	6.- A − (B ∪ C)

-- (h) A ∩ (A' ∪ B) = A ∩ B
--	1.- A ∩ (A' ∪ B)      
--	2.- (A ∩ A') ∪ (A ∩ B)		{Distributiva}
--	3.- (A ∩ B)

-- (i) (A − B') ∪ (A − C') = A ∩ (B ∩ C)
--	1.- (A − B') ∪ (A − C')
--	2.- (A ∩ B'') ∪ (A ∩ C'')     {5}
--	3.- (A ∩ B) ∪ (A ∩ C)		   {Double complement}
--	4.- A ∩ (B ∪ C)


--Exercise 14. The function
--smaller :: Ord a => a -> [a] -> Bool
--smallerSet::Ord a => a -> [a] -> Bool


--Exercise15. Provethat(A∪B)' =((A∪A')∩A')∩((B∪B')∩B')


--Exercise 16. Using a list comprehension, write a function that takes two sets
--and returns True if the first is a subset of the other.
ex16 :: Eq a => [a] -> [a] -> Bool
ex16 [] s2 = True
ex16(x:xs) s2 = elem x s2 && ex16 xs s2




isSubset::Eq a => [a] -> [a] -> Bool
isSubset set1 set2 = null [e | e <- set1, not(elem e set2)]

--Exercise 17. What is wrong with this definition of diff, a function that takes two sets and returns their difference?
--diff :: Eq a => [a] -> [a] -> [a] diff set1 set2 = [e | e <- set2, not (elem e set1)]


diff :: Eq a => [a] -> [a] -> [a]
diff set1 set2 = [e | e <- set1, not (elem e set2)]

-- Exercise 18. What is wrong with this definition of intersection, a function
-- that takes two sets and returns their intersection?
intersection :: Eq a => [a] -> [a] -> [a] 
intersection set1 set2 = [e | e <- set1, elem e <- set2]

-- Exercise 19. Write a function using a list comprehension that takes two sets
-- and returns their union.

union :: Eq a => [a] -> [a] -> [a]
union set1 set2 = set1 ++ [e | e <- set2, not (elem e set1)]


--Exercise 20.Is it ever the case that A∪(B−C)=B? 



--Exercise 21.Give an example in which (A∪C)∩(B∪C)=0
-- (A∪C)∩(B∪C)=0
-- ({1,2}∪{3,4})∩({5,6}∪{7,8})=0
-- ({1,2,3,4}∩{5,6,7,8})
-- ()


--Exercise 22.Prove the commutative law of set-intersection,A∩B=B∩A



