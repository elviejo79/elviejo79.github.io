
-- Ejercicio 1
copiarLista :: [a]->[a] 
copiarLista [] = [] 
copiarLista (x:xs) = x:copiarLista xs

--Ejercicio 2

invertir :: [(a,b)]-> [(b,a)] 
invertir [] = []
invertir ((a,b):xs) = (b,a):invertir xs

--Ejercicio 3
merge :: Ord a => [a] -> [a] -> [a] 
merge [] [] = [] 
merge as [] = as 
merge [] bs = bs 
merge (a:as) (b:bs) = if a < b then a:merge as (b:bs) else b:merge (a:as) bs

--Ejercicio 4
obtenerIndice :: [a] -> Int -> Maybe a
obtenerIndice [] n = Nothing
obtenerIndice (x:_) 0 = Just x
obtenerIndice (x:xs) n = obtenerIndice xs (n - 1)

--Ejercicio 5
clookup :: Int -> [(Int,Int)]-> Maybe Int 
clookup e [] = Nothing 
clookup e ((a,b):as) = if a == e then Just b else clookup e as

--Ejercicio 6
contar :: Eq a => a -> [a] -> Int
contar _ [] = 0
contar num (x:xs) = (if (num == x) then 1 else 0) + contar num xs

--Ejercicio 7
f7 :: Eq a => a->[a]->[a] 
f7 e [] = [] 
f7 e (x:xs) = if x == e then f7 e xs else x:(f7 e xs)

--Ejercicio 8
f8 :: [a]->[a] 
f8 xs = []


--Ejercicio 9
extract :: [Maybe a] -> [a] 
extract [] = [] 
extract (Nothing:xs) = extract xs 
extract (Just x:xs) = x:extract xs

--Ejercicio 11
foldrWith :: (a -> b -> c -> c) -> c -> [a] -> [b] -> c 
foldrWith f z [] bs = z 
foldrWith f z as [] = z 
foldrWith f z (a:as) (b:bs)= f a b (foldrWith f z as bs)

--Ejercicio 12
mappend :: (a->[b])->[a]->[b] 
mappend f xs = []

--Ejercicio 13
removeDuplicates :: Eq a => [a] -> [a] 
removeDuplicates [] = [] 
removeDuplicates (x:xs) = if (elem x xs) then removeDuplicates xs else x:removeDuplicates xs

--Ejercicio 14
existeElemento :: (Eq a) => a -> [a] -> Bool
existeElemento _ [] = False
existeElemento a (x:xs) | a == x = True | otherwise = existeElemento a xs

--Ejercicio 15
intersection :: Eq a => [a] -> [a] -> [a] 
intersection [] bs = [] 
intersection as [] = [] 
intersection (a:as) bs = if (elem a bs) then a:intersection as bs else intersection as bs

--Ejercicio 16

--Ejercicio 17
isSorted :: Ord a => [a] -> Bool 
isSorted [] = True 
isSorted (a:b:as) = if a < b then True && isSorted (b:as) else False 
isSorted a = True

--Ejercicio 18

--Ejercicio 19
flast :: Eq a => [a]-> Maybe a 
flast [] = Nothing 
flast (x:xs) = if xs == [] then Just x else flast xs
