-------Exercise 1------*
imp1_1 :: Integer -> Integer
imp1_1 1 = 2
imp1_1 x = error "imp1: premise does not apply"

imp2_1 :: Integer -> Integer
imp2_1 2 = 3
imp2_1 x = error "imp2: premise does not apply"

imp3_1 :: Integer -> Integer
imp3_1 3 = 4
imp3_1 x = error "imp3: premise does not apply"

s :: [Integer]
s = [1, imp1_1 (s !! 0), imp2_1 (s !! 1), imp3_1 (s !! 2)]

--RESPUESTA
---- Si es una cadena porque se obtiene [1, 2, 3, 4]

-- Exercise 2. Is the following a chain?------------*

imp1_2 :: Integer -> Integer
imp1_2 1 = 2
imp1_2 x = error "imp1: premise does not apply"

imp2_2 :: Integer -> Integer
imp2_2 3 = 4
imp2_2 x = error "imp2: premise does not apply"

s2 :: [Integer]
s2 = [0, imp1_2 (s2 !! 0), imp2_2 (s2 !! 1)]
-- Noes cadena por que se salta un eslabon el de 2 = 3,
--aparte tampoco se implementa para 0 lo que mana error



-------Exercise 3----------*


imp1_3 :: Integer -> Integer
imp1_3 0 = 1
imp1_3 x = error "imp1: premise does not apply"

imp2_3 :: Integer -> Integer
imp2_3 3 = 4
imp2_3 x = error "imp2: premise does not apply"

s_3 :: [Integer]
s_3 = [0, imp1_3 (s_3 !! 0), imp2_3 (s_3 !! 1)]


---Se obtiene [0,1,*** Exception: imp2: premise does not apply
--No es una cadena, porque en imp2 no se define el parametro 1, lo que causa el
--error "imp2:premise does not apply"

-- Exercise 4. Is the following a chain?---------------*

imp1_4 :: Integer -> Integer
imp1_4 0 = 1
imp1_4 x = error "imp1: premise does not apply"

imp2_4 :: Integer -> Integer
imp2_4 1 = 2
imp2_4 x = error "imp2: premise does not apply"

s4 :: [Integer]
s4 = [0, imp1_3 (s4 !! 1), imp2_3 (s4 !! 0)]


--no es cadena ya que es el los parametros no estan en el orden correcto



--------Exercise 5-------------*

--fun :: Integer -> Integer
--fun x = x - 1
--n :: [Integer]
--n = 0 : map fun n

---------------------------------------------------
   
fun :: Integer -> Integer
fun x = x + 1
n :: [Integer]
n = 0 : map fun n
 

-- Exercise 6. Use the following definitions, determine whether 4 is in set s,-------*
-- given 1 ? s and the induction rule x ? s ? x + 2 ? s.

fun6 :: Integer -> Integer
fun6 x = x + 2

s6 :: [Integer]
s6 = 1 : map fun6 s6
--Respuesta
--No aparece ya que se producen solo numeros impares

---------Exercise 7----------*
--Exercise 7. Fix this calculation of the positive integers:

--fun :: Integer -> Integer
--fun x = 0
--p :: [Integer]
--p = 0 : map fun p

-----------------------CORREGIDO------------------------

fun7 :: Integer -> Integer
fun7 x = x + 1
p7 :: [Integer]
p7 = 0 : map fun7 p7
 
-- Exercise 8. Fix this calculation of the positive multiples of 3:-------*

fun8 :: Integer -> Integer
fun8 x = x * 3

p8 :: [Integer]
p8 = map fun8 p8


--solucion
fun8s :: Integer -> Integer
fun8s x = x + 3

p8s :: [Integer]
p8s = 3: map fun8s p8s

-- La solucion es iniciar en 3 ademas de sumar y no multiplicar

-- Exercise 9. Here is a Haskell equation that defines the set s inductively. Is
-- 82 an element of s?

----Exercise 9----------*

s9 :: [Integer]
s9 = 0 : map ((+) 2) s9

--RESPUESTA:
--Si se incluye el 82, porque se incluyen todos los numeros pares.


-- Exercise 10. What set is defined by the following?----*

s10 :: [Integer]
s10 = 1 : map ((*) 3) s10

-- una secuencia iniciada en 1, en donde cada valor es multiplicado por 3. Inciando en [1,3,9,27,81,243...]

---- Al ejecutar> s10
-- Se obtiene[1,3,9,27,81...]
-- que son el resultado de multiplicar cada elemento por 3 (1, 1*3=3, 3*3=9, 9*3=27, 27*3=81...)


-----Exercise 11------*


octals = [0..7]
 
newOctalWords :: [Integer] -> [[Integer]]
newOctalWords xs = [x:xs | x <- octals]
 
octalWords = [[x] | x <- octals] ++ (concatMap newOctalWords octalWords)

--Se obtiene [[0],[1],[2],[3],[4],[5],[6],[7],[0,0],[1,0],[2,0],[3,0],[4,0],[5,0],[6,0],[7,0],[0,1].......]

---Exercise 12---*
--Exercise 12. Use take 10 integers1 to evaluate the first 10 integers according
--to this definition. Describe the set that is actually defined by Attempt
------------------------Attempt 1--------------------------------
build :: a -> (a -> a) -> [a]
build a f = set  
                where set = a : map f set
builds :: a -> (a -> [a]) -> [a]
builds a f = set
                where set = a : concatMap f set
nextInteger1 :: Integer -> Integer
nextInteger1 x = - x
 
integers1 :: [Integer]
integers1 = build 0 nextInteger1


----------------------RESPUESTA-----------------------------

ex12 = take 10 integers1

--solo ceros se obtienen [0,0,0,0,0,0,0,0,0,0]

--------------Exercise 13-----------------*
------------Attempt 2--------------

nextIntegers2 :: Integer -> [Integer]
nextIntegers2 x = [x + 1, x - 1]
integers2 :: [Integer]
integers2 = builds 0 nextIntegers2

--RESPUESTA

ex13=take 20 integers2
--Se obtiene   [0,1,-1,2,0,0,-2,3,1,1,-1,1,-1,-1,-3,4,2,2,0,2]
-- Cada elemento se imprime varias veces pero se busca que cada elemento se muestre en pantalla una vez 

--14-----------------------------------------------------*
-- Exercise 14. Use the computer to examine the first 10 integers generated by
-- this definition, and describe the set that is defined.

nextIntegers3 :: Integer -> [Integer]
nextIntegers3 x = [x + 1, -(x + 1)]

integers3 :: [Integer]
integers3 = builds 0 nextIntegers3

ex14 :: [Integer]
ex14 = take 10 integers3

-- se obtiene: [0,1-1,2,-2,0,0,3,-3,-1], es correcto pero se repiten elementos por lo tanto solo se deberian
--Mostrar una sola vez

--------------Exercise 15------------*
-- Exercise 15. Use the computer to generate some elements of the set defined
-- by Attempt 4, and describe the result.

------------------------Attempt 4--------------------------------
nextInteger4 :: Integer -> Integer
nextInteger4 x = if x < 0 then x - 1 else x + 1
integers4 :: [Integer]
integers4 = build 0 nextInteger4

----RESPUESTA---------------------

-- solo se obtienen numeros positovos por que 0 no es menor que 0

--16-----------------------------------------------------------------------*
-- Exercise 16. Use the computer to evaluate the first 10 elements of the set,
-- and describe the result.

nextIntegers5 :: Integer -> [Integer]
nextIntegers5 x = if x > 0 || x == 0 then [x + 1, -(x + 1)] else []

integers5 :: [Integer]
integers5 = builds 0 nextIntegers5

ex16 :: [Integer]
ex16 = take 10 integers5

-- El resultado es correcto, muestra la secuencia correcta de los numeros pos y neg



-----------------------Exercise 17------------------------------------------
-- Exercise 17. Does ints, using the following definition, enumerate the integers?
-- If it does, then you should be able to pick any integer and see it
-- eventually in the output produced by ints. Will you ever see the value

nats :: [Integer]
nats = build 0 (1 +)

negs :: [Integer]
negs = build (-1) (1 -)
ints :: [Integer]
ints = nats ++ negs

----RESPUESTA-----

--Does this definition of ints enumerate the integers?
--Si xq tiene a nats que tiene a todos los enteros positivos [0,1,2...] y a negativoss que tiene [-1,....]

--Will you ever see the value -1?
--No xq antes de verlo se tendrian que pasar todos los positivos antes de poder ver el -1



-- Exercise 18. Does twos enumerate the set of even natural numbers?

twos :: [Integer]
twos = build 0 (2 *)

-- no, solo contiene ceros por la multiplicacion por 0
-----------------------Exercise 19------------------------------------------*
--Exercise 19. What is wrong with the following definition of the stream of
--natural numbers?
nats9 = map (+ 1) nats9 ++ [0]

-- Que el caso base aparece al fin de la cadena por lo tanto no puede ser usado para iniciar la induccion.
-- Entonces la cadena no tiene un valor que sea imprimible


-----------------------Exercise 20------------------------------------------*
--Exercise 20. What is the problem with the following definition of the naturals?
naturals :: [Integer] -> [Integer]
naturals (i:acc) = naturals (i + 1:i:acc)
nats20 :: [Integer]
nats20 = naturals [0]



-- Es una ejecucion infita es decir hara lo siguiente

--  naturals(0:[])=
--  naturals(1:0:[])=
--  naturals(2:1:0:[])=
--  naturals(3:2:1:0:[])=....



-----------------------Exercise 21------------------------------------------*
--Exercise 21. Can we write a function that will take a stream of the naturals
--(appearing in any order) and give the index of a particular number?


--no se puede porque el stream primero tratará de generar una cantidad infinita de números naturales 
-- antes de poder mostrar asignar el índice al número deseado que estemos buscando.


-----------------------Exercise 22------------------------------------------*
--Exercise 22. Using induction, define the set of roots of a given number n.

--Dado un número n, el conjunto R de raíces de n es definido como sigue:
-- * n^1 E R
-- * n^(1/m) E R -> n^(1/m+1) E R
-- * Nada esta en R a menos que pueda demostrarse que está en R por un numero finito
--de usos de la base y reglas de inducción. (Es decir, cualquiera que no pueda ser creado por
--un número finito de aplicaciónes de las reglas no es una raíz)




-----------------------Exercise 23------------------------------------------*
--Exercise 23. Given the following definition, prove that n3 is in set P of powers of n.
--Definition 28. Given a number n, the set P of powers of n is defined as follows:
-- * n^0 E P
-- * n^m E P -> n^m+1 E P
-- * Nothing else is in P unless it can be shown to be in P by a finite number of uses of the base and induction rules.

---------------------RESPUESTA----------------------

--1. n^0 E P   caso base
--2. Por induccción, n^0 E P -> n1 E P y así por Modus Ponens, n^1 E P.
--3. Por inducción, n^1 E P -> n2 E P y así por Modus Ponens  n^2 E P.
--4. Por induccion, n^2 E P -> n3 E P y así por Modus Ponens, n^3 E P.


-----------------------Exercise 24------------------------------------------*
--Exercise 24. When is 0 in the set defined below?
--Definition 29. Given a number n, the set N is defined as follows:
--1. n E N
--2. m E N -> m - 2 E N
--3. Nothing is in N unless it can be shown to be in N by a finite number
--of uses of the previous rules.


------------Respuesta-------------------------
--n debe de ser un numero positivo multiple de 2 para cumplir, de otra forma no

-----------------------Exercise 25------------------------------------------*
--Exercise 25. What set is defined by the following definition?
--Definition 30. The set S is defined as follows:
--1. 1 E S
--2. n E S ^ n mod 2 = 0 -> n + 1 E S
--3. n E S ^ n mod 2 = 1 -> n + 2 E S
--4. Nothing else is in S unless it can be shown to be in S by a finite
--number of uses of the previous rules.

-------------RESPUESTA--------------------------------------
-- El conjunto definido es el conjunto de números impares.

--Caso base: 1 pertenece a S, 1 es impar.
 
--Caso inductivo: Asumiendo que cada número anterior ha sido un non,
--      n mod 2 será 1, entonces usando la regla 3: n + 2 pertenece a S
--      Desde que n es impar, n + 2 también es impar.


-----------------------Exercise 26------------------------------------------*
--Exercise 26. Prove that 4 is in the set defined as follows: 
--Definition 31. The set S is defined as follows:
--1. 0 E S
--2. n E S ^ nmod2 = 0 -> n + 2 E S
--3. n E S ^ nmod2 = 1 -> n + 1 E S
--4. Nothing is in S unless it can be shown to be in S by a finite number
--of uses of the previous rules.

-------------RESPUESTA--------------------------------------
--Por regla (1), 0 E S
--Por regla (2) 0 E S -> 2 E S  y así por Modus Ponens 2 E S.
--Por regla (2) 2 E S -> 4 E S so 4 E S. (2 mod 2=0 entonces 2+2=4, entonces 4 E S).


-----------------------Exercise 27------------------------------------------*
--Exercise 27. Given the following definition, prove that the string ?yyyy? is in YYS.
--Definition 32. The set YYS of strings containing pairs of the letter ?y? is defined as follows:
--1. ""E Y Y S
--2. s E Y Y S -> "yy"++s E Y Y S
--3. Nothing else is in YYS unless it can be shown to be in YYS by a
--finite number of uses of rules (1) and (2).

-------------RESPUESTA-----------------------
--1. "" E Y Y S
--2. "" E Y Y S -> "yy" E Y Y S y así Modus Ponens, "yy" E Y Y S.
--3. "yy" E Y Y S -> "yyyy" E Y Y S y así por Modus Ponens, "yyyy" E Y Y S.

-----------------------Exercise 28------------------------------------------*
--Exercise 28. Using data recursion, define the set of strings containing the
--letter ?z?.

ex28 = "" : map ('z':) ex28

-----------------------Exercise 29------------------------------------------*
--Exercise 29. Using induction, define the set of strings of spaces of length less
--than or equal to some positive integer n.

------------------RESPUESTA----------------------
--1. "" E SS
--2. ss E SS /\ length ss < n ->' ': ss E SS
--3. Nada pertenece a SS a menos que se demuestre que está en SS por un número finito de usos de las reglas (1) y (2).



-----------------------Exercise 30------------------------------------------*
--Exercise 30. Using recursion, define the set of strings of spaces of length less
--than or equal to length n, where n is a positive integer.


spaces :: Int -> [String]
spaces 0 = [""]
spaces n = take n (repeat ' ') : spaces (n - 1)



-----------------------Exercise 31------------------------------------------*
--Exercise 31. We could have a set that consists of all the natural numbers
--except for 2; you can write this as N - {2}. Similarly, for every natural
--number x, there is a set that contains all the natural numbers except
--for x. Now, we could make a set SSN of all of these results. Write an
--inductive definition of SSN.


------------RESPUESTA---------------------------
--1. N - {0} E SSN
--2. (N - {n}) E SSN -> (N - {n + 1} E SSN
--3. Nada esta en SSN a menos que pueda ser demostrado que está en SSN por 
--un número finito de usos de las reglas  (1) and (2).

-----------------------Exercise 32------------------------------------------*
--Exercise 32. Given the following definition, show that the set I - {-3} E SSI-.
--The set of sets of integers SSI, each of which is missing a distinct negative
--integer, is defined inductively as follows:
--1. I - {1} E SSI-
--2. I - {n} -> I - {n - 1} E SSI-
--3. Nothing else is in SSI- unless it can be shown to be in SSI- by a
--finite number of uses of rules (1) and (2).


------------RESPUESTA---------------------------

--1. I - {1} E SSI-
--2. I- {-1} -> I - {-2} E SSI-
--3. I - {-2} -> I - {-3} E SSI-
--4. Por Modus Ponens, I - {-3} E SSI-


-----------------------Exercise 33------------------------------------------*
--Exercise 33. Given the following definition, prove that -7 is in ONI. The set
--ONI of odd negative integers is defined as follows:
--1. -1 E ONI
--2. n E ONI -> n - 2 E ONI
--3. Nothing is in ONI unless it can be shown to be in ONI by a finite
--number of uses of the previous rules.

------------RESPUESTA---------------------------

--1. -1 E ONI
--2. -1 E ONI -> -3 E ONI entonces -3 E ONI
--3. -3 E ONI -> -5 E ONI entonces -5 E ONI
--4. -5 E ONI -> -7 E ONI entonces -7 E ONI



-----------------------Exercise 34------------------------------------------*
--Exercise 34. Using data recursion, define the set ni of negative integers.

------------RESPUESTA---------------------------
ni = -1 : map decrement ni
              where decrement x = x - 1

-- Al ejecutar *Main>ni
-- [-1,-2,-3,-4,-5,-6,-7,-8,.......]


-----------------------Exercise 35------------------------------------------*
--Exercise 35. If you print the elements of
--[(a,b) | a <- [0..], b <- [0..]]
--will you ever see the element (1,2)?

-------------RESPUESTA---------------

--No se ve el elemento (1,2) xq el 0 debe ser emparejado con cada elemento en [0..], pero
--este emparejamiento no tiene fin, por lo que no se visualizará el elemento (1,2).


-----------------------Exercise 36------------------------------------------*
--Exercise 36. What set is given by the following definition?
--Definition 33. The set S is defined as follows:

 -- 1. 1 E S
 -- 2. n E S -> n - n E S
 -- 3. Nothing is in S unless it can be shown to be in S by a finite number
 -- of uses of the previous rules.

---------------RESPUESTA---------------------

-- El conjunto {0,1}
-- 1 E S -> 1 - 1 = 0 E S
-- 0-0 = 0 E S
