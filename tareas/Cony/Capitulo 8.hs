--Exercise 1. Given the sets A = {1, 2, 3, 4, 5} and B = {2, 4, 6}, calculate the
--following sets:
--(a) A U (B U A)
--(b) (A ∩ B) ∪ B
--(c) A − B
--(d) (B − A) ∩ B
--(e) A ∪ (B − A)


-- a)   (B ∩ A) = A {1, 2, 3, 4, 5} ∩ B = {2, 4, 6} = {2,4}
-- 		A U (B ∩  A)= {2,4} U {1,2,3,4,5} ={1,2,3,4,5}

-- b) (A ∩ B)  =  A {1, 2, 3, 4, 5} ∩ B = {2, 4, 6} = {2,4}
--	   (A ∩ B) ∪ B =  {2,4} U {2,4,6} ={2,4,6}

--(c) A − B = A {1, 2, 3, 4, 5} - B = {2, 4, 6} = {1,3,5}


-- (d) (B − A) = {2,4,6}- {1,2,3,4,5}= {6} 
	--(B − A) ∩ B  ={6} ∩ {2,4,6} = {}


-- (e) (B − A) = {2,4,6}- {1,2,3,4,5}= {6} 
-- A ∪ (B − A) ={1,2,3,4,5} U {6} = {1,2,3,4,5,6}


--Exercise 2. Work out the values of the following set expressions, and then
--check your answer using the Haskell expression that follows.
--(a) [1,2,3] +++ [3]
--(b) [4,2] +++ [2,4]
--(c) [1,2,3] *** [3]
--(d) [] *** [1,3,5]
--(e) [1,2,3] ˜˜˜ [3]
--(f) [2,3] ˜˜˜ [1,2,3]
--(g) [1,2,3] *** [1,2]
--(h) [1,2,3] +++ [4,5,6]
--(i) ([4,3] ˜˜˜ [5,4]) *** [1,2]
--(j) ([3,2,4] +++ [4,2]) ˜˜˜ [2,3]
--(k) subset [3,4] [4,5,6]
--(l) subset [1,3] [4,1,3,6]
--(m) subset [] [1,2,3]
--(n) setEq [1,2] [2,1]
--(o) setEq [3,4,6] [2,3,5]
--(p) [1,2,3] ˜˜˜ [1]
--(q) [] ˜˜˜ [1,2]

--a) [1,2,3]
--b) [2,4]
--c) [3]
--d) []
--e) [1,2]
--f) []
--g) [1,2]
--h) [1,2,3,4,5,6]
--i) [3]***[1,2] = []
--j) [2,3,4]
--k) True 
--l) True 
--(m) True
--(n) True
--(o) False
--(p) [2,3] 
--(q) []
 

--Exercise 3. The function
--powerset :: (Eq a, Show a) => Set a -> Set (Set a)

--takes a set and returns its power set. Work out the values of the following
--expressions:
--powerset [3,2,4] = {0,{3},{2},{4},{3,2},{3,4},{3,2,4}}
--powerset [2] = {0,{2}}


--Exercise 4. The cross product of two sets A and B is defined as
--A × B = {(a, b) | a ∈ A, b ∈ B}
--The function
--crossproduct :: (Eq a, Show a, Eq b, Show b) =>
--Set a -> Set b -> Set (a,b)
--takes two sets and returns their cross product. Evaluate these expressions:
--crossproduct [1,2,3] [’a’,’b’] = 
--crossproduct [1] [’a’,’b’]


--Exercise 5. In the following exercise, let u be [1,2,3,4,5,6,7,8,9,10], a
--be [2,3,4], b be [5,6,7] and c be [1,2]. Give the elements of each set:


--a +++ b = [2,3,4,5,6,7]

--u˜˜˜a *** (b +++ c) =  [1,5,6,7]

		--(b +++ c) = [1,2,5,6,7]
		--u˜˜˜a     = [1,5,6,7,8,9,10]


-- c ˜˜˜ b =  [1,2]

--(a +++ b) +++ c = [2,3,4,5,6,7] +++ [1,2] =[1,2,3,4,5,6,7]

--u˜˜˜a = [1,5,6,7,8,9,10]

--u˜˜˜(b *** c) = [1,2,3,4,5,6,7,8,9,10] ˜˜˜ [] = [1,2,3,4,5,6,7,8,9,10]





--Exercise 6. What are the elements of the set {x+y | x ∈ {1, 2, 3}∧y ∈ {4, 5}}?

		--[1,2,3,4,5]

--Exercise 7. Write and evaluate a list comprehension that expresses the set
--{x |x ∈ {1, 2, 3, 4, 5} ∧x < 0}

		--	[x| x <- [1,2,3,4,5] , x < 0] = []


--Exercise 8. Write and evaluate a list comprehension that expresses the set
--{x + y |x ∈ {1, 2, 3} ∧ y ∈ {4, 5}}
		-- [x+y | x <-{1,2,3}, y{4,5}] =  []


--Exercise 9. Write and evaluate a list comprehension that expresses the set
--{x |x ∈ {1, 2, 3, 4, 5, 6, 7, 8, 9, 10} ∧ even x} =[2,4,6,8,10]


--Exercise 10. What is the value of each of the following expressions?
--subset [1,3,4] [4,3] = True
--subset [] [2,3,4] = True
--setEq [2,3] [4,5,6] = False
--setEq [1,2] [1,2,3] = False

--Exercise 11. Let A, B, and C be sets. Prove that if A ⊂ B and B ⊂ C, then
--A ⊂ C.
		--1. A C B 				{ Premise }
		--2. x ∈ A → x ∈ B		{ Def. C}
		--3. B C C 				{ Premise }
		--4. x ∈ B → x ∈ C 		{ Def. C }
		--5. x ∈ A → x ∈ C 	    { Hypothetical syllogism (chain rule), (2), (4) }
		--6. ∀x. (x ∈ A → x ∈ C) { ∀ introduction }
		--7. A C C


--Exercise 12. Consider the following two claims. For each one, if it is true
--give a proof, but if it is false give a counterexample.
--(a) If A ⊆ B and B ⊆ C, then A ⊂ C.

	--
--(b) If A ⊂ B and B ⊂ C, then A ⊆ C.


--Exercise 13. For the following questions, give a proof using set laws, or find
--a counterexample.
--(a) (A´ ∪ B)´ ∩ C´ = A ∩ (B ∪ C)´
-- =(A´U B)´ ∪ C´ 
-- =(A ∪ B´) ∪ C´
-- =A ∪ (B´ ∪ C´)
-- = A ∪( B ∪ C)´


--(b) A − (B U C)´ = A ∩ (B U C)
-- A - (B´ ∪ C´)
-- A ∩ (B´∩ C´)´
--A ∩ (B U C)

--(c) (A ∩ B) U (A ∩ B´) = A
--

--(d) A U (B − A) = A ∪ B
-- A U( B ∩ A´) 
-- (A U B) ∩ (A U A´)
--(A ∩ B) ∩ U
-- A ∩ B



--(e) A − B = B´ − A´
--A ∩ B´
--


--(f) A ∩ (B − C) = (A ∩ B) − (A ∩ C)
--  (A ∩ B) − (A ∩ C)
-- 


--(g) A − (B ∪ C) = (A − B) ∩ (A − C)


--(h) A ∩ (A´ ∪ B) = A ∩ B


--(i) (A − B´) ∪ (A − C´) = A ∩ (B ∩ C)


--Exercise 15. Prove that 
--(A U B)´ = ((A U A´) ∩ A´) ∩ ((B UB´) ∩ B´).
-- =((U) ∪ A´) ∪ ((U) ∪ B´)
--=A´ ∪ B´
--=(A U B)´

--Exercise 19. Write a function using a list comprehension that takes two sets
--and returns their union.


--Exercise 20. Is it ever the case that A U (B − C) = B?
-- A U (B ∪ C´)
--(A U B) ∪ (A U C´)
--

--Exercise 21. Give an example in which (A ∪ C) ∩ (B ∪ C) = ∅.
