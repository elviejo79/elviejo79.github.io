ej2 :: [(a, b)] -> [(b,a)]
ej2 []=[] 
ej2 ((a,b):ax) = (b, a) : ej2 ax 

--ej4 :: Int -> [a] -> Maybe a
--ej4 e [] = 0
--ej4 e (x:xs) = if x == e then Just tail x else (ej4 e xs)

ej6 :: Eq a => a -> [a] -> Int
ej6 e [] = 0
ej6 e (x:xs) = if x == e then  1 + (ej6 e xs) else (ej6 e xs)


primera:: Eq a => a -> [a] -> Int
primera x xs= head[i | (x', i) <- posi xs, x' == x]

posi :: [a] -> [(a, Int)]
posi xs= zip xs[0..]