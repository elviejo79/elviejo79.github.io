--Exercise 1. Given the sets A = {1, 2, 3, 4, 5} and B = {2, 4, 6}, calculate the
--following sets:
--(a) A ∪ (B n A) = {1,2,3,4,5}
--(b) (A n B) ∪ B = {2,4,6}
--(c) A - B = {1,3,5}
--(d) (B - A) n B = {6}
--(e) A ∪ (B - A) = {1,2,3,4,5,6}

--Exercise 2. Work out the values of the following set expressions, and then
--check your answer using the Haskell expression that follows.
--(a) [1,2,3] +++ [3] = [1,2,3]
--(b) [4,2] +++ [2,4] = [2,4]
--(c) [1,2,3] *** [3] = [3]
--(d) [] *** [1,3,5] = []
--(e) [1,2,3] ˜˜˜ [3] = [1,2]
--(f ) [2,3] ˜˜˜ [1,2,3] = []
--(g) [1,2,3] *** [1,2] = [1,2]
--(h) [1,2,3] +++ [4,5,6] = [1,2,3,4,5,6]
--(i) ([4,3] ˜˜˜ [5,4]) *** [1,2] = []
--(j) ([3,2,4] +++ [4,2]) ˜˜˜ [2,3] = [4]
--(k) subset [3,4] [4,5,6] = False
--(l) subset [1,3] [4,1,3,6] = True
--(m) subset [] [1,2,3] = True
--(n) setEq [1,2] [2,1] = True
--(o) setEq [3,4,6] [2,3,5] = False
--(p) [1,2,3] ˜˜˜ [1] = [2,3]
--(q) [] ˜˜˜ [1,2] = []
type Set a=[a]
union :: Eq a => Set a -> Set a -> Set a
union xs ys = foldr agregar xs ys where agregar new acc = if new `elem` acc then acc else new : acc

intersection :: Eq a => Set a -> Set a -> Set a
intersection xs = foldr intersect []
          where intersect new acc = if new `elem` xs then new:acc else acc

difference :: Eq a => Set a -> Set a -> Set a
difference xs ys = foldr diff [] xs
        where diff new acc = if new `elem` ys then acc else new:acc
 

--Exercise 3. The function
--powerset :: (Eq a, Show a) => Set a -> Set (Set a)
--takes a set and returns its power set. Work out the values of the following
--expressions:
--powerset [3,2,4] = [[],[4],[2],[2,4],[3],[3,4],[3,2],[3,2,4]] 
--powerset [2] = [[],[2]]

powerset :: Eq a => Set a -> [Set a]
powerset [] = [[]]
powerset (x:xs) = xss ++ map (x:) xss where xss = powerset xs

--Exercise 4. The cross product of two sets A and B is deﬁned as
--A × B = {(a, b) | a ∈ A, b ∈ B}

crossproduct :: (Eq a, Show a, Eq b, Show b) => Set a -> Set b -> Set (a,b)
crossproduct xs ys = [(a,b) | a <- xs, b <- ys]

--Exercise 5. In the following exercise, let u be [1,2,3,4,5,6,7,8,9,10], a
--be [2,3,4], b be [5,6,7] and c be [1,2]. Give the elements of each set:
--a +++ b = [2,3,4,5,6,7]
--u˜˜˜a *** (b +++ c) = [1,3,4,5,6,7,8,9,10]
--c ˜˜˜ b = [1,2]
--(a +++ b) +++ c = [1,2,3,4,5,6,7]
--u˜˜˜a = [1,5,6,7,8,9,10]
--u˜˜˜(b *** c) = [1,2,3,4,5,6,7,8,9,10]

--Exercise 6. What are the elements of the set {x+y | x ∈{1, 2, 3}∧y ∈{4, 5}}
--[x+y| x<-[1,2,3], y <-[4,5]]

--[5,6,6,7,7,8]

--Exercise 7. Write and evaluate a list comprehension that expresses the set
--{x |x ∈{1, 2, 3, 4, 5}∧x<0}
--Main> [x |x <- [1,2,3,4,5],x < 0]
-- = []

--Exercise 8. Write and evaluate a list comprehension that expresses the set
--{x + y |x ∈{1, 2, 3}∧y ∈{4, 5}}

--Main> [x + y |x <-[1, 2, 3],y<- [4, 5]]
-- = [5,6,6,7,7,8]

--Exercise 9. Write and evaluate a list comprehension that expresses the set
--{x |x ∈{1, 2, 3, 4, 5, 6, 7, 8, 9, 10}∧even x}

--Main> [x |x <-[1, 2, 3, 4, 5, 6, 7, 8, 9, 10],x `mod` 2 == 0]
-- =[2,4,6,8,10]

--Exercise 10. What is the value of each of the following expressions?

subset :: (Eq a)=> [a] -> [a] -> Bool
subset xs ys = and [elem x ys | x <- xs]

setEq :: (Eq a) => [a] -> [a] -> Bool
setEq xs ys = subset xs ys && subset ys xs 
--subset [1,3,4] [4,3] = False
--subset [] [2,3,4] = True
--setEq [2,3] [4,5,6] = False
--setEq [1,2] [1,2,3] = False

--Exercise 11. Let A, B,andC be sets. Prove that if A ⊂ B and B ⊂ C,then A ⊂ C.
--A ⊂ B {premise}
--x ∈ B -> x ∈ B && A /=B {def ⊂}
----x ∈ B -> c ∈ C && B /= C {def ⊂}
--B ⊂ C {premise}

--Exercise 12. Consider the following two claims. 
--For each one, if it is true
--give a proof, but if it is false give a counterexample.
--(a) If A ⊆ B and B ⊆ C,thenA ⊂ C.
--(b) If A ⊂ B and B ⊂ C,thenA ⊆ C.

--Exercise 13.For the following questions, give a proof using set laws, or find
--a counterexample.
--(a) (A'∪B)'∩C'=A∩(B∪C)'
 --   (A'' ∩ B') ^ C' {de morgan}
  --  (A ∩ B') ∩ C' {doble complemento}
  --  A ∩ (B' ∩ C') {asociatividad}
   -- A ∩ (B ∪ C)' {de morgan}

--(b) A−(B∪C)'=A∩(B∪C)
  --  A∩(B∪C)'' {A−B=A∩B'}
--    A∩(B∪C) {A=A''}

--(c) (A∩B)∪(A∩B')=A
--	A ∩ (B∪B')=  {Distributiva}
--	A ∩ U {definicion 24}
--	A {identidad A∩U=A}

--(d) A∪(B−A)=A∪B
--	A∪(B∩A') {def A−B=A∩B'}
--	(A∪B)∩(A∪A') {def distributiva A∪(B∩C)=(A∪B)∩(A∪C)}
--	(A∪B)∩ U   {definicion 24 Universo}
--	A∪B=A∪B {definición identidad A∩U=A}

--(e) A−B=B'−A
--	A ∩ B'=B'−A    {def A−B=A∩B' izq}
--	A ∩ B'=B'∩ A'' {def A−B=A∩B' der}
--	A ∩ B'=B'∩ A {def A=A'' doble compl}

--(f ) A∩(B−C)=(A∩B)−(A∩C)


--(g) A−(B∪C)=(A−B)∩(A−C)
--	A∩(B∪C)'=(A−B)∩(A−C) {def A−B=A∩B'}
--	A∩(B'∩C')=(A−B)∩(A−C) {def DeMorgan (A∪B)'=A'∩B'}
	

--(h) A ∩(A'∪B)=A ∩ B
 --(A ∩ A ) ∪ (A ∩ B)
 --[] ∪ (A ∩ B)
 --A ∩ B


--(i) (A−B')∪(A−C')=A∩(B∩C)
--(A ∩ B) ∪ (A ∩ C
--(A ∩ B) ∪ (A ∩ C
-- A ∩ (B ∪ C)


--Exercise 14. The function
--smaller :: Ord a => a -> [a] -> Bool
--takes a value and a list of values and returns True if the value is smaller
--than the ﬁrst element in the list. Using this function, write a function
--that takes a set and returns its powerset. Use foldr.

smaller :: Ord a => a -> [a] -> Bool
smaller x [] = True
smaller x (y:xs) = x < y
 
 
powerset_ :: (Eq a, Ord a) => [a] -> [[a]]
powerset_ = foldr un [[]]
              where un new acc = [new:x | x <- acc, new `smaller` x, not (new `elem` x)] ++ acc


--Exercise 15. Prove that (A ∪ B)' =((A ∪ A') ∩ A') ∩ ((B ∪ B') ∩ B')

--Exercise 16. Using a list comprehension, write a function that takes two sets
--and returns True if the ﬁrst is a subset of the other.

subset_ :: Eq a => [a] -> [a] -> Bool
subset_ xs ys = and [x `elem` ys | x <- xs]

--Exercise 17. What is wrong with this deﬁnition of diff, a function that takes
--two sets and returns their diﬀerence?

diff :: Eq a => [a] -> [a] -> [a]
diff set1 set2 = [e|e<-set2, not (elem e set1)]

--EL ORDEN ES INCORRECTO

--Exercise 18. What is wrong with this deﬁnition of intersection, a function
--that takes two sets and returns their intersection?
intersection_ :: [a] -> [a] -> [a]
intersection_ set1 set2 = [e|e<-set1, e <- set2]

-- e vale el conjunto set2, segun el numero de elementos que contenga el conjunto set1

--Exercise 19. Write a function using a list comprehension that takes two sets
--and returns their union.
ejer19 :: Eq a => [a] -> [a] -> [a]
ejer19 set1 set2 = set1 ++ [e | e <- set2, not (elem e set1)]

--Exercise 20. Is it ever the case that A ∪ (B − C)=B

--Si siempre y cuando  B y C tengan los mismos elementos de A

--Exercise 21. Give an example in which (A ∪ C) ∩ (B ∪ C)= []

--ambas interseciones tienen el conjunto C la unica forma seria que C estuviera vacio

--A = [1,8,3]
--B = [9,2]
--C = []

--([1,8,3] U [] ) n ( [9,2] U []) 
--[1,8,3] n [9,2] = []

--Exercise 22. Prove the commutative law of set-intersection, A ∩ B = B ∩ A.

-- x ∈ A ∩ B { Premise }
-- x ∈ A ∧ x ∈ B { Def. ∩}
-- x ∈ B ∧ x ∈ A { Comm. ∧}
-- x ∈ B ∩ A { Def. ∩}
-- ∀x ∈ U.
			--x ∈ A ∩ B ↔ x ∈ B ∩ A {{∀I}}
-- A ∩ B = B ∩ A. { Def. set equality }

--Exercise 23. Express the commutative law of set-intersection in terms of the
--set operations and Boolean operations deﬁned in the Stdm module.

--A *** B = B *** A

--Exercise 24. Prove the associative law of set-union, (A∪B)∪C = A∪(B∪C).
--(A ∪ B) ∪ C =
-- = {x |(x ∈ A ∨ x ∈ B) ∨ x ∈ C}  -- { defn ∪ }
-- = {x|x ∈ A ∨ (x ∈ B ∨ x ∈ C)}   -- { ∨ associative }
-- = A ∪ (B ∪ C)                     -- { defn ∪ }

--Exercise 26. Prove that union distributes over intersection,
--A ∪ (B ∩ C) = (A ∪ B) ∩ (A ∪ C).
--A ∪ (B ∩ C) =    				
-- = {x|x ∈ A ∨ (x ∈ B ∧ x ∈ C)}              -- { defn ∩,∪ }
-- = {x|(x ∈ A ∨ x ∈ B) ∧ (x ∈ A ∨ x ∈ C)}   -- { ∨ over ∧ }
-- = (A ∪ B) ∩ (A ∪ C)                           -- { def . ∩, ∪ }
