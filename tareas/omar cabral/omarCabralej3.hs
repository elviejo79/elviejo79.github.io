--Ejercicio 2

inverse :: [(a,b)] -> [(b,a)]
inverse [] = []
inverse ((x,y):rest) = (y,x):inverse rest
 

--Ejercicio 4

--  [1,2,3] 0 == Just 1
--  [1,2,3] 2 == Just 3
--  [1,2,3] 5 == Nothing


(!!!) :: Int -> [a] -> Maybe a
(!!!) n [] = Nothing
(!!!)  0 (x:_) = Just x
(!!!) n (x:xs) = (!!!) (n - 1) xs 


--Ejercicio 6
f6 :: Eq a => a -> [a] -> Int
f6 a [] = 0
f6 a (b:bs) = (if (a == b) then 1 else 0) + f6 a bs



--Ejercicio 8 
f8 :: [a] -> [a]
f8 = ignora

agrega :: [a] -> [a]
agrega [] = []
agrega (x:xs) = x : (ignora xs)
 
ignora :: [a] -> [a]
ignora [] = []
ignora (x:xs) = agrega xs
 

--Ejercicio 10 

loop :: String -> String -> Int -> Maybe Int
loop [] s2 n = Nothing
loop (x:xs) s2 n
   = if length s2 > length (x:xs)
         then Nothing
         else if take (length s2) (x:xs) == s2
                  then Just n
              else loop xs s2 (n+1)

f10 :: String -> String -> Maybe Int
f10 str1 str2 = loop str1 str2 0


--Ejercicio 12
mappend :: (a->[b])->[a]->[b]
mappend f xs = foldr func [] xs
        where func x acc= f x ++ acc


--Ejercicio 14--
f14 :: Eq a => a -> [a] -> Bool
f14 a [] = False
f14 a (x:xs) = a == x || f14 a xs


--Ejercicio 16 
--t16 = ["(isSubset [2,4] [1,2,3,4,5])" ~: True ~=? (isSubset [2,4] [1,2,3,4,5])] 
isSubset :: Eq a => [a] -> [a] -> Bool 
isSubset [] [] = True 
isSubset a [] = False 
isSubset [] b = True 
isSubset (a:as) b = if elem a b then True && (isSubset as b) else False 


--Ejercicio 18 
--t18 = ["" ~: ~=? (factorial)] 
ex18 :: Integer -> Integer 
ex18 0 = 1 
ex18 n = foldr (*) 1 [1..n] 
ex18b :: Integer -> Integer 
ex18b 0 = 1 
ex18b n = n * ex18b (n -1) 



--Ejercicio 20 
--t20 = ["wholePart \"23.455\""~: "23" ~=? (wholePart "23.455") -- ,"fractionPart \"23.455\""~: "455" ~=? (fractionPart "23.455")] 
wholePart :: String -> String 
wholePart [] = [] 
wholePart (x:xs) = if x /= '.' then x:(wholePart xs) else [] 
fractionPart :: String -> String 
fractionPart [] = [] 
fractionPart (x:xs) = if x == '.' then xs else fractionPart xs