

type Set a = [a]

quicksort :: (Eq a, Show a, Ord a) => Set a -> Set a
quicksort [] = []
quicksort (splitter:xs) =
	quicksort [y | y <- xs, y < splitter]
	++ [splitter]
	++ quicksort [y | y <- xs, y >= splitter]

normalForm :: (Eq a, Show a) => [a] -> Bool
normalForm [] = True
normalForm (x:xs) = if (elem x xs) then False else normalForm xs

{-
normalizeSet_foldr :: Eq a => Set a -> Set a
normalizeSet_foldr lst = foldr (\c acc -> if (elem c acc) then acc else c:acc) [last lst] lst
-}

normalizeSet :: Eq a => Set a -> Set a
normalizeSet [] = []
normalizeSet lst = foldl (\acc c -> if (elem c acc) then acc else acc ++ [c]) [head lst] lst

--A+++B = A union B
--A***B = A intersección B
--A~~~B = A - B diferencia

(+++) :: (Eq a, Show a) => Set a -> Set a -> Set a
(+++) a b = normalizeSet (a++b)

(***) :: (Eq a, Show a, Ord a) => Set a -> Set a -> Set a
(***) a b = intersection (quicksort(normalizeSet (a))) (quicksort(normalizeSet (b)))

intersection :: (Eq a, Show a) => Set a -> Set a -> Set a
intersection xs [] = []
intersection [] ys = []
intersection (x:xs) (y:ys) = if (elem x (y:ys)) then x:(intersection xs ys) else (intersection xs (y:ys)) 

(~~~) :: (Eq a, Show a, Ord a) => Set a -> Set a -> Set a
(~~~) a b = diference (quicksort(normalizeSet a)) (quicksort(normalizeSet b))

diference :: (Eq a, Show a) => Set a -> Set a -> Set a
diference xs [] = xs
diference [] ys = []
diference (x:xs) (ys) = if (elem x ys) then diference xs ys else x:(diference xs ys)

subset, properSubset, setEq :: (Eq a, Show a, Ord a) => Set a -> Set a -> Bool
subset a b = isSubset (quicksort(normalizeSet a)) (quicksort(normalizeSet b)) && (length (normalizeSet a) <= length (normalizeSet b))

properSubset a b = isSubset (quicksort(normalizeSet a)) (quicksort(normalizeSet b)) && (setEq a b == False)

isSubset :: (Eq a, Show a) => Set a -> Set a -> Bool
isSubset [] (ys) = True
isSubset (x:xs) (ys) = if (elem x ys) then isSubset xs ys else False --elem x ys && isSubset xs ys else (elem x ys || isSubset xs ys)

setEq a b = (subset a b) && (subset b a)

{-Exercise 3. The function
powerset :: (Eq a, Show a) => Set a -> Set (Set a)
takes a set and returns its power set. Work out the values of the following
expressions:
powerset [3,2,4]
powerset [2]
-}

powerset :: (Eq a, Show a) => Set a -> Set (Set a)
powerset [] = [[]]
powerset lst = foldr (\x acc -> acc ++ (map (x:) acc)) [[]] lst


{--Exercise 4. The cross product of two sets A and B is defined as
A × B = {(a, b) | a ∈ A, b ∈ B} The function
crossproduct :: (Eq a, Show a, Eq b, Show b) =>
Set a -> Set b -> Set (a,b)
takes two sets and returns their cross product. Evaluate these expressions:
crossproduct [1,2,3] [’a’,’b’]
crossproduct [1] [’a’,’b’]
-}

crossProduct :: (Eq a, Show a, Eq b, Show b) => Set a -> Set b -> Set (a,b)
crossProduct (x:xs) (ys) = if (xs /= []) then func x ys ++ crossProduct xs ys else func x ys

func x [] = []
func (x) (y:ys) = (x,y) : func x ys

{--Exercise 5. In the following exercise, let u be [1,2,3,4,5,6,7,8,9,10], a
be [2,3,4], b be [5,6,7] and c be [1,2]. Give the elements of each set:
		a +++ b
		u˜˜˜a *** (b +++ c)
		c ˜˜˜ b
		(a +++ b) +++ c
		u˜˜˜a
		u˜˜˜(b *** c)
1. [2,3,4,5,6,7]
2. [1,5,6,7]
3. [1,2]
4. [2,3,4,5,6,7,1]
5. [1,5,6,7,8,9,10]
6. [1,2,3,4,5,6,7,8,9,10]

--Exercise 6. What are the elements of the set {x+y | x <pertenece> {1, 2, 3} ^ y <pertence> {4, 5}}?
[5,6,7,8]
-}
ex6 = normalizeSet ([x + y | x <- [1,2,3], y <- [4,5]])

{--Exercise 7. Write and evaluate a list comprehension that expresses the set
{x |x <pertenece> {1, 2, 3, 4, 5} ^ x < 0}
[]
-}
ex7 = normalizeSet ([x | x <- [1,2,3,4,5], x < 0])

{--Exercise 8. Write and evaluate a list comprehension that expresses the set
{x + y |x <pertence> {1, 2, 3} ^ y pertenece {4, 5}}
[]
para la lista ver el ejercicio 6
-}

{--Exercise 9. Write and evaluate a list comprehension that expresses the set
{x |x <pertenece> {1, 2, 3, 4, 5, 6, 7, 8, 9, 10} ^ even x}
[2,4,6,8,10]
-}
ex9 = normalizeSet ([x | x <- [1,2,3,4,5,6,7,8,9,10], mod x 2 == 0])


{--Exercise 19. Write a function using a list comprehension that takes two sets
and returns their union.
-}
union :: (Eq a, Show a) => [a] -> [a] -> [a]
union a b = normalizeSet(a ++ [x | x <-b])
--union set1 set2 = set1 ++ [e|e <- set2, e ‘elem‘ set2]


{--Exercise 10. What is the value of each of the following expressions?
	subset [1,3,4] [4,3] = False dependiendo de la definición por que puede ser verdadero
	subset [] [2,3,4] = False dependiendo de la definición por que puede ser verdadero
	setEq [2,3] [4,5,6] = False
	setEq [1,2] [1,2,3] = False
-}

{-



serEq :: (Eq a, Show a) => Set a -> Set a -> Bool

complement s = universe ~~~ s

-}