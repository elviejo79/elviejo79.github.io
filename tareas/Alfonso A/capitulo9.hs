-----------------------------------------------------------------------------------------------------------
-- ***************************************************************************************************** --
-- * Exercise 1. Is the following a chain? You can test your conclusions by evaluating s in each case. * --
-- ***************************************************************************************************** --
-----------------------------------------------------------------------------------------------------------

imp1 :: Integer -> Integer
imp1 1 = 2
imp1 x = error "imp1: premise does not apply"

imp2 :: Integer -> Integer
imp2 2 = 3
imp2 x = error "imp2: premise does not apply"

imp3 :: Integer -> Integer
imp3 3 = 4
imp3 x = error "imp3: premise does not apply"
s :: [Integer]
s = [1, imp1 (s !! 0), imp2 (s !! 1), imp3 (s !! 2)]

------------------
-- R:           --
-- Si es Cadena --
-- [1, 2, 3, 4] --
------------------

-----------------------------------------
-- *********************************** --
-- * Ex 2. Is the following a chain? * --
-- *********************************** --
-----------------------------------------

ex2 :: Integer -> Integer
ex2 1=2
ex2 x = error "imp1: premise does not apply"

ex2_ :: Integer -> Integer
ex2_ 3=4
ex2_ x = error "imp2: premise does not apply"
s2 :: [Integer]
s2 = [0, ex2 (s2 !! 0), ex2_ (s2 !! 1)]

-------------------------------------------------------------------
-- R:                                                            --
-- No es cadena.                                                 --
-- Se salta una parte. No hay resultado para el primer termino.  --
-------------------------------------------------------------------



-------------------------------------
-- Ex 3. Is the following a chain? --
-------------------------------------


ex3 :: Integer -> Integer
ex3 0=1
ex3 x = error "imp1: premise does not apply"

ex3_ :: Integer -> Integer
ex3_ 3=4
ex3_ x = error "imp2: premise does not apply"

s3 :: [Integer]
s3 = [0, ex3 (s3 !! 0), ex3_ (s3 !! 1)]

-------------------------------------------------------------
-- R:                                                      --
-- No es cadena. No se define el primer parametro del ex3_ --
-------------------------------------------------------------


-------------------------------------
-- Ex 4. Is the following a chain? --
-------------------------------------
ex4 :: Integer -> Integer
ex4 0=1
ex4 x = error "imp1: premise does not apply"

ex4_ :: Integer -> Integer
ex4_ 1=2
ex4_ x = error "imp2: premise does not apply"

s4 :: [Integer]
s4 = [0, ex4 (s4 !! 1), ex4_ (s4 !! 0)]

----------------------------------------------------------
-- R:                                                   --
-- --No encuentra el segundo elemento. no está ordenado --
----------------------------------------------------------

increment :: Integer -> Integer
increment x = x + 1

incr :: [Integer]
incr = [0, increment (incr !! 0), increment (incr !! 1)]

recursivo :: [Integer]
recursivo = 0 : map increment recursivo



----------------------------------------------------------------------------------
-- Exercise 5. Given the base case 0 ∈ n and the induction rule x ∈ n → x + 1 ∈ --
-- n, fix the following calculation so that 3 is in set n:                      --
--                                                                              --
-- fun :: Integer -> Integer                                                    --
-- fun x = x - 1                                                                --
-- n :: [Integer]                                                               --
-- n = 0 : map fun n                                                            --
----------------------------------------------------------------------------------
                                                                                                                            --
fun :: Integer -> Integer                                                                                                   --
fun x = x + 1                                                                                                               --
                                                                                                                            --
n :: [Integer]                                                                                                              --
n = 0:map fun n                                                                                                             --


---------------------------------------------------------------------------------
-- Exercise 6. Use the following definitions, determine whether 4 is in set s, --
-- given 1 ∈ s and the induction rule x ∈ s → x + 2 ∈ s.                       --
-- fun :: Integer -> Integer                                                   --
-- fun x = x + 2                                                               --
-- s :: [Integer]                                                              --
-- s = 1 : map fun s                                                           --
---------------------------------------------------------------------------------

-- True



----------------------------------------------------------------
-- Exercise 7. Fix this calculation of the positive integers: --
-- fun :: Integer -> Integer                                  --
-- fun x = 0                                                  --
-- p :: [Integer]                                             --
-- p = 0 : map fun p                                          --
----------------------------------------------------------------

fun7 :: Integer -> Integer
fun7 x=x+1

p :: [Integer]
p = 0 : map fun7 p

----------------------------------------------------------------------
-- Exercise 8. Fix this calculation of the positive multiples of 3: --
-- fun :: Integer -> Integer                                        --
-- fun x = x * 3                                                    --
-- p :: [Integer]                                                   --
-- p = map fun p                                                    --
----------------------------------------------------------------------

fun8 :: Integer -> Integer
fun8 x=x*3

p8 :: [Integer]
p8 = 1 : map fun8 p8


-----------------------------------------------------------------------------------
-- Exercise 9. Here is a Haskell equation that defines the set s inductively. Is --
-- 82 an element of s?                                                           --
-- s :: [Integer]                                                                --
-- s = 0 : map ((+) 2) s                                                         --
-----------------------------------------------------------------------------------

s9 :: [Integer]
s9 = 0 : map((+) 2) s9
--True



--------------------------------------------------------
-- Exercise 10. What set is defined by the following? --
-- s :: [Integer]                                     --
-- s = 1 : map ((*) 3) s                              --
--------------------------------------------------------

-- Hay múltiplos de 3


------------------------------------------------------------------------------
-- Exercise 11. Alter the definition of newBinaryWords and binWords so that --
-- they produce all of the octal numbers. An octal number is one that       --
-- contains only the digits 0 through 7.                                    --
------------------------------------------------------------------------------

newBinaryWords :: [Integer] -> [[Integer]]
newBinaryWords ys = [0 : ys, 1 : ys]

mappend :: (a -> [b]) -> [a] -> [b]
mappend f [] = []
mappend f (x:xs)= f x ++ mappend f xs

binWords = [0] : [1] : (mappend newBinaryWords binWords)


newBinaryWords_ :: [Integer] -> [[Integer]]
newBinaryWords_ ys = [0:ys, 1:ys, 2:ys, 3:ys, 4:ys, 5:ys, 6:ys, 7:ys]

mappend_ :: (a -> [b]) -> [a] -> [b]
mappend_ f [] = []
mappend_ f (x:xs)= f x ++ mappend f xs

binWords_ = [0]:[1]:[2]:[3]:[4]:[5]:[6]:[7]: (mappend_ newBinaryWords_ binWords_)


type Set a = [a]
build :: a -> (a -> a) -> Set a
build a f = set where set = a : map f set

builds :: a -> (a -> [a]) -> Set a
builds a f = set where set = a : mappend f set

nextInteger1 :: Integer -> Integer
nextInteger1 x= -x

integers1 :: [Integer]
integers1 = build 0 nextInteger1


----------------------------------------------------------------------------------
-- Exercise 12. Use take 10 integers1 to evaluate the first 10 integers accord- --
-- ing to this definition. Describe the set that is actually defined by Attempt --
-- 1.                                                                           --
----------------------------------------------------------------------------------


build_ :: a -> (a -> a) -> Set a
build_ a f = set where set = a : map f set

builds_ :: a -> (a -> [a]) -> Set a
builds_ a f = set where set = a : mappend f set

nextInteger1_ :: Integer -> Integer
nextInteger1_ x= -x

integers1_ :: [Integer]
integers1_ = build 0 nextInteger1_

--Los primeros diez son 0. SIn positivos o negativos. 

nextIntegers2 :: Integer -> [Integer]
nextIntegers2 x=[x+1,x-1]

integers2 :: [Integer]
integers2 = builds 0 nextIntegers2




------------------------------------------------------------------------------
-- Ex 13. Use take 20 integers2 to evaluate the ﬁrst 20 integers according  --
-- to this deﬁnition. Describe the set that is actually deﬁned by Attempt2. --
------------------------------------------------------------------------------

--Los primeros 20 valores = [0,1,-1,2,0,0,-2,3,1,1,-1,1,-1,-1,-3,4,2,2,0,2]



nextIntegers3 :: Integer -> [Integer]
nextIntegers3 x=[x+1,-(x+1)]

integers3 :: [Integer]
integers3 = builds 0 nextIntegers3






---------------------------------------------------------------------------------
-- Exercise 14. Use the computer to examine the first 10 integers generated by --
-- this definition, and describe the set that is defined.                      --
---------------------------------------------------------------------------------
----[0,1,-1,2,-2,0,0,3,-3,-1]

nextInteger4 :: Integer -> Integer
nextInteger4 x=if x<0 then x-1 else x+1

integers4 :: [Integer]
integers4 = build 0 nextInteger4



--------------------------------------------------------------------------------
-- Exercise 15. Use the computer to generate some elements of the set defined --
-- by Attempt 4, and describe the result.                                     --
--------------------------------------------------------------------------------

-----[0,1,2,3...], desde 0 hasta n


nextIntegers5 :: Integer -> [Integer]
nextIntegers5 x 	
			= if x > 0 || x==0
				then [x + 1, -(x + 1)]
				else []
integers5 :: [Integer]
integers5 = builds 0 nextIntegers5




---------------------------------------------------------------------------------
-- Exercise 16. Use the computer to evaluate the first 10 elements of the set, --
-- and describe the result.                                                    --
---------------------------------------------------------------------------------


--[0,1,-1,2,-2,3,-3,4,-4,5] --- se va sumando y restando uno, primero al cero y luego al resultado...




-------------------------------------------------------------------------------
-- Ex 17. Does ints, using the following deﬁnition, enumerate the integers?  --
-- If it does, then you should be able to pick any integer and see it        --
-- eventually in the output produced by ints. Will you ever see the value 1? --
-------------------------------------------------------------------------------


nats :: [Integer]
nats = build 0 (1 +)
negs :: [Integer]
negs = build (-1) (1 -)

ints :: [Integer]
ints = nats ++ negs
----False



-----------------------------------------------------------------
-- Ex 18. Does twos enumerate the set of even natural numbers? --
-- twos :: [Integer]                                           --
-- twos = build 0 (2 *)                                        --
-----------------------------------------------------------------
--Como inicia en cero, la multiplicación siempre da cero.


-------------------------------------------------------------------------------
-- Exercise 19. What is wrong with the following definition of the stream of --
-- natural numbers?                                                          --
-- nats = map (+ 1) nats ++ [0]                                              --
-------------------------------------------------------------------------------

-- No se ven resultados debido a que no se tienen valores imprimibles



---------------------------------------------------------------------------------
-- Exercise 20. What is the problem with the following definition of the natu- --
-- rals?                                                                       --
-- naturals :: [Integer] -> [Integer]                                          --
-- naturals (i:acc) = naturals (i + 1:i:acc)                                   --
-- nats :: [Integer]                                                           --
-- nats = naturals [0]                                                         --
---------------------------------------------------------------------------------

--Se cicla. No se muestra nada. 



--------------------------------------------------------------------------------------
-- Ex 21. Can we write a function that will take a stream of the naturals           --
-- (appearing in any order) and give the index of a particular number?              --
--------------------------------------------------------------------------------------
--Se generan numeros hasta el infinito. No se despliega nada. 


---------------------------------------------------------------------------
-- --Ex 22. Using induction, deﬁne the set of roots of a given number n. --
---------------------------------------------------------------------------

-- n^1 E R
-- n^(1/m) E R → n^(1/m+1) E R




-------------------------------------------------------------------------
-- Ex 23. Given the following deﬁnition, prove that n3                 --
-- is in set P of powers of n.                                         --
-- Deﬁnition 28. Given a number n, the set P of powers of n is deﬁned  --
-- as follows:                                                         --
--                                                                     --
-- * n^0 E P  -> CASO BASE                                             --
-- * n^m E P -> n^m+1 E P -> Regla de inducción                        --
-- * Nothing else is in P unless it can be shown to be in P by a ﬁnite --
-- number of uses of the base and induction rules.                     --
-------------------------------------------------------------------------





---------------------------------------------------------------------------
-- Ex 24. When is 0 in the set deﬁned below?                             --
--                                                                       --
-- Deﬁnition 29. Given a number n, the set N is deﬁned as follows:       --
-- * n E N                                                               --
-- * m E N → m − 2 E N                                                   --
-- * Nothing is in N unless it can be shown to be in N by a ﬁnite number --
-- of uses of the previous rules.                                        --
---------------------------------------------------------------------------

-- SOlamenta aplica cuando n sea multiplo de 2




-------------------------------------------------------------------------
-- Ex 25. What set is deﬁned by the following deﬁnition?               --
-- Deﬁnition 30. The set S is deﬁned as follows:                       --
--                                                                     --
-- * 1 E S                                                             --
-- * n E S E n mod2=0→ n +1 E S                                        --
-- * n E S E n mod2=1→ n +2 E S                                        --
-- * Nothing else is in S unless it can be shown to be in S by a ﬁnite --
-- number of uses of the previous rules.                               --
-------------------------------------------------------------------------
-- Solo para numeros impares. 



---------------------------------------------------------------------------
-- Ex 26. Prove that 4 is in the set deﬁned as follows:                  --
-- Deﬁnition 31. The set S is deﬁned as follows:                         --
-- * 0 E S                                                               --
-- * n E S E n mod2=0→ n +2 E S                                          --
-- * n E S E n mod2=1→ n +1 E S                                          --
-- * Nothing is in S unless it can be shown to be in S by a ﬁnite number --
-- of uses of the previous rules.                                        --
---------------------------------------------------------------------------

--Regla(1) 0 E S
--Regla(2) 0 E S -> 2 E S 
--Regla(2) 2 E S -> 4 E S so 4 E S





------------------------------------------------------------------------------
-- Ex 27. Given the following deﬁnition, prove that the string ‘yyyy’ is in --
-- YYS.                                                                     --
-- Deﬁnition 32. The set YYS of strings containing pairs of the letter ’y’  --
-- is deﬁned as follows:                                                    --
-- 1. "" E  YYS                                                             --
-- 2. s E YYS -> "yy                                                        --
-- " ++s E YYS                                                              --
-- 3. Nothing else is in YYS unless it can be shown to be in YYS by a       --
-- ﬁnite number of uses of rules (1) and (2).                               --
------------------------------------------------------------------------------

--1. "" E YYS
--2. "" E YYS -> "yy" E YYS  Modus Ponens, "yy" E YYS.
--3. "yy" E YYS -> "yyyy" E YYS  Modus Ponens, "yyyy" E YYS.




--------------------------------------------------------------------------------------
-- Ex 28. Using data recursion, deﬁne the set of strings containing the letter ‘z’. --
--------------------------------------------------------------------------------------
zs = "" : map ('z':) zs



-------------------------------------------------------------------------------
-- Ex 29. Using induction, deﬁne the set of strings of spaces of length less --
-- than or equal to some positive integer n.                                 --
-------------------------------------------------------------------------------

--1. '' E S 
--2. ca E S /\ lengthss<n->'':ca E S
--3. A menos que se demuestre un número finito de las primeras dos reglas,
--no se puede poner nada en S




---------------------------------------------------------------------------------------------------------------------------------------
-- Ex 30. Using recursion, deﬁne the set of strings of spaces of length less than or equal to length n,wheren is a positive integer. --
---------------------------------------------------------------------------------------------------------------------------------------

ex30 :: Integer -> [String]
ex30 0=[""]
ex30 n = take n (repeat ' ') : ex30 (n - 1)



------------------------------------------------------------------------------
-- Ex 31. We could have a set that consists of all the natural numbers      --
-- except for 2; you can write this as N −{2}. Similarly, for every natural --
-- number x, there is a set that contains all the natural numbers except    --
-- for x. Now, we could make a set SSN of all of these results. Write an    --
-- inductive deﬁnition of SSN                                               --
------------------------------------------------------------------------------

--1. N −{0}E S
--2. (N −{n}) E S → (N −{n +1} E S
--3. Igual que en la 29





-----------------------------------------------------------------------------------
-- Ex 32. Given the following deﬁnition, show that the set I −{−3}∈              --
-- SSI−.                                                                         --
-- The set of sets of integers SSI, each of which is missing a distinct negative --
-- integer, is deﬁned inductively as follows:                                    --
-- 1. I −{−1}E SSI                                                               --
-- 2. I −{n}→I −{n − 1} E SSI-                                                   --
-- 3. Nothing else is in SSI- unless it can be shown to be in SSI- by a          --
-- ﬁnite number of uses of rules (1) and (2)                                     --
-----------------------------------------------------------------------------------

--1. I − {−1} E SSI
--2. I − {−1} -> I − {−2} E SSI
--3. I − {−2} -> I − {−3} E SSI
--4. I − {−3} E SSI




----------------------------------------------------------------------------
-- Ex 33. Given the following deﬁnition, prove that -7 is in ONI. The set --
-- ONI of odd negative integers is deﬁned as follows:                     --
-- 1. −1 E ONI                                                            --
-- 2. n E ONI -> n − 2 E ONI                                              --
-- 3. Nothing is in ONI unless it can be shown to be in ONI by a ﬁnite    --
-- number of uses of the previous rules.                                  --
----------------------------------------------------------------------------

--1. −1 E ONI
--2. −1 E ONI -> −3 E ONI so −3 E ONI
--3. −3 E ONI -> −5 E ONI so −5 E ONI
--4. −5 E ONI -> −7 E ONI so −7 E ONI




-------------------------------------------------------------------------
-- Ex 34. Using data recursion, deﬁne the set ni of negative integers. --
-------------------------------------------------------------------------
ex34 :: Integer -> Integer
ex34 x=x-1

ni = -1 : map ex34 ni where decrement x = x - 1




------------------------------------------
-- Ex 35. If you print the elements of  --
-- [(a,b)|a<-[0..], b <- [0..]]         --
-- will you ever see the element (1,2)? --
------------------------------------------

-- Son numeros unfinitos por lo que nunca termina.




----------------------------------------------------------------------------
-- Ex 36. What set is given by the following deﬁnition?                   --
-- Deﬁnition 33. The set S is deﬁned as follows:                          --
-- 1. 1 E S                                                               --
-- 2. n E S -> n − n E S                                                  --
-- 3. Nothing is in S unless it can be shown to be in S by a ﬁnite number --
-- of uses of the previous rules.                                         --
----------------------------------------------------------------------------

--[0,1]
