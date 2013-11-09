type Set a = [a]
  
 
intersection :: Eq a => Set a -> Set a -> Set a
intersection xs = foldr intersect []
          where intersect new acc = if new `elem` xs then new:acc else acc

difference :: Eq a => Set a -> Set a -> Set a
difference xs ys = foldr diff [] xs
        where diff new acc = if new `elem` ys then acc else new:acc

-- Subset
 
subset :: (Eq a)=> [a] -> [a] -> Bool
subset xs ys = and [elem x ys | x <- xs]


setEq :: (Eq a) => [a] -> [a] -> Bool
setEq xs ys = subset xs ys && subset ys xs 



--Exercise 1

--A={1,2,3,4,5}
--B={2,4,6}


--a) A ? (B n A)
--    {1,2,3,4,5} ? {2,4}     
--    {1,2,3,4,5}

--b) (A n B) ? B
--    {2,4} ? {2,4,6}
--    {2,4,6}

 
--c) A - B
--    {1,2,3,4,5} - {2,4,6}
--    {1,3,5}

      
--d) (B - A) n B
--     {2,4,6}-{1,2,3,4,5}
--     {6}   
   


--e) A ? (B - A)
--    {1,2,3,4,5} ? ({2,4,6}-{1,2,3,4,5})
--    {1,2,3,4,5} ? {6}
--    {1,2,3,4,5,6}    


--Exercise 2


--a)
exercise2a=[1,2,3] `union` [3]
   --[1,2,3]  


--b) 
exercise2b=[4,2] `union` [2,4]
--[4,2]

--c) 
exercise2c=[1,2,3] `intersection` [3]
--[3]


--d) 
exercise2d = [] `intersection` [1,3,5]
--[]

--e) Difference
exercise2e = [1,2,3] `difference` [3]
--[1,2]

--f) 
exercise2f=[2,3] `difference` [1,2,3]
--[]

--g)
exercise2g=[1,2,3] `intersection` [1,2]
--[1,2]

--h) 
exercise2h=[1,2,3] `union` [4,5,6]
--[1,2,3,4,5,6]


--i) 
exercise2i=([4,3] `difference` [5,4]) `intersection` [1,2]
--[]

--j) 
exercise2j=([3,2,4] `union` [4,2]) `difference` [2,3]
--[4]



--k)
exercise2k=subset [3,4] [4,5,6]
--False


--(l)
exercise2l=subset [1,3] [4,1,3,6]
--True

--(m)
exercise2m=subset [] [1,2,3]
--True

--(n)
exercise2n=setEq [1,2] [2,1]
--True

--(o)
exercise2o= setEq [3,4,6] [2,3,5]
--False

--(p)
exercise2p= [1,2,3] `difference` [1]
--[2,3]

--(q)
exercise2q = [] `difference` [1,2]
 -- []



--Exercise 3

exercise3a=powerset [3,2,4]

      -- Result = [[],[4],[2],[2,4],[3],[3,4],[3,2],[3,2,4]]

exercise3b=powerset [2]

      -- Result = [[],[2]]



powerset :: Eq a => Set a -> [Set a]
powerset [] = [[]]
powerset (x:xs) = xss ++ map (x:) xss
     where xss = powerset xs


--Exercise 4


crossProduct :: Set a -> Set b -> Set (a,b)
crossProduct xs ys= [(x,y) | x <- xs, y <- ys]

exercise4a = crossProduct [1,2,3] ['a','b']
     --[(1,'a'),(1,'b'),(2,'a'),(2,'b'),(3,'a'),(3,'b')]
 
exercise4b = crossProduct [1] ['a','b']
     --[(1,'a'),(1,'b')]



--Exercise 5
-- a) 

exercise5a=[2,3,4] `union` [5,6,7]
         --[2,3,4,5,6,7]
exercise5b= [1,2,3,4,5,6,7,8,9,10] `difference`[2,3,4] `intersection` ([5,6,7] `union` [1,2])
        --[1,5,6,7,8,9,10] `intersection` [1,2,5,6,7] 
        --[1,5,6,7]

exercise5c=[1,2] `difference` [5,6,7]
        -- [1,2]

exercise5d=([2,3,4] `union` [5,6,7]) `union` [1,2]
        -- [2,3,4,5,6,7] `union` [1,2]
            -- [1,2,3,4,5,6,7]

exercise5e=[1,2,3,4,5,6,7,8,9,10]`difference`[2,3,4]
      -- [1,5,6,7,8,9,10]


exercise5f=[1,2,3,4,5,6,7,8,9,10]`difference`([5,6,7]`intersection`[1,2])
      -- [1,2,3,4,5,6,7,8,9,10]`difference`[]
      -- [1,2,3,4,5,6,7,8,9,10]


--Exercise 6
exercise6=[x+y | x <- [1,2,3], y<-[4,5]] 


--Exercise 7 
exercise7 = [x | x <- [1..5], x < 0] 
-- []

--Exercise 8
exercise8 = [x + y | x <- [1,2,3], y <- [4,5]]
--[5,6,6,7,7,8]       


--Exercise 9
exercise9 = [x | x <- [1,2,3,4,5,6,7,8,9,10], even x] 
-- [2,4,6,8,10]


--Exercise 10
exercise10a=subset [1,3,4] [4,3]
-- False
exercise10b=subset [] [2,3,4]
-- True
exercise10c=setEq [2,3] [4,5,6]
--False
exercise10d=setEq [1,2] [1,2,3]
--False




--Exercise 11. Let A, B, and C be sets. Prove that if A ? B and B ? C, then A ? C.

--If A ? B and B ? C, then A ? C.
        
--  B ? C    Sea x un elemento en C que no está en B
--  A ? B    x no puede estar en A y cada elemento de A esta en B
--  A ? C    x está en C pero no está en A, por lo tanto A es un subconjunto de C

--Exercise 12-
--Exercise 12. Consider the following two claims. For each one, if it is true
--give a proof, but if it is false give a counterexample.
--(a) If A ? B and B ? C, then A ? C.
--(b) If A ? B and B ? C, then A ? C.


------------12a es FALSO-------------------
--(a) If A ? B and B ? C, then A ? C.
--Proof. Sea x un elemento
--1. A ? B { Premise }
--2. x ? A ? x ? B { Def. ? }
--3. B ? C { Premise }
--4. x ? B ? x ? C { Def. ? }
--5. x ? A ? x ? C { Silogismo hipotetico (regla de cadena), (2), (4) }
--6. ?x. (x ? A ? x ? C) { ? introduction }
--7. A ? C { Def. ? }
     
     --Es falso en caso de que A,B y C tengan los mismos elementos.
     --Ej. Si A=B y B=C entonces no puede ser que A ? C
     --A=[1,2,3]
     --B=[1,2,3]
     --c=[1,2,3]
     --A ? B y B ? C
     --Entonces es Falso que A?C  =>  [1,2,3]?[1,2,3] 


----------12b es VERDADERO----------------
--(b) If A ? B and B ? C, then A ? C.
--Proof. Sea x un elemento de A (x ? A)
--1. A ? B { Premise }
--2. x ? B desde que A ? B { Def. ? }
--3. B ? C { Premise }
--4. x ? C desde que B ? C { Def. ? }
--5. x ? A ? x ? C { Silogismo hipotetico (regla de cadena), (2), (4) }
--6. ?x. (x ? A ? x ? C) { ? introduction }
--7. A ? C { Def. ? }

      --Ej.
      -- A=[1,2,3]
      -- B=[1,2,3,4]
      -- C=[1,2,3,4,5]
      -- A ? B   [1,2,3] ? [1,2,3,4]
      -- B ? C   [1,2,3,4] ? [1,2,3,4,5]
      -- A ? C   [1,2,3] ? [1,2,3,4,5]


-----------Exercise 13-----------------------
--Exercise 13. For the following questions, give a proof using set laws, or find
--a counterexample.
--(a) (A' ? B)' n C' = A n (B ? C)'
--(b) A - (B ? C)' = A n (B ? C)
--(c) (A n B) ? (A n B') = A
--(d) A ? (B - A) = A ? B
--(e) A - B = B' - A'
--(f) A n (B - C) = (A n B) - (A n C)
--(g) A - (B ? C) = (A - B) n (A - C)
--(h) A n (A' ? B) = A n B
--(i) (A - B') ? (A - C') = A n (B n C)


--a) (A’ ? B) ’ n C’ = A n (B ? C) ’
--(A'' n B') n  C' = A n (B ? C) ’  {Demorgan's laws}
--(A n B') n  C'  = A n (B ? C) ’   {double complement}
--A n (B' n  C')  = A n (B ? C) ’   {associativity of n}
--A n (B ? C)'   = A n (B ? C) ’   {Demorgan}


--b) A - (B ? C) ’ = A n (B ? C)
--    A n (B ?  C)'' =  A n (B ? C)    {Teorema 69 . 5}
--    A n (B ?  C)  =  A n (B ? C)     {Double complement}



--(c) (A n B) ? (A n B’) = A
-- A n (B ?  B') = A        {Teorema 70}
-- A n U = A                {Universe}
-- A =A                     {Identity}



-- d) A ? (B - A) = A ? B
--    A ? (B n A') = A ? B           {Teorema 69}
--   (A ? B) n (A ? A') = A ? B      {Teorema 71}
--   (A ?  B) n U= A ? B             {Universe}
--    A ?  B = A ? B                 {Identity.2}



--e) A - B = B' - A'
-- A n B'= B' - A'                 {Teorema 69 .1}
-- B' n A = B' - A'                {Teorema 69 .2}
-- B' n A''= B' - A'               { Double complement}
-- B’ – A’= B' - A'                {Teorema 69 .5}



-- f) A n (B - C) = (A n B) - (A n C)
-- A n (B - C) = (A n B) - (A n C)          
-- A n (B - C) = (A n B) n (A n C)'                   {Teorema 69 .5}
-- A n (B - C) = (A n B) n (A' U  C')               {Teorema 72 .2}
-- A n (B - C) = ((A n B) n A') U ((A n B) n C')    {Def. Set equality}
-- A n (B - C) = (A n B n A') U (A n B n C')        {Associative}
-- A n (B - C) = Ø U (A n B n C')                   {Def. Ø }
-- A n (B - C) = A n B n C'                         {Identity}
-- A n (B - C) = A n (B - C)                        {Teorema 69 .5}



--g) A - (B U C) = (A - B) n (A - C)
--  A n (B U C)' = (A - B) n (A - C)                {Teorema 69 .5}
--  A n (B' n C') = (A - B) n (A - C)               {Teorema 72 .1}
--  A n A n B' n C'= (A - B) n (A - C)            {Associative}
-- (A n B') n (A n C') = (A - B) n (A - C)       { Associative}
-- (A - B) n (A - C) = (A - B) n (A - C)           {Teorema 69 .5}


--h) A n (A' U B) = A n B
-- (A n A') U (A n B)   = A n B             {Distributive Laws}
--  Ø U (A n B) = A n B                        {Def. Ø } 
--  A n B= A n B                              {Identity}


--i) (A - B') U (A - C') = A n (B n C)
-- (A n B'') U (A n C'') = A n (B n C)            { Teorema 69 .5}
--  (A n B) U (A n C) = A n (B n C)              {Double complement}
--  A n (B U C) = A n (B U C)                        {Distributive Laws}          




--Exercise 14

smaller :: Ord a => a -> [a] -> Bool
smaller x [] = True
smaller x (y:xs) = x < y
  
powerset2 :: (Eq a, Ord a) => [a] -> [[a]]
powerset2 = foldr cjoin [[]]
              where cjoin new acc = [new:x | x <- acc, new `smaller` x, not (new `elem` x)] ++ acc




--Exercise 15
--(A ? B)' = A' n B'
--(A ? B)' = (U - A) n (U - B)
--(A ? B)' = ((A ? A') - A) n ((B ? B') - B)
--(A ? B)' = ((A ? A') n A') n ((B ? B') n B')



--Exercise 16
isSubset :: Eq a => [a] -> [a] -> Bool
isSubset set1 set2 = null [e | e <- set1, not (elem e set2)]



--Exercise 17
----Debe ser e <-set1, not (elem e set2)



---------------------------Exercise 18------------------------------------------------
--Exercise 18. What is wrong with this definition of intersection, a function
--that takes two sets and returns their intersection?
--intersection :: [a] -> [a] -> [a]
--intersection set1 set2 = [e | e <- set1, e <- set2]
--Correcto
-- intersection18 :: [a] -> [a] -> [a]
-- intersection18 set1 set2 = [e | e <- set1, e ‘elem‘ set2]


--Exercise 19

union :: Eq a => [a] -> [a] -> [a]
union set1 set2 = set1 ++ [e | e <- set2, not (elem e set1)]



--Exercise 20
-- Solo cuando A ? B and C ? A

-- A=[4,5,6]
-- B=[4,5,6,7]
-- C=[4,5]

--   [4,5,6] U ([4,5,6,7]-[4,5]) =  [4,5,6,7]
--    [4,5,6] U [6,7] = [4,5,6,7]
--         [4,5,6,7]  = [4,5,6,7]

--Exercise 21. Give an example in which (A ? C) n (B ? C) = Ø.
 
--Ambas uniones contienen C, entonces  C debe ser vacío, además A y B deben ser diferentes

--Ej. A = {A, B, C}, B = {D, E, F}, C = 0.
--   ({A, B, C} ? Ø) n ({4, 5, 6} ? Ø) = 0
--     {A, B, C} n {D, E, F} = 0
--          0  =  0




--Exercise 22. Prove the commutative law of set-intersection, A n B = B n A.

--A n B=  {x|x ? A ? x ? B}  { defn n }
--A n B = {x|x ? B ? x ? A}  { ? commutative }
--A n B = B n A               { defn n }


--Exercise 23. Express the commutative law of set-intersection in terms of the
--set operations and Boolean operations defined in the Stdm module.


exercise23a=[1,2,3] `intersection` [1,2,4]
exercise23b=[1,2,4] `intersection` [1,2,3]


--Exercise 24. Prove the associative law of set-union, (A?B)?C = A?(B?C).


--(A ? B) ? C= {x |(x ? A ? x ? B) ? x ? C}  { defn ? }

--(A ? B) ? C= {x|x ? A ? (x ? B ? x ? C)}   { ? associative }
 
--(A ? B) ? C= A ? (B ? C)                    { defn ? }



---------------------------Exercise 25------------------------------------------------
--Exercise 25. Prove that the difference between two sets is the intersection of
--one with the complement of the other, which can be written as
--A - B = A n B'.


--A - B = A n B'.
--A - B'' = A n B'                                                {double difference}
--A - B''= {x|x ? A ? x ? B''}                             { def. - }
--A - B''={x|x ? A? ¬(x ? U ? x ? B'')}                   { def. complement }
--A - B''={x|x ? A? ¬(x ? U ? ¬(x ? B'))}                  { def. ? }
--A - B''={x|x ? A? ¬(x ? U ? ¬(x ? U ? x ? B))}          { def. complement }
--A - B''={x|x ? A? ¬(x ? U ? ¬(x ? U ? ¬(x ? B)))}        { def. ? }
--A - B''={x|x ? A? ¬(x ? U ? (¬(x ? U) ? (x ? B)))}       { DM, double negation }
--A - B''={x|x ? A ? (¬(x ? U)? ¬(¬(x ? U) ? (x ? B)))}    { DM }
--A - B''={x|x ? A ? (x ? U ? (¬¬(x ? U)? ¬(x ? B)))}     { DM }
--A - B''={x|x ? A ? (x ? U ? (x ? U ? x ? B))}           { double negation, def. ? } 
--A - B''={x|x ? A ? (x ? U ? x ? B)}                      { ? null, def. ? }
--A - B''={x|x ? A ? x ? U - B}                             { def.- }       
--A - B''=A n B'                                             { def. complement,n }                                                               




---------------------------Exercise 26------------------------------------------------
--Exercise 26. Prove that union distributes over intersection,
--A ? (B n C) = (A ? B) n (A ? C).


--A ? (B n C) = {x|x ? A ? (x ? B ? x ? C)}              { defn n,? }
--A ? (B n C) = {x|(x ? A ? x ? B) ? (x ? A ? x ? C)}   { ? over ? }
--A ? (B n C) = (A ? B) n (A ? C)                        { def . n, ? }



---------------------------Exercise 27------------------------------------------------
--Exercise 27. Prove DeMorgan’s law for set intersection, (A n B)' = A' ? B'


--(A n B)'= {x|x ? U ? x ? (A n B)}                    { defn. complement }
--(A n B)'= {x|x ? U ? ¬(x ? A ? x ? B)}               { defn. ?,n }
--(A n B)'= {x|x ? U ? (¬(x ? A)? ¬(x ? B))}           { DM }
--(A n B)'= {x|x ? U ? (x ? A ? x ? B)}               { defn. ? }
--(A n B)'= {x|(x ? U ? x ? A) ? (x ? U ? x ? B)}     { ? over ? }
--(A n B)'= {x|(x ? U - A) ? (x ? U - B)}               { defn. - }
--(A n B)'= A' ? B'                                      { defn. complement,? }
