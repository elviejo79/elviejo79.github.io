-------------------------------------------------------------------------------------
-- Exercise 1. Given the sets A = {1, 2, 3, 4, 5} and B = {2, 4, 6}, calculate the --
-- following sets:                                                                 --
-------------------------------------------------------------------------------------
(a) A ∪ (B ∩ A) = A
(b) (A ∩ B) ∪ B = B
(c) A − B = {1,3,5}
(d) (B − A) ∩ B = {6}
(e) A ∪ (B − A) = {1, 2, 3, 4, 5, 6}

--------------------------------------------------------------------------------
-- Exercise 2. Work out the values of the following set expressions, and then --
-- check your answer using the Haskell expression that follows.               --
--------------------------------------------------------------------------------
(a) [1,2,3] +++ [3]
(b) [4,2] +++ [2,4]
(c) [1,2,3] *** [3]
(d) [] *** [1,3,5]
(e) [1,2,3]  ̃ ̃ ̃ [3]
(f ) [2,3]  ̃ ̃ ̃ [1,2,3]
(g) [1,2,3] *** [1,2]
(h) [1,2,3] +++ [4,5,6]
(i) ([4,3]  ̃ ̃ ̃ [5,4]) *** [1,2]
(j) ([3,2,4] +++ [4,2])  ̃ ̃ ̃ [2,3]
(k) subset [3,4] [4,5,6]
(l) subset [1,3] [4,1,3,6]
(m) subset [] [1,2,3]
(n) setEq [1,2] [2,1]
(o) setEq [3,4,6] [2,3,5]
(p) [1,2,3]  ̃ ̃ ̃ [1]
(q) []  ̃ ̃ ̃ [1,2]

type Set a = [a]

normalForm :: (Eq a, Show a) => [a] -> Bool
normalForm [] = true
normalForm (x:xs) = if (elem x xs) then false else normalForm xs

normalizeSet :: Eq a => Set a -> Set a
normalizeSet [] = []
normalizeSet (x:xs) = if (elem x xs) then normalizeSet xs else x:normalizeSet xs

Union
(+++) :: (Eq a, Show a, Ord a) => Set a -> Set a -> Set a
(+++) xs ys = normalizeSet (xs ++ ys)

Intersection
(***) :: (Eq a, Show a) => Set a -> Set a -> Set a
(***) (x:xs) ys = if (elem x ys) then x:(***) xs ys else []:(***) xs ys
(***) [] ys = []

Difference
( ̃ ̃ ̃) :: (Eq a, Show a) => Set a -> Set a -> Set a
( ̃ ̃ ̃) (x:xs) ys = if (elem x ys) then ( ̃ ̃ ̃) xs ys else x:( ̃ ̃ ̃) xs ys
( ̃ ̃ ̃) [] ys = []

subset :: (Eq a, Show a) => Set a -> Set a -> Bool
subset (x:xs) ys = if elem x ys then subset xs ys else False
subset xs [] = False
subset [] ys = False
subset [] [] = True

properSubset :: (Eq a, Show a) => Set a -> Set a -> Bool
properSubset (x:xs) ys = if elem x ys then properSubset xs ys else False
properSubset xs [] = True
properSubset [] ys = True
properSubset [] [] = False

smaller :: Ord a => a -> [a] -> Bool
smaller x [] = True
smaller x (y:xs) = x < y

powerset :: (Eq a, Show a) => Set a -> Set (Set a)
powerset set = foldr smaller 0 set
powerset [] = []

---------------------------------------------------------------------------------
-- Exercise 3. The function                                                    --
-- powerset :: (Eq a, Show a) => Set a -> Set (Set a)                          --
-- takes a set and returns its power set. Work out the values of the following --
-- expressions:                                                                --
-- powerset [3,2,4]                                                            --
-- powerset [2]                                                                --
---------------------------------------------------------------------------------

powerset [3,2,4] => [[],[3],[2],[4],[3,2],[3,4],[2,4],[3,2,4]]


---------------------------------------------------------------------
-- Exercise 4. The cross product of two sets A and B is defined as --
---------------------------------------------------------------------
A × B = {(a, b) | a ∈ A, b ∈ B}
The function
crossproduct :: (Eq a, Show a, Eq b, Show b) =>
Set a -> Set b -> Set (a,b)
takes two sets and returns their cross product. Evaluate these expressions:
crossproduct [1,2,3] [’a’,’b’]
crossproduct [1] [’a’,’b’]

-------------------------------------------------------------------------------------------------------------------------------------------------------
-- Exercise 5. In the following exercise, let u be [1,2,3,4,5,6,7,8,9,10], a be [2,3,4], b be [5,6,7] and c be [1,2]. Give the elements of each set: --
-------------------------------------------------------------------------------------------------------------------------------------------------------
a +++ b
u ̃ ̃ ̃a *** (b +++ c)
c  ̃ ̃ ̃ b
(a +++ b) +++ c
u ̃ ̃ ̃a
u ̃ ̃ ̃(b *** c)

-------------------------------------------------------------------------------------
-- Exercise 6. What are the elements of the set {x+y | x ∈ {1, 2, 3} ∧y ∈ {4, 5}}? --
-------------------------------------------------------------------------------------
 [x+y | x <-[1,2,3], y <- [4,5]]
--------------------------------------------------------------------------------
-- Exercise 7. Write and evaluate a list comprehension that expresses the set {x |x ∈ {1, 2, 3, 4, 5} ∧ x < 0}--
--------------------------------------------------------------------------------
[x | x <- [1,2,3,4,5], x<0] 

--------------------------------------------------------------------------------
-- Exercise 8. Write and evaluate a list comprehension that expresses the set {x + y |x ∈ {1, 2, 3} ∧ y ∈ {4, 5}}--
--------------------------------------------------------------------------------

[x+y | x <-[1,2,3], y <- [4,5]]

--------------------------------------------------------------------------------
-- Exercise 9. Write and evaluate a list comprehension that expresses the set {x |x ∈ {1, 2, 3, 4, 5, 6, 7, 8, 9, 10} ∧ even x}--
--------------------------------------------------------------------------------
[x |x <- [1..10] , mod x 2 /= 0] 

--------------------------------------------------------------------------
-- Exercise 10. What is the value of each of the following expressions? --
--------------------------------------------------------------------------
subset [1,3,4] [4,3] --> False
subset [] [2,3,4]    --> True
setEq [2,3] [4,5,6]  --> False
setEq [1,2] [1,2,3]  --> False

--------------------------------------------------------------------------------------
-- Exercise 11. Let A, B, and C be sets. Prove that if A ⊂ B and B ⊂ C, then A ⊂ C. --
--------------------------------------------------------------------------------------

A ⊂ B
x ∈ A -> x ∈ B
B ⊂ C
x ∈ B -> x ∈ C
x ∈ A -> x ∈ C
∀ x.x (x ∈ A -> x ∈ C)
A ⊂ C

-----------------------------------------------------------------------------------------------------------------------------------------
-- Exercise 12. Consider the following two claims. For each one, if it is true give a proof, but if it is false give a counterexample. --
-----------------------------------------------------------------------------------------------------------------------------------------
(a) If A ⊆ B and B ⊆ C, then A ⊂ C.

False if they are equal
 
(b) If A ⊂ B and B ⊂ C, then A ⊆ C.

False if they are not equal. 

-----------------------------------------------------------------------------------------------------
-- Exercise 13. For the following questions, give a proof using set laws, or finda counterexample. --
-----------------------------------------------------------------------------------------------------
(a) (A' ∪ B)' ∩ C' = A ∩ (B ∪ C)''
=A''∩B' ∩C'
=A∩B' ∩C'
= A ∩ (B ∪ C)''

(b) A − (B ∪ C)' = A ∩ (B ∪ C)
= A ∩ (B ∪ C)''
= A ∩ (B ∪ C)

(c) (A ∩ B) ∪ (A ∩ B' ) = A
= A ∩ (B ∪ B')
= A ∩ U
= A

(d) A ∪ (B − A) = A ∪ B
= A ∪ (B ∩ A')
= (A ∪ B) ∩ (A ∪ A')
= (A ∪ B) ∩ U
= A ∪ B

(e) A − B = B' − A'
= A ∩ B'
= B' ∩ A
= B' ∩ A''
= B' − A'
          
(f ) A ∩ (B − C) = (A ∩ B) − (A ∩ C)
= A ∩ (B ∩ C')
= (A ∩ B) - (A ∩ C)

(g) A − (B ∪ C) = (A − B) ∩ (A − C)
= A ∩ (B ∪ C)'
= A ∩ (B' ∩ C')
= A ∩ A ∩ B' ∩ C'
= (A ∩ B') ∩ (A ∩ C')
= (A − B) ∩ (A − C)

(h) A ∩ (A' ∪ B) = A ∩ B
= (A ∩ A') ∪ (A ∩ B)
= 0 ∪ (A ∩ B)
= A ∩ B

(i) (A − B' ) ∪ (A − C' ) = A ∩ (B ∩ C)
= (A ∩ B'') ∪ (A ∩ C'')
= (A ∩ B) ∪ (A ∩ C)
= A ∩ (B ∪ C)


-------------------------------
-- Exercise 14. The function --
-------------------------------
smaller :: Ord a => a -> [a] -> Bool
takes a value and a list of values and returns True if the value is smaller
than the first element in the list. Using this function, write a function
that takes a set and returns its powerset. Use foldr.

---------------------------------------------------------------------------
-- Exercise 15. Prove that (A ∪ B)' = ((A ∪ A') ∩ A') ∩ ((B ∪ B') ∩ B'). --
---------------------------------------------------------------------------
= (A' ∩ B')
= (U - A) ∩ (U - B)
= ((A ∪ A') − A) ∩ ((B ∪ B') − B)
= ((A ∪ A') ∩ A') ∩ ((B ∪ B') ∩ B')

-------------------------------------------------------------------------------------------------------------------------------------------
-- Exercise 16. Using a list comprehension, write a function that takes two sets and returns True if the first is a subset of the other. -- -- --
-------------------------------------------------------------------------------------------------------------------------------------------

isSubset :: Eq a => [a] -> [a] -> Bool
isSubset set1 set2 = null [e | e <- set1, not (elem e set2)]

---------------------------------------------------------------------------------------------------------------------------
-- Exercise 17. What is wrong with this definition of diff, a function that takes two sets and returns their difference? --
---------------------------------------------------------------------------------------------------------------------------
diff :: Eq a => [a] -> [a] -> [a]
diff set1 set2 = [e | e <- set2, not (elem e set1)]

--esta al reves


-------------------------------------------------------------------------------------------------------------------------------------
-- Exercise 18. What is wrong with this definition of intersection, a function that takes two sets and returns their intersection? --
-------------------------------------------------------------------------------------------------------------------------------------

intersection :: [a] -> [a] -> [a]
intersection set1 set2 = [e | e <- set1, e <- set2]

--se toman todos los valores de ambos sets

-----------------------------------------------------------------------------------------------------------
-- Exercise 19. Write a function using a list comprehension that takes two sets and returns their union. --
-----------------------------------------------------------------------------------------------------------

(+++) :: (Eq a, Show a, Ord a) => Set a -> Set a -> Set a
(+++) xs ys = normalizeSet (xs ++ ys)

-------------------------------------------------------------
-- Exercise 20. Is it ever the case that A ∪ (B − C) = B?  --
-------------------------------------------------------------

Deben ser A ⊆ B y C ⊆ A

------------------------------------------------------------------
-- Exercise 21. Give an example in which (A ∪ C) ∩ (B ∪ C) = {} --
------------------------------------------------------------------

={1,2} interseccion {4,5}

--------------------------------------------------------------------------------
-- Exercise 22. Prove the commutative law of set-intersection, A ∩ B = B ∩ A. --
--------------------------------------------------------------------------------

= x ∈ A ∩ B
= x ∈ A ∧ x ∈ B  --interseccion
= x ∈ B ∩ A 
x ∈ A ∩ B    <=>   x ∈ B ∩ A 
A ∩ B = B ∩ A. 

----------------------------------------------------------------------------------------------------------------------------------------------------
-- Exercise 23. Express the commutative law of set-intersection in terms of the set operations and Boolean operations defined in the Stdm module. --
----------------------------------------------------------------------------------------------------------------------------------------------------

A *** B = B *** A

-----------------------------------------------------------------------------
-- Exercise 24. Prove the associative law of set-union, (A∪B)∪C = A∪(B∪C). --
-----------------------------------------------------------------------------

(A ∪ B) ∪ C
{x |(x ∈ A ∨ x ∈ B) ∨ x ∈ C}
{x|x ∈ A ∨ (x ∈ B ∨ x ∈ C)}
A ∪ (B ∪ C)


--------------------------------------------------------------------------------------------------------------------------------------------------
-- Exercise 25. Prove that the difference between two sets is the intersection of one with the complement of the other, which can be written as A−B =A∩B . --
-------------------------------------------------------------------------------------------------------------------------------------------------

=A − B''  
= {x|x ∈ A ∧ x ∈/ B''}   
= {x|x ∈ A∧ ¬(x ∈ U ∧ x ∈/ B')}  
= {x|x ∈ A∧ ¬(x ∈ U ∧ ¬(x ∈ B'))}
= {x|x ∈ A∧ ¬(x ∈ U ∧ ¬(x ∈ U ∧ x ∈/ B))}  
= {x|x ∈ A∧ ¬(x ∈ U ∧ ¬(x ∈ U ∧ ¬(x ∈ B)))} 
= {x|x ∈ A∧ ¬(x ∈ U ∧ (¬(x ∈ U) ∨ (x ∈ B)))}  
= {x|x ∈ A ∧ (¬(x ∈ U)∨ ¬(¬(x ∈ U) ∨ (x ∈ B)))}
= {x|x ∈ A ∧ (x ∈/ U ∨ (¬¬(x ∈ U)∧ ¬(x ∈ B)))} 
= {x|x ∈ A ∧ (x ∈/ U ∨ (x ∈ U ∧ x ∈/ B))}  
= {x|x ∈ A ∧ (x ∈ U ∧ x ∈/ B)} 
= {x|x ∈ A ∧ x ∈ U − B}
= A ∩ B' 


---------------------------------------------------------------------------------------------------
-- Exercise 26. Prove that union distributes over intersection, A ∪ (B ∩ C) = (A ∪ B) ∩ (A ∪ C). --
---------------------------------------------------------------------------------------------------

= {x|x ∈ A ∨ (x ∈ B ∧ x ∈ C)}
= {x|(x ∈ A ∨ x ∈ B) ∧ (x ∈ A ∨ x ∈ C)}
= (A ∪ B) ∩ (A ∪ C)

---------------------------------------------------------------------------------
-- Exercise 27. Prove DeMorgan’s law for set intersection, (A ∩ B)' = A' ∪ B'. -- -- --
---------------------------------------------------------------------------------
= {x|x ∈ U ∧ x ∈/ (A ∩ B)}  
= {x|x ∈ U ∧ ¬(x ∈ A ∧ x ∈ B)} 
= {x|x ∈ U ∧ (¬(x ∈ A)∨ ¬(x ∈ B))}  
= {x|x ∈ U ∧ (x ∈/ A ∨ x ∈/ B)} 
= {x|(x ∈ U ∧ x ∈/ A) ∨ (x ∈ U ∧ x ∈/ B)}
= {x|(x ∈ U − A) ∨ (x ∈ U − B)} 
= A' ∪ B'