ej_15 :: Show a => Maybe a -> String 
ej_15 (Just a) = show (Just a)
ej_15 Nothing = "Nothing"


--     ej_17
-- 1
-- [1, False] no son del mismo tipo se puede cambiar a (Bool, Bool) o  (Int, Int)
-- podria definirse como (True, False) ó (10,20)
-- 2
-- [(3,True), (False,9)]
-- es el mismo error de primer ejemplo la tupla podria quedar [(Bool, Int),(Bool, Int)] 
-- ó [(Int, Bool),(Int, Bool)]
-- 3
-- 'a'>"b" no se puede comparar porq no son del mismo tipo son Char y String 
-- para compararlos se podria comparar 
-- 'a'>'b' ó "a">"b"


-- ej_19 :: Maybe a -> [a]
-- ej_19 Nothing = []
-- Falta definir que hace cuando recibe un Just

ej_21 :: [Int] -> Int -> [Int]
ej_21 xs n = [i | i <- xs, i>n]

ej_23 :: [Int] -> [Int]
ej_23 arre = [e | e <- arre, [x | x <- [1..e], x * x == e] == []]

ej_25 :: Char -> [Char] -> [Char]
ej_25 aguja cs = foldl (\acc c -> if c /= aguja then acc ++ [c] else acc) [] cs

ej_27 :: [Maybe a] -> Maybe a
ej_27 [] = Nothing
ej_27 xs = foldl(\acc x -> x) Nothing xs  

ej_27_numeros :: [Int] -> Int
ej_27_nueros [] = -1
ej_27_numeros xs = foldl(\acc x -> x) 0 xs  