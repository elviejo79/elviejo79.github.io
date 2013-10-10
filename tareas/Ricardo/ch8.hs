import Test.HUnit


-- Data type for Sets
type Set a = [a]


-- Determines whether there are any duplicate elments within its argument.
normalForm :: (Eq a, Show a) => [a] -> Bool

normalForm [] = True

normalForm (x:xs) = if (elem x xs)
                       then
                          False
                       else
                          True && normalForm xs


-- Takes a list and removes any duplicate elements.
normalizeSet :: Eq a => Set a -> Set a

normalizeSet [] = []

normalizeSet (x:xs) = if (elem x xs)
                         then
                            normalizeSet xs
                         else
                            x : normalizeSet xs


-- Sets operations:
--   Union
(+++) :: (Eq a, Show a) => Set a -> Set a -> Set a

(+++) [] [] = []

(+++) xs [] = if normalForm xs
                 then
                    xs
                 else
                    normalizeSet xs

(+++) [] ys = if normalForm ys
                 then
                    ys
                 else
                    normalizeSet ys

(+++) xs ys = if normalForm (xs ++ ys)
                 then
                    xs ++ ys
                 else
                    normalizeSet (xs ++ ys)


--   Intersection
(***) :: (Eq a, Show a) => Set a -> Set a -> Set a

(***) [] [] = []

(***) xs [] = (+++) xs []

(***) [] ys = (+++) [] ys

(***) xs ys = normalizeSet [x | x <- xs, elem x ys]


--   Difference
(~~~) :: (Eq a, Show a) => Set a -> Set a -> Set a

(~~~) [] [] = []

(~~~) xs [] = xs

(~~~) [] ys = ys

(~~~) xs ys = normalizeSet [x | x <- xs, not (elem x ys)]


-- Takes two sets A and B, and returns True if A ⊆ B.
subset :: (Eq a) => Set a -> Set a -> Bool

subset [] [] = True

subset xs [] = False

subset [] ys = False

subset (x:xs) ys = if elem x ys
                      then subset xs ys
                   else
                      False

subset' :: (Eq a) => Set a -> Set a -> Bool
subset' [] ys = True
subset' (x:xs) ys = if elem x ys
                       then subset xs ys
                            else False

-- Returns True if A is a proper subset of B.
properSubset :: (Eq a) => Set a -> Set a -> Bool

properSubset [] [] = False

properSubset xs [] = True

properSubset [] ys = True

properSubset (x:xs) ys = if elem x ys
                            then
                               properSubset xs ys
                            else
                               False


-- Determine whether two sets are the same.
setEq :: (Eq a, Show a) => Set a -> Set a -> Bool

setEq [] [] = True

setEq set1 [] = False

setEq [] set2 = False


{------------------------------------------------------------------------------
Excercise 1
===========
Given the sets A = {1, 2, 3, 4, 5} and B = {2, 4, 6}, calculate the following sets:
    (a) A ∪ (B ∩ A)
    (b) (A ∩ B) ∪ B
    (c) A − B
    (d) (B − A) ∩ B
    (e) A ∪ (B − A)
--}
{--
    (a) {1, 2, 3, 4, 5}
    (b) {2, 4, 6}
    (c) {1, 3, 5}
    (d) {6}
    (e) {1, 2, 3, 4, 5, 6}
--}

{------------------------------------------------------------------------------
Exercise 2.
===========
Work out the values of the following set expressions, and then check your answer using the Haskell expression that follows.
    (a) [1,2,3] +++ [3]
    (b) [4,2] +++ [2,4]
    (c) [1,2,3] *** [3]
    (d) [] *** [1,3,5]
    (e) [1,2,3] ̃̃̃ [3]
    (f) [2,3] ̃̃̃ [1,2,3]
    (g) [1,2,3] *** [1,2]
    (h) [1,2,3] +++ [4,5,6]
    (i) ([4,3] ̃̃̃ [5,4]) *** [1,2]
    (j) ([3,2,4] +++ [4,2])  ̃̃̃ [2,3]
    (k) subset [3,4] [4,5,6]
    (l) subset [1,3] [4,1,3,6]
    (m) subset [] [1,2,3]
    (n) setEq [1,2] [2,1]
    (o) setEq [3,4,6] [2,3,5]
    (p) [1,2,3] ̃̃̃ [1]
    (q) [] ̃̃̃ [1,2]
--}
{--
    (a) [1,2,3]
    (b) [4,2]
    (c) [3]
    (d) []
    (e) [1,2]
    (f) []
    (g) [1,2]
    (h) [1,2,3,4,5,6]
    (i) []
    (j) [4]
    (k) False -- subset [3,4] [4,5,6]
    (l) True -- subset [1,3] [4,1,3,6]
    (m) True -- subset [] [1,2,3]
    (n) True -- setEq [1,2] [2,1]
    (o) False -- setEq [3,4,6] [2,3,5]
    (p) [2,3] -- [1,2,3] ̃̃̃ [1]
    (q) [] -- [] ̃̃̃ [1,2]
--}

{------------------------------------------------------------------------------
Exercise 3.
==========
The function

    powerset :: (Eq a, Show a) => Set a -> Set (Set a)

takes a set and returns its power set. Work out the values of the following expressions:

    powerset [3,2,4]
    powerset [2]
--}
{--
    powerset [3,2,4] => [[],[3],[2],[4],[3,2],[3,4],[2,4],[3,2,4]]
--}

{------------------------------------------------------------------------------
Exercise 4.
===========
The cross product of two sets A and B is defined as

    A × B = {(a, b) | a ∈ A, b ∈ B}

The function

    crossproduct :: (Eq a, Show a, Eq b, Show b) => Set a -> Set b -> Set (a,b)

takes two sets and returns their cross product. Evaluate these expressions:

    crossproduct [1,2,3] [’a’,’b’]
    crossproduct [1] [’a’,’b’]
--}
{--
    crossproduct [1,2,3] [’a’,’b’] => [(1,'a'), (1,'b'), (2,'a'), (2,'b'), (3,'a'), (3,'b')]
    crossproduct [1] [’a’,’b’] => [(1,'a'), (1,'b')]
--}

{------------------------------------------------------------------------------
Exercise 5.
===========
In the following exercise, let u be [1,2,3,4,5,6,7,8,9,10], a be [2,3,4], b be [5,6,7] and c be [1,2]. Give the elements of each set:
    a +++ b
    u ̃̃̃ a *** (b +++ c)
    c ̃̃̃ b
    (a +++ b) +++ c
    u ̃̃̃ a
    u ̃̃̃ (b *** c)
--}
{--
    a +++ b => [2,3,4,5,6,7]
    u ̃̃̃ a *** (b +++ c) => [1,5,6,7,8,9,10] *** [1,2,5,6,7] => [1,5,6,7]
    c ̃̃̃ b => [1,2]
    (a +++ b) +++ c => [2,3,4,5,6,7] +++ [1,2] => [1,2,3,4,5,6,7]
    u ̃̃̃ a => [1,5,6,7,8,9,10]
    u ̃̃̃ (b *** c) => [1,2,3,4,5,6,7,8,9,10] ̃̃̃ [] => [1,2,3,4,5,6,7,8,9,10]
--}


{------------------------------------------------------------------------------
Exercise 6.
===========
What are the elements of the set {x+y | x ∈ {1, 2, 3} ∧ y ∈ {4, 5}}?
--}
{--
    [5,6,7,8]
--}

{------------------------------------------------------------------------------
Exercise 7.
===========
Write and evaluate a list comprehension that expresses the set
    {x | x ∈ {1, 2, 3, 4, 5} ∧ x < 0}
--}
{--
    [x | x <- [1,2..5], x < 0]
--}

{------------------------------------------------------------------------------
Exercise 8.
==========
Write and evaluate a list comprehension that expresses the set
    {x + y | x ∈ {1, 2, 3} ∧ y ∈ {4, 5}}
--}
{--
    [x + y | x <- [1,2,3], y <- [4,5]]
--}

{------------------------------------------------------------------------------
Exercise 9.
==========
Write and evaluate a list comprehension that expresses the set
    {x | x ∈ {1, 2, 3, 4, 5, 6, 7, 8, 9, 10} ∧ even x}
--}
{--
    [x | x <- [1,2..10], x `mod` 2 == 0]
--}

{--
Exercise 10.
==========
What is the value of each of the following expressions?
    subset [1,3,4] [4,3]
    subset [] [2,3,4]
    setEq [2,3] [4,5,6]
    setEq [1,2] [1,2,3]
--}
{--
    subset [1,3,4] [4,3] => False
    subset [] [2,3,4] => True
    setEq [2,3] [4,5,6] => False
    setEq [1,2] [1,2,3] => False
--}

{--
Exercise 11.
==========
Let A, B, and C be sets. Prove that if A ⊂ B and B ⊂ C, then A ⊂ C.
--}
{--
    Proof. Let x be any element of the universe of discourse.
        1. A ⊂ B                  { Premise }
        2. x ∈ A -> x ∈ B         { Def. ⊂ }
        3. B ⊂ C                  { Premise }
        4. x ∈ B -> x ∈ C         { Def. ⊂ }
        5. x ∈ A -> x ∈ C         { Hypothetical syllogism (chain rule), (2), (4) }
        6. ∀ x.x (x ∈ A -> x ∈ C) { ∀ Introduction }
        7. A ⊂ C                  { Def. ⊂ }
--}

{--
Exercise 12.
==========
Consider the following two claims. For each one, if it is true give a proof, but if it is false give a counterexample.
    (a) If A ⊆ B and B ⊆ C, then A ⊂ C.
    (b) If A ⊂ B and B ⊂ C, then A ⊆ C.
--}
{--
    (a) If A ⊆ B and B ⊆ C, then A ⊂ C.
    (b) If A ⊂ B and B ⊂ C, then A ⊆ C.
--}

{--
Exercise 13.
==========
For the following questions, give a proof using set laws, or find a counterexample.
    (a) (A' ∪ B')' ∩ C' = A ∩ (B ∪ C)'
    (b) A − (B ∪ C)' = A ∩ (B ∪ C)
    (c) (A ∩ B) ∪ (A ∩ B') = A
    (d) A ∪ (B − A) = A ∪ B
    (e) A − B = B' − A'
    (f ) A ∩ (B − C) = (A ∩ B) − (A ∩ C)
    (g) A − (B ∪ C) = (A − B) ∩ (A − C)
    (h) A ∩ (A' ∪ B) = A ∩ B
    (i) (A − B') ∪ (A − C') = A ∩ (B ∩ C)
--}


{--
Exercise 14.
==========
The function

    smaller :: Ord a => a -> [a] -> Bool

takes a value and a list of values and returns True if the value is smaller than the first element in the list. Using this function, write a function that takes a set and returns its powerset. Use foldr.
--}
smaller :: Ord a => a -> [a] -> Bool

smaller x [] = False

smaller x set = if x < head set
                   then True
                        else False

powerset :: Ord a => [a] -> [[a]]

powerset [] = []

powerset set = foldr smaller 0 set

{--
Exercise 15.
==========
Prove that (A ∪ B)' = ((A ∪ A') ∩ A') ∩ ((B ∪ B') ∩ B').
--}


{--
Exercise 16.
==========
Using a list comprehension, write a function that takes two sets and returns True if the first is a subset of the other.
--}
{--

--}
isSubset :: Ord => a -> [a] -> [a] -> Bool

isSubset set1 set2 = [] 

{--
Exercise 17.
==========
What is wrong with this definition of diff, a function that takes two sets and returns their difference?
    diff :: Eq a => [a] -> [a] -> [a]
    diff set1 set2 = [e | e <- set2, not (elem e set1)]
--}


{--
Exercise 18.
==========
What is wrong with this definition of intersection, a function that takes two sets and returns their intersection?
    intersection :: [a] -> [a] -> [a]
    intersection set1 set2 = [e | e <- set1, e <- set2]
--}


{--
Exercise 19.
==========
Write a function using a list comprehension that takes two sets and returns their union.
--}


{--
Exercise 20.
==========
Is it ever the case that A ∪ (B − C) = B?
--}


{--
Exercise 21.
==========
Give an example in which (A ∪ C) ∩ (B ∪ C) = ∅.
--}


{--
Exercise 22.
==========
Prove the commutative law of set-intersection, A ∩ B = B ∩ A.
--}


{--
Exercise 23.
==========
Express the commutative law of set-intersection in terms of the set operations and Boolean operations defined in the Stdm module.
--}


{--
Exercise 24.
==========
Prove the associative law of set-union, (A∪B)∪C = A∪(B ∪C).
--}


{--
Exercise 25.
==========
Prove that the difference between two sets is the intersection of one with the complement of the other, which can be written as
    A−B =A∩B'.
--}


{--
Exercise 26.
==========
Prove that union distributes over intersection,
    A ∪ (B ∩ C) = (A ∪ B) ∩ (A ∪ C).
--}


{--
Exercise 27.
==========
Prove DeMorgan’s law for set intersection, (A ∩ B)' = A' ∪ B'.
--}


-- Tests
normalFormTest = ["" ~: False ~=? normalForm [1,1,2,3]]

normalizeSetTest = ["" ~: [1,2,3,4] ~=? normalizeSet [1,1,2,2,2,3,3,3,4,4]]

unionTest1 = ["" ~: [1,2,3,4] ~=? (+++) [1,2,3,4] []]
unionTest2 = ["" ~: [1,2,3,4] ~=? (+++) [] [1,2,3,4,4]]
unionTest3 = ["" ~: [1,2,3,4] ~=? (+++) [1,2,3] [3,3,4,4]]

intersectionTest1 = ["" ~: [1,2] ~=? (***) [1,2,3,4] [1,2,5,6]]
intersectionTest2 = ["" ~: [1,8] ~=? (***) [1,1,2,3,8] [1,8,0,8]]

differenceTest1 = ["" ~: [5,6] ~=? (~~~) [1,2,5,6] [2,1]]

subsetTest1 = ["" ~: True ~=? subset [1,2,3] [1,2,3]]

properSubsetTest1 = ["" ~: True ~=? properSubset [1,2,3,4] [1,2,3,4,5]]
properSubsetTest2 = ["" ~: False ~=? properSubset [1,2,3,4] [1,2,3,4]]


-- Tests execution
tests = test (
--     normalizeSetTest ++
--     normalFormTest ++
--     unionTest1 ++
--     unionTest2 ++
--     unionTest3
--  intersectionTest1 ++
--  intersectionTest2
--  differenceTest1
  subsetTest1
--    properSubsetTest1 ++
--      properSubsetTest2
  )
