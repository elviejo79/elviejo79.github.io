-- Exercise 1. Given the sets A = {1, 2, 3, 4, 5} and B = {2, 4, 6}, calculate the
-- following sets:

-- (a) A ∪ (B ∩ A) = {1,2,3,4,5} ∪ {2,4} = {1,2,3,4,5}

-- (b) (A ∩ B) ∪ B = {2,4} ∪ B = {2,4,6} 

-- (c) A − B = {1,3,5}

-- (d) (B − A) ∩ B = {6} ∩ B =  {}

-- (e) A ∪ (B − A)= A ∪ {6} = {1,2,3,4,5,6}

type Set a = [a]

-- normalForm :: (Eq a, Show a) => [a] -> Bool
-- normalForm (x:xs) = foldr (==) x xs

-- normalizeSet :: Eq a => Set a -> Set a

-- (+++) :: (Eq a, Show a) => Set a -> Set a -> Set a
-- (+++) a b = [x | x <- a, and x <- b]

-- (***) :: (Eq a, Show a) => Set a -> Set a -> Set a
-- (***) a b = [x | x <- a, x <- b]

-- (˜˜˜) :: (Eq a, Show a) => Set a -> Set a -> Set a

-- subset, properSubset :: (Eq a, Show a) => Set a -> Set a -> Bool

-- setEq :: (Eq a, Show a) => Set a -> Set a -> Bool

-- complement s = universe ˜˜˜ s

-- Exercise 2. Work out the values of the following set expressions, and then
-- check your answer using the Haskell expression that follows.

-- (a) [1,2,3] +++ [3] = [1,2,3]

-- (b) [4,2] +++ [2,4] = [4,2]

-- (c) [1,2,3] *** [3] = [3]

-- (d) [] *** [1,3,5] = []

-- (e) [1,2,3] ˜˜˜ [3] = [1,2]

-- (f) [2,3] ˜˜˜ [1,2,3] = []

-- (g) [1,2,3] *** [1,2] = [1,2]

-- (h) [1,2,3] +++ [4,5,6] = [1,2,3,4,5,6]

-- (i) ([4,3] ˜˜˜ [5,4]) *** [1,2] = [3] *** [1,2] = []

-- (j) ([3,2,4] +++ [4,2]) ˜˜˜ [2,3] = [3,2,4] ˜˜˜ [2,3] = [4]

-- (k) subset [3,4] [4,5,6] = False

-- (l) subset [1,3] [4,1,3,6] = True

-- (m) subset [] [1,2,3] = True

-- (n) setEq [1,2] [2,1] = True

-- (o) setEq [3,4,6] [2,3,5] = False

-- (p) [1,2,3] ˜˜˜ [1] = [2,3]

-- (q) [] ˜˜˜ [1,2] = []



-- Exercise 3. The function

-- powerset :: (Eq a, Show a) => Set a -> Set (Set a)
-- takes a set and returns its power set. Work out the values of the following
-- expressions:

-- powerset [3,2,4] = [[], [3], [2], [4], [3,2], [3,4], [2,4], [3,2,4]]
-- powerset [2]= [[],[2]]


-- Exercise 4. The cross product of two sets A and B is defined as
-- A × B = {(a, b) | a ∈ A, b ∈ B}
-- The function
--crossproduct :: (Eq a, Show a, Eq b, Show b) => Set a -> Set b -> Set (a,b)
-- takes two sets and returns their cross product. Evaluate these expressions:
-- crossproduct [1,2,3] [’a’,’b’]
-- crossproduct [1] [’a’,’b’]


-- Exercise 5. In the following exercise, let u be [1,2,3,4,5,6,7,8,9,10], a
-- be [2,3,4], b be [5,6,7] and c be [1,2]. Give the elements of each set:

-- a +++ b = [2,3,4,5,6,7]

-- u˜˜˜a *** (b +++ c) = [1,5,6,7,8,9,10] *** [1,2,5,6,7] = [8,9,10]

-- c ˜˜˜ b = []

-- (a +++ b) +++ c = [2,3,4,5,6,7] +++ [1,2] = [2,3,4,5,6,7,1]

-- u˜˜˜a = [1,5,6,7,8,9,10]

-- u˜˜˜(b *** c) = [1,2,3,4,5,6,7,8,9,10] ˜˜˜ [] = [1,2,3,4,5,6,7,8,9,10]


-- Exercise 6. What are the elements of the set {x+y | x ∈ {1, 2, 3} ∧y ∈ {4, 5}}?

-- [x+y | x <- [1,2,3], y <- [4,5]] = [5,6,6,7,7,8]


-- Exercise 7. Write and evaluate a list comprehension that expresses the set
-- {x |x ∈ {1, 2, 3, 4, 5} ∧x < 0}

-- [x | x <- [1,2,3,4,5], x < 0] = []


-- Exercise 8. Write and evaluate a list comprehension that expresses the set
--{x + y |x ∈ {1, 2, 3} ∧ y ∈ {4, 5}}
-- [x+y | x <- [1,2,3], y <- [4,5]] = [5,6,6,7,7,8]


-- Exercise 9. Write and evaluate a list comprehension that expresses the set
-- {x |x ∈ {1, 2, 3, 4, 5, 6, 7, 8, 9, 10} ∧ even x}

-- [x | x <- [1,2,3,4,5,6,7,8,9,10], even x] = [2,4,6,8,10]


-- Exercise 10. What is the value of each of the following expressions?

-- subset [1,3,4] [4,3] = False

-- subset [] [2,3,4] = True

-- setEq [2,3] [4,5,6] = False

-- setEq [1,2] [1,2,3] = False


-- Exercise 11. Let A, B, and C be sets. Prove that if A ⊂ B and B ⊂ C, then
-- A ⊂ C.

-- 1.- A ⊂ B 				
-- 2.- x ∈ A → x ∈ B          {Def ⊂}
-- 3.- B ⊂ C
-- 4.- x ∈ B → x ∈ C          {Def ⊂}
-- 5.- x ∈ A → x ∈ C  		 {hipotesis de acuerdo a 2 y 4}
-- 6.- ∀x. (x ∈ A → x ∈ C)     
-- 7.- A ⊂ C


-- Exercise 12. Consider the following two claims. For each one, if it is true
-- give a proof, but if it is false give a counterexample.
-- (a) If A ⊆ B and B ⊆ C, then A ⊂ C.
-- (b) If A ⊂ B and B ⊂ C, then A ⊆ C.



-- Exercise 13. For the following questions, give a proof using set laws, or find
-- a counterexample.


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

-- Exercise 14. The function
-- smaller :: Ord a => a -> [a] -> Bool

-- takes a value and a list of values and returns True if the value is smaller
-- than the first element in the list. Using this function, write a function
-- that takes a set and returns its powerset. Use foldr.

-- Exercise 15. Prove that (A ∪ B)' = ((A ∪ A') ∩ A') ∩ ((B ∪ B') ∩ B').
--	1.- ((A ∪ A') ∩ A') ∩ ((B ∪ B') ∩ B')
--	2.- (U ∩ A') ∩ (U ∩ B')
--	3.- A' ∩ B'					{DeMorgan}
--	4.- (A ∪ B)'


-- Exercise 16. Using a list comprehension, write a function that takes two sets
-- and returns True if the first is a subset of the other.

ex16 :: Eq a => [a] -> [a] -> Bool
ex16 [] set2 = True
ex16 (x:xs) set2 = elem x set2 && ex16 xs set2

-- Exercise 17. What is wrong with this definition of diff, a function that takes
-- two sets and returns their difference?

diff :: Eq a => [a] -> [a] -> [a]
diff set1 set2 = [e | e <- set2, not (elem e set1)]

-- el problema es que se estaba haciendo la operacion alreves. Esta es la forma correcta

diff' :: Eq a => [a] -> [a] -> [a]
diff' set1 set2 = [e | e <- set1, not (elem e set2)]


-- Exercise 18. What is wrong with this definition of intersection, a function
-- that takes two sets and returns their intersection?

intersection :: Eq a => [a] -> [a] -> [a]
intersection set1 set2 = [e | e <- set1, elem e set2]

-- Lo que estaba incorrecto era la ultima seccion del predicado, donde se usaba e <- set2, en lugar de esto
-- se cambiara a elem e set2, por que se requiere que busque los elementos que se encuentran en el conjunto 2

-- Exercise 19. Write a function using a list comprehension that takes two sets
-- and returns their union.

union :: Eq a => [a] -> [a] -> [a]
union set1 set2 = set1 ++ [e | e <- set2, not (elem e set1)]

-- Exercise 20. Is it ever the case that A ∪ (B − C) = B?

-- Esta condicion se cumple si A = B y B ⊆ C o C ⊆ B
-- Por ejemplo:

-- A = {1.2}, B={1,2}, C={}

-- A ∪ (B − C)
-- = {1,2} ∪ {1,2} - {}
-- = {1,2} ∪ {1,2}
-- = {1,2}

-- Exercise 21. Give an example in which (A ∪ C) ∩ (B ∪ C) = {}
-- esto se cumple cuando C = {} y A es diferente de B
-- Ejemplo A={1,2}, B={3,4}, C={}

-- (A ∪ C) ∩ (B ∪ C)
-- ({1,2} ∪ {}) ∩ ({3,4} ∪ {})
-- {1,2} ∩ {3,4}
-- {}

-- Exercise 22. Prove the commutative law of set-intersection, A ∩ B = B ∩ A.


-- Exercise 23. Express the commutative law of set-intersection in terms of the
-- set operations and Boolean operations defined in the Stdm module.


-- Exercise 24. Prove the associative law of set-union, (A∪B)∪C = A∪(B∪C).


-- Exercise 25. Prove that the difference between two sets is the intersection of
-- one with the complement of the other, which can be written as
-- A − B = A ∩ B'


-- Exercise 26. Prove that union distributes over intersection,
-- A ∪ (B ∩ C) = (A ∪ B) ∩ (A ∪ C).


-- Exercise 27. Prove DeMorgan’s law for set intersection, (A ∩ B)' = A' ∪ B'.
