--Exercise 2
exercise2::[(a,b)]->[(b,a)]
exercise2 [] = []
exercise2 ((a,b):xs) = (b,a): exercise2 xs

-- Exercise 4
exercise4::Int->[a]->Maybe a
exercise4 n [] = Nothing
exercise4 0 (x:xs) = Just x
exercise4 n (x:xs) = exercise4 (n-1) xs

-- Exercise 6
exercise5::Eq a=> a->[a]->Int
exercise5 counter [] = 0
exercise5 counter (x:xs) = if counter == x then 1 + exercise5 counter xs else exercise5 counter xs

-- Exercise 8
f::[a]->[a]
f [] = []
f (a:b:as) = b:f as
f (a) = []

-- Exercise 10
search::String->String->Int->Maybe Int
search needle [] counter = Nothing
search needle (x:xs) counter = if length needle > length (x:xs)
							 then Nothing
							 else if take (length needle) (x:xs) == needle
							 	  then Just counter
							 	  else  search needle xs (counter+1)


exercise10::String->String->Maybe Int
exercise10 needle string = search needle string 0

-- Exercise 14
exercise14::Eq a=>a->[a]->Bool
exercise14 a [] = False
exercise14 a (x:xs) = if a == x then True else exercise14 a xs

-- Exercise 16
exercise16::Eq a=>[a]->[a]->Bool
exercise16 [] a = True
exercise16 (a:as) b = elem a b && exercise16 as b 

-- Exercise 18
factorial :: Int-> Int
factorial n = product [1..n] 

factorialFold::Int->Int
factorialFold n = foldr (*) 1 [1..n]

exercise18::Int->Bool
exercise18 n = (factorial n) == (factorialFold n)

-- Exercise 20
numberPart::String->String
numberPart [] = ""
numberPart (x:xs) = if x /= '.' then x:numberPart xs else ""

fractionalPart::String->String
fractionalPart [] = ""
fractionalPart (x:xs) = if x /= '.' then x:numberPart xs else ""

t12 = ["(mappend (++!) \"bla\")" ~: "b!l!a!" ~=? (mappend (++"!") ["b","l","a"])]
mappend :: (a->[b])->[a]->[b]
mappend f [] = []

t20 = ["wholePart \"23.455\""~: "23" ~=? (wholePart "23.455")
      ,"fractionPart \"23.455\""~: "455" ~=? (fractionPart "23.455")]
wholePart :: String -> String
wholePart (n:ns) = if n == '.' then [] else n:wholePart ns
fractionPart :: String -> String
fractionPart (n:ns) = if n == '.' then ns else fractionPart ns
