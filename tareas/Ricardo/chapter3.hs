import Test.HUnit

{------------------------------------------------------------------------------------------
Exercise 1.
Write a recursive function copy :: [a] -> [a] that copies its list argument.
For example, copy [2] ⇒[2].
--}

copy :: [a] -> [a]
copy [] = []
copy (x : xs) = x : copy (xs)

-- Test cases
t1 = ["copy [2,3] lista con algo" ~: [2, 3] ~=? (copy [2, 3])
      ,"copy [1] lista con un elemento" ~: [1] ~=? (copy [1])]




{------------------------------------------------------------------------------------------
Exercise 2.
Write a function inverse that takes a list of pairs and swaps the pair elements.
For example,
    inverse [(1,2),(3,4)] ==> [(2,1),(4,3)]
--}

inversePairs :: [(a, a)] -> [(a, a)]
inversePairs [] = []
inversePairs (x : xs) = [(snd x, fst x)] ++ inversePairs xs

-- Test cases
t2 = ["inversePairs [(1, 2), (3, 4)]" ~: [(2, 1), (4, 3)] ~=? (inversePairs [(1, 2), (3, 4)])]




{------------------------------------------------------------------------------------------
Exercise 3.
Write a function
merge :: Ord a => [a] -> [a] -> [a]
which takes two sorted lists and returns a sorted list containing the elements of each.
--}

merge :: Ord a => [a] -> [a] -> [a]
merge [] [] = []
merge xs [] = xs
merge [] ys = ys
merge (x : xs) (y : ys) = if x < y then x : merge xs (y : ys) else y : merge (x : xs) ys

-- Test cases
t3 =  ["merge [2, 4, 6] [1, 3, 5]" ~: [1, 2, 3, 4, 5, 6] ~=? (merge [2, 4, 6] [1, 3, 5])]




{------------------------------------------------------------------------------------------
Exercise 4.
Write (!!), a function that takes a natural number n and a list
and selects the nth element of the list. List elements are indexed from
0, not 1, and since the type of the incoming number does not prevent it
from being out of range, the result should be a Maybe type. For example,
    [1, 2, 3] !! 0 ==> Just 1
    [1, 2, 3] !! 2 ==> Just 3
    [1, 2, 3] !! 5 ==> Nothing
--}

(!!!):: Int -> [a] -> Maybe a
(!!!) n [] = Nothing
(!!!) 0 (x : xs) = Just x
(!!!) n (x : xs) = (!!!) (n - 1) xs

-- Test cases
t4 = ["Excercise 4" ~: "[1, 2, 3] !! 0" ~: Just 1 ~=? ((!!!) 0 [1, 2, 3])
     ,  "[1, 2, 3] !! 2" ~: Just 3 ~=? ((!!!) 2 [1, 2, 3])
     ,  "[1, 2, 3] !! 5" ~: Nothing ~=? ((!!!) 5 [1, 2, 3])]



{-------------------------------------------------------------------------------------------
Exercise 5.
Write a function lookup that takes a value and a list of pairs, and returns the
second element of the pair that has the value as its first element. Use a Maybe
type to indicate whether the lookup succeeded.
For example,
    lookup 5 [(1, 2), (5, 3)] ==> Just 3
    lookup 6 [(1, 2), (5, 3)] ==> Nothing
--}

lookup' :: Int -> [(Int, Int)]-> Maybe Int
lookup' e [] = Nothing
lookup' e ((a, b) : as) = if a == e then Just b else lookup' e as

-- Test cases
t5 = ["lookup' 5 [(1, 2), (5, 3)]" ~: Just 3 ~=? (lookup' 5 [(1, 2), (5, 3)])
     , "lookup' 6 [(1, 2),(5, 3)]" ~: Nothing ~=? (lookup' 6 [(1, 2), (5, 3)])]




{-------------------------------------------------------------------------------------------
Exercise 6.
Write a function that counts the number of times an element appears in a list.
--}

timesInList :: Eq a => a -> [a] -> Int
timesInList e [] =  0
timesInList e (x : xs) = if e == x then 1 + timesInList e xs else 0 + timesInList e xs

-- Test cases
t6 = ["timesInsList 2 [1, 2, 3, 2, 2, 2]" ~: 4 ~=? (timesInList 2 [1, 2, 3, 2, 2, 2])]




{-------------------------------------------------------------------------------------------
Exercise 7.
Write a function that takes a value e and a list of values xs and
removes all occurrences of e from xs.
--}

removeFromList :: Eq a => a -> [a] -> [a]
removeFromList e [] = []
removeFromList e (x : xs) = if x == e
                                then removeFromList e xs
                                else x : removeFromList e xs

-- Test cases
t7 = ["removeFromList 2 [1, 2, 3, 2, 2, 2]" ~: [1, 3] ~=? (removeFromList 2 [1, 2, 3, 2, 2, 2])]




{-------------------------------------------------------------------------------------------
Exercise 8.
Write a function
    f :: [a] -> [a]
that removes alternating elements of its list argument, starting with the
first one. For examples, f [1, 2, 3, 4, 5, 6, 7] returns [2, 4, 6].
--}

f :: [a] -> [a]
f [] = []
f (x : xs) = fa xs

fa :: [a] -> [a]
fa [] = []
fa (x : xs) = x : f xs

-- Test cases
t8 = ["f [1, 2, 3, 4, 5, 6, 7]" ~: [2, 4, 6] ~=? (f [1, 2, 3, 4, 5, 6, 7])]



{------------------------------------------------------------------------------------------------
Exercise 9.
Write a function extract :: [Maybe a] -> [a] that takes a
list of Maybe values and returns the elements they contain. For example,
    extract [Just 3, Nothing, Just 7] = [3, 7].
--}

extract :: [Maybe a] -> [a]
extract [] = []
extract (Nothing : xs) = extract xs
extract (Just x : xs) = x : extract xs

-- Test cases
t9 = ["extract [Just 3, Nothing, Just 7]" ~: [3, 7] ~=? (extract [Just 3, Nothing, Just 7])]




{------------------------------------------------------------------------------------------------
Exercise 10.
Write a function
    f :: String -> String -> Maybe Int
that takes two strings. If the second string appears within the first, it
returns the index identifying where it starts. Indexes start from 0. For
example,
    f "abcde" "bc" ==> Just 1
    f "abcde" "fg" ==> Nothing
--}

f10 :: String -> String -> Maybe Int
f10 "" "" = Just 0
f10 xs "" = Just 0
f10 [] y = Just 0
f10 (x : xs) (y : ys) = if (x == y)
                          then
                              f10 xs ys
                          else
                              f10 xs (y : ys)
                              
-- Test cases
t10 = ["f10 \"abcde\" \"bc\"" ~: Just 1 ~=? (f10 "abcde" "bc")
      , "f10 \"abcde\" \"fg\"" ~: Nothing ~=? (f10 "abcde" "fg")]




{---------------------------------------------------------------------------------------
Exercise 11.
Write foldrWith, a function that behaves like foldr except
that it takes a function of three arguments and two lists.
--}

foldrWith :: (a -> b -> c -> c) -> c -> [a] -> [b] -> c
foldrWith f z [] [] = z
foldrWith f z (x : xs) (y : ys) = f x y (foldrWith f z xs ys)

-- Test cases
t11 = ["(foldrWith (\\p q acc -> p+q + acc ) 0 [1, 1] [2, 2])"
       ~: 6 ~=? (foldrWith (\p q acc -> p + q + acc ) 0 [1, 1] [2, 2])]




{------------------------------------------------------------------------------------------
Exercise 12.
Using foldr, write a function mappend such that mappend f xs = concat (map f xs)
--}
{--
mappend :: (a -> [b]) -> [a] -> [b] 
mappend f [] = []
mappend f xs = f xs

-- Test cases
t12 = ["(mappend (++!) \"bla\")" ~: "b!l!a!" ~=? (mappend (++"!") ["b","l","a"])]
--}



{------------------------------------------------------------------------------------------
Exercise 13.
Write removeDuplicates, a function that takes a list and re-
moves all of its duplicate elements.
--}

removeDuplicates :: Eq a => [a] -> [a]
removeDuplicates [] = []
removeDuplicates (x : xs) = if (elem x xs)
                            then removeDuplicates xs
                            else x : removeDuplicates xs

-- Test cases
t13 = ["removeDuplicates [1,9,9,2,7,7,7,3]"~: [1,9,2,7,3] ~=? (removeDuplicates [1,9,9,2,7,7,7,3])]




{------------------------------------------------------------------------------------------
Exercise 14.
Write a recursive function that takes a value and a list of values and returns
True if the value is in the list and False otherwise.
--}

f14 :: Eq a => a -> [a] -> Bool
f14 x [] = False
f14 x (y : ys) = False || if (x == y)
                            then
                              True
                           else
                              f14 x ys

-- Test cases
t14 = ["f14 'b' \"abc\" "~: True ~=? (f14 'b' "abc")]



{-------------------------------------------------------------------------------------------
Exercise 15.
Write a function that takes two lists, and returns a list of values that appear in both lists.
The function should have type
    intersection :: Eq a => [a] -> [a] -> [a].
(This is one way to implement the intersection operation on sets; see Chapter 8.)
--}

intersection :: Eq a => [a] -> [a] -> [a]
intersection [] bs = []
intersection as [] = []
intersection (a:as) bs = if (elem a bs) then a:intersection as bs else intersection as bs

-- Test cases
t15 = ["(intersection \"abcde\" \"defgh\")"~: ['d','e'] ~=? (intersection "abcde" "defgh")]




{------------------------------------------------------------------------------------------
Exercise 16.
Write a function that takes two lists, and returns True if all the
elements of the first list also occur in the other. The function should have type
isSubset :: Eq a => [a] -> [a] -> Bool.
(This is one way to determine whether one set is a subset of another; see Chapter 8.)
--}

isSubset :: Eq a => [a] -> [a] -> Bool
isSubset [] [] = True

-- Test cases
t16 = ["(isSubset [2,4] [1,2,3,4,5])" ~: True ~=? (isSubset [2,4] [1,2,3,4,5])]



{------------------------------------------------------------------------------------------
Exercise 17.
Write a recursive function that determines whether a list is sorted.
--}

isSorted :: Ord a => [a] -> Bool
isSorted [] = True
isSorted (a:b:as) = if a < b then True && isSorted (b:as) else False
isSorted a = True

-- Test cases
t17 = ["isSorted [1,3,2,4]" ~: False ~=? (isSorted [1,3,2,4])
      , "isSorted [1,2,3,4]" ~: True ~=? (isSorted [1,2,3,4]) ]



{-----------------------------------------------------------------------------------------
Exercise 18.
Show that the definition of factorial using foldr always produces
the same result as the recursive definition given in the previous section
--}
--t18 = ["" ~: ~=? (factorial)]




{----------------------------------------------------------------------------------------
Exercise 19.
Using recursion, define last, a function that takes a list and
returns a Maybe type that is Nothing if the list is empty.
--}

isNothing :: Maybe a -> Bool
isNothing Nothing = True
isNothing (Just a) = False

flast :: Eq a => [a]-> Maybe a
flast [] = Nothing
flast (x:xs) = if xs == [] then Just x else flast xs

-- Test cases
t19 = ["flast [1,2,3] regresa " ~: Just 3 ~=? (flast [1.0,2,3]) ]




{------------------------------------------------------------------------------------------
Exercise 20.
Using recursion, write two functions that expect a string containing
a number that contains a decimal point (for example, 23.455).
The first function returns the whole part of the number (i.e., the part to
the left of the decimal point). The second function returns the fractional
part (the part to the right of the decimal point).
--}

wholePart :: String -> String
wholePart ns = ""

fractionPart :: String -> String
fractionPart ns = ""

-- Test cases
t20 = ["wholePart \"23.455\""~: "23"
       ~=? (wholePart "23.455"),"fractionPart \"23.455\""~: "455" ~=? (fractionPart "23.455")]





{--------------------------------------------------------------------------------------------
Run all tests
------}

tests = test (t1 ++ t2 ++ t3 ++ t4 ++ t5 ++ t6 ++ t7 ++ t8 ++ t9 ++ t11 ++ t13
             ++ t15 ++ t17 ++ t19) {--t10)--} -- ++t13 ++ t15 ++ t17 ++ t19
--        ++ t2 ++ t3 ++ t4 ++ t5 ++ t6 ++ t7 ++ t8
  --      ++ t9++t10++t11++t12++t13++t14 ++ t15 ++ t16 ++ t17 ++ t20)
