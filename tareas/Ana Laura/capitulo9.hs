-- Exercise 1. Is the following a chain? You can test your conclusions by evaluating
-- s in each case.

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

-- De acuerdo al resultado obtenido, se concluye que si es una cadena. Por que como resultado
-- se obtiene una lista con los siguientes valores [1,2,3,4]

-- Exercise 2. Is the following a chain?

imp1a :: Integer -> Integer
imp1a 1 = 2
imp1a x = error "imp1: premise does not apply"

imp2a :: Integer -> Integer
imp2a 3 = 4
imp2a x = error "imp2: premise does not apply"

s2 :: [Integer]
s2 = [0, imp1a (s2 !! 0), imp2a (s2 !! 1)]

-- No es una cadena, por que no se tiene una implementacion cuando se tiene un valor
-- inicial de 0, por lo tanto se genera un error en la secuencia.

-- Exercise 3. Is the following a chain?

imp1b :: Integer -> Integer
imp1b 0 = 1
imp1b x = error "imp1: premise does not apply"

imp2b :: Integer -> Integer
imp2b 3 = 4
imp2b x = error "imp2: premise does not apply"

s3 :: [Integer]
s3 = [0, imp1b (s3 !! 0), imp2b (s3 !! 1)]


-- no es cadena, por que no se tiene una implementacion cuando el valor de 2, por lo tanto 
-- se cumple con la secuencia.


-- Exercise 4. Is the following a chain?

imp1c :: Integer -> Integer
imp1c 0 = 1
imp1c x = error "imp1: premise does not apply"

imp2c :: Integer -> Integer
imp2c 1 = 2
imp2c x = error "imp2: premise does not apply"

s4 :: [Integer]
s4 = [0, imp1c (s4 !! 1), imp2c (s4 !! 0)]


-- no es cadena, porque se produce un loop cuando se apunta o hacer referencia al 
--  valor en la posicion 1 que es el mismo.


-- ejemplo

increment :: Integer -> Integer
increment x = x + 1

se :: [Integer]
se = [0, increment (se !! 0), increment (se !! 1)]

s' :: [Integer]
s' = 0 : map increment s'

-- Exercise 5. Given the base case 0 ∈ n and the induction rule x ∈ n → x+1 ∈
-- n, fix the following calculation so that 3 is in set n:

fun :: Integer -> Integer
fun x = x + 1

n :: [Integer]
n = 0 : map fun n

-- se modifico la regla, ya que se restaba y en la regla se debia de sumar para que el valor 
-- 3 apareciera en la lista resultante.


-- Exercise 6. Use the following definitions, determine whether 4 is in set s,
-- given 1 ∈ s and the induction rule x ∈ s → x + 2 ∈ s.

fun6 :: Integer -> Integer
fun6 x = x + 2

s6 :: [Integer]
s6 = 1 : map fun6 s6

s6' = 0 : map fun6 s6'

-- de acuerdo a la base inicial, el numero cuatro no aparece en la lista resultate
-- esto por que de acuerdo a la base que comienzan en 1, muestra los numeros impares
-- por lo tanto se cambio la base en s6' para que iniciara en 0 y asi mostrar los numero
-- pares

-- Exercise 7. Fix this calculation of the positive integers:
fun7 :: Integer -> Integer
fun7 x = 0

p7 :: [Integer]
p7 = 0 : map fun7 p7

-- solucion
fun7' :: Integer -> Integer
fun7' x = x+1

p :: [Integer]
p = 1 : map fun7' p

-- La solucion es en la regla asignar una sema de los valores y poner la base con un valor
-- inicial de 1, esto para mostrar los enteros positivos.

-- Exercise 8. Fix this calculation of the positive multiples of 3:

fun8 :: Integer -> Integer
fun8 x = x * 3

p8 :: [Integer]
p8 = map fun8 p8


--solucion
fun8' :: Integer -> Integer
fun8' x = x + 3

p8' :: [Integer]
p8' = 3: map fun8' p8'

-- La solucion es iniciar la secuencia en 3, teniendo como valor inicial el 3
-- y en la regla modificar para que sume 3 y no lo multipleque.

-- Exercise 9. Here is a Haskell equation that defines the set s inductively. Is
-- 82 an element of s?

s9 :: [Integer]
s9 = 0 : map ((+) 2) s9

-- 82 es un elemento de s, por que es un numero par, de acuerdo a la funcion ya 
-- que inicia desde el numero 0 y se van sumando 2 a cada valor, este muestra un conjunto
-- numeros pares.


-- Exercise 10. What set is defined by the following?

s10 :: [Integer]
s10 = 1 : map ((*) 3) s10

-- una secuencia iniciada en 1, en donde cada valor es multiplicado por 3. Inciando en [1,3,9,27,81,243...]

-- ejemplo

newBinaryWords :: [Integer] -> [[Integer]]
newBinaryWords ys = [0 : ys, 1 : ys]

mappend :: (a -> [b]) -> [a] -> [b]
mappend f [] = []
mappend f (x:xs) = f x ++ mappend f xs

binWords = [0] : [1] : (mappend newBinaryWords binWords)

-- Exercise 11. Alter the definition of newBinaryWords and binWords so that
-- they produce all of the octal numbers. An octal number is one that
-- contains only the digits 0 through 7.

newOctalWord :: [Integer] -> [[Integer]]
newOctalWord ys = [0: ys, 1: ys, 2: ys, 3: ys, 4: ys, 5: ys, 6: ys, 7: ys]

octalWord = [0] : [1] : [2] : [3] : [4] : [5] : [6] : [7]: (mappend newOctalWord octalWord) 

-- Ejemplo 

type Set a = [a]

build :: a -> (a -> a) -> Set a
build a f = set where set = a : map f set

builds :: a -> (a -> [a]) -> Set a
builds a f = set where set = a : mappend f set

nextInteger1 :: Integer -> Integer
nextInteger1 x = -x

integers1 :: [Integer]
integers1 = build 0 nextInteger1

-- Exercise 12. Use take 10 integers1 to evaluate the first 10 integers according
-- to this definition. Describe the set that is actually defined by Attempt
-- 1.

ex12:: [Integer]
ex12 = take 10 integers1

-- de acuerdo a la definicion de Attempt 1 el resultado es una lista que contiene solamente 0s
-- esto por que 0 es un numero de I


--Attempt 2
nextIntegers2 :: Integer -> [Integer]
nextIntegers2 x = [x + 1, x - 1]

integers2 :: [Integer]
integers2 = builds 0 nextIntegers2

-- Exercise 13. Use take 20 integers2 to evaluate the first 20 integers according
-- to this definition. Describe the set that is actually defined by Attempt
-- 2.

ex13:: [Integer]
ex13 = take 20 integers2

-- La lista resultante es la siguiente [0,1,-1,2,0,0,-2,3,1,1,-1,1,-1,-1,-3,4,2,2,0,2]
-- la solucion si da los numero tanto positivos como negativos de manera intercalada
-- el problema esta en que se repiten algunos numeros, y no permiten que se vea de una manera
-- clara la definicion que se quiere representar.



-- Exercise 14. Use the computer to examine the first 10 integers generated by
-- this definition, and describe the set that is defined.

nextIntegers3 :: Integer -> [Integer]
nextIntegers3 x = [x + 1, -(x + 1)]

integers3 :: [Integer]
integers3 = builds 0 nextIntegers3

ex14 :: [Integer]
ex14 = take 10 integers3

-- La lista resultante es la siguiente : [0,1-1,2,-2,0,0,3,-3,-1]
-- De cierta manera esta correcto, solo que se repiten algunos elementos como por ejemplo el 0
-- este deberia solamente mostrarlos solamente una vez cada numero.


-- Exercise 15. Use the computer to generate some elements of the set defined
-- by Attempt 4, and describe the result.

nextInteger4 :: Integer -> Integer
nextInteger4 x = if x < 0 then x - 1 else x + 1

integers4 :: [Integer]
integers4 = build 0 nextInteger4

ex15 :: [Integer]
ex15 = take 20 integers4

-- la lista resultante muestra solamente los valores enteros positivos, ademas del cero, 
-- faltando los numeros negativos.


-- Exercise 16. Use the computer to evaluate the first 10 elements of the set,
-- and describe the result.

nextIntegers5 :: Integer -> [Integer]
nextIntegers5 x = if x > 0 || x == 0 then [x + 1, -(x + 1)] else []

integers5 :: [Integer]
integers5 = builds 0 nextIntegers5

ex16 :: [Integer]
ex16 = take 10 integers5

-- El arreglo resultante es correcto, muestra la secuencia correcta de los numeros
-- tanto positivos y negativos


-- Exercise 17. Does ints, using the following definition, enumerate the integers?
-- If it does, then you should be able to pick any integer and see it
-- eventually in the output produced by ints. Will you ever see the value
-- -1?

nats :: [Integer]
nats = build 0 (1 +)

negs :: [Integer]
negs = build (-1) (1 -)

ints :: [Integer]
ints = nats ++ negs


-- No se logra ver el -1 en la lista, esto debido a que primero son mostrads los numeros naturales, es decir 
-- de la parte positiva, si se toman los primeros 10 numeros tanto de nats como de negs, pordemos 
-- ver que de la parte de nats son la parte positiva, mientras que los de negs, solo se tienen valores de -1 y 2
-- teniendo mal la definicion de la parte negativa. Por lo tanto no, muestra todos los valores enteros.


-- Exercise 18. Does twos enumerate the set of even natural numbers?

twos :: [Integer]
twos = build 0 (2 *)

-- la lista resultante un conjunto de 0s, esto por que al construir la lista, se multiplica por cero, 
-- por lo tanto este es llenado solamente con un valor de cero.


-- Exercise 19. What is wrong with the following definition of the stream of
-- natural numbers?

nats2:: [Integer]
nats2 = 1: map (+ 1) nats2

-- para obtener los numeros naturales, falta agregar la concatenacion al inicio del numero 1, falta el caso base, partiendo
-- de 1.



-- Exercise 20. What is the problem with the following definition of the naturals?

naturals :: [Integer] -> [Integer]
naturals (i:acc) = naturals (i + 1:i:acc)

nats3 :: [Integer]
nats3 = naturals [0]

-- Esta funcion, se queda en un loop infinito y nunca da una lista de salida, es decir como se le esta pasando
-- de el valor de 0, la funcion se queda esperando la cola de la lista


-- Exercise 21. Can we write a function that will take a stream of the naturals
-- (appearing in any order) and give the index of a particular number?

-- no por que como los numeros pueden aparecer en cualquier orden, y estos no estan ordenados
-- el indice no nos indicara un numero en orden. Puede haber una infinidad de numeros antes de
-- poder encontrar el numero que queremos.


-- Exercise 22. Using induction, define the set of roots of a given number n.

-- Base case:
-- n ∈ S 

-- Induction case: 
-- n^(1/m) ∈ S → n^(1/(m+1)) ∈ S

-- Extremal clause
-- nada es un elemento de la serie S, a menos que se puede construir con un número finito 
-- de usos de los casos base y de inducción.


-- Exercise 23. Given the following definition, prove that n^3 is in set P of powers
-- of n.
-- Definition 28. Given a number n, the set P of powers of n is defined
-- as follows:

{-- • n^0 ∈ P
    • n^m ∈ P → n^m+1 ∈ P
    • Nothing else is in P unless it can be shown to be in P by a finite number of uses of the base and induction rules.-}


-- Caso base
-- n^0 ∈ P
-- caso de induccion
-- n^m ∈ P → n^m+1 ∈ P

-- prueba
-- n^0 ∈ P → n^1 ∈ P
-- n^1 ∈ P → n^2 ∈ P
-- n^2 ∈ P → n^3 ∈ P

-- Como se observa en la prueba anterior el elemento n^3 si pertene al conjunto P


{-- Exercise 24. When is 0 in the set defined below?

Definition 29. Given a number n, the set N is defined as follows:
• n ∈ N
• m ∈ N → m − 2 ∈ N
• Nothing is in N unless it can be shown to be in N by a finite number
of uses of the previous rules.-}

-- se tiene en el conjunto de N, cuando el valor de m tiene un valor de 2,
-- cuando esto se cumple se tiene el valor de 0 en el conjunto N


{-- Exercise 25. What set is defined by the following definition?

Definition 30. The set S is defined as follows:
• 1 ∈ S
• n ∈ S ∧ n mod 2 = 0 → n + 1 ∈ S
• n ∈ S ∧ n mod 2 = 1 → n + 2 ∈ S
• Nothing else is in S unless it can be shown to be in S by a finite
number of uses of the previous rules.-}

imp25 :: Integer -> Integer
imp25 n = if n `mod` 2 == 0 then n+1 else n+2

s25 :: [Integer]
s25 = [1, imp25 (s25 !! 0), imp25 (s25 !! 1), imp25 (s25 !! 2), imp25 (s25 !! 3)]

-- De acuerdo a la definicion anterior el conjunto resultante es una lista con los
-- numeros impares. Se realizo la funcion s25 para comprobar la definicion.



{-- Exercise 26. Prove that 4 is in the set defined as follows:
Definition 31. The set S is defined as follows:
1. 0 ∈ S
2. n ∈ S ∧ n mod 2 = 0 → n + 2 ∈ S
3. n ∈ S ∧ n mod 2 = 1 → n + 1 ∈ S
4. Nothing is in S unless it can be shown to be in S by a finite number
of uses of the previous rules.-}

imp26 :: Integer -> Integer
imp26 n = if n `mod` 2 == 0 then n+2 else n+1

s26 :: [Integer]
s26 = [0, imp26 (s26 !! 0), imp26 (s26 !! 1), imp26 (s26 !! 2), imp26 (s26 !! 3)]


-- De acuerdo a la definicion de la parte de arriba, se realizo una funcion para mostrar los datos
-- los valores resultantes son los numeros pares partiendo del cero, por lo tanto el numero 4 es 
-- parte del conjunto S.

-- si n=2 y 2 ∈ S.
-- 2 mod 2 = 0 → 2+2 ∈ S.

-- De igual manera se probo que el numero 4 pertece al conjunto S 



{--Exercise 27. Given the following definition, prove that the string ‘yyyy’ is in
YYS.
Definition 32. The set YYS of strings containing pairs of the letter ’y’
is defined as follows:
1. ""∈ Y Y S
2. s ∈ Y Y S → "yy"++s ∈ Y Y S
3. Nothing else is in YYS unless it can be shown to be in YYS by a
finite number of uses of rules (1) and (2).-}


-- caso base
-- " " ∈ YYS

-- Caso inductivo
-- " " ∈ YYS → "yy" ++ " " ∈ YYS
-- "yy" ∈ YYS → "yy" ++ "yy" ∈ YYS

-- de acuerdo a la definicion anterior la cadena "yyyy" pertenece al conjunto YYS
-- esto se comprobo en la prueba de arriba.


{--Exercise 28. Using data recursion, define the set of strings containing the
letter ‘z’.-}

ex28:: [String]
ex28 = "" : map ('z':) ex28


{--Exercise 29. Using induction, define the set of strings of spaces of length less
than or equal to some positive integer n.-}

-- caso base
-- " " ∈ YYS

-- caso inductivo
-- s ∈ YYS ∧ length s < n → '':s ∈ YYS

-- Extremal clause
-- nada es un elemento del conjunto YYS, a menos que se puede construir con un número finito 
-- de usos de los casos base y de inducción.



{--Exercise 30. Using recursion, define the set of strings of spaces of length less
than or equal to length n, where n is a positive integer.-}

ex30 :: Integer -> [String]
ex30 0 = []
ex30 n = "" : map (' ':) (ex30 (n-1) )


{-- Exercise 31. We could have a set that consists of all the natural numbers
except for 2; you can write this as N − {2}. Similarly, for every natural
number x, there is a set that contains all the natural numbers except
for x. Now, we could make a set SSN of all of these results. Write an
inductive definition of SSN.-}

-- caso base
-- N − {0} ∈ SSN

-- caso inductivo
-- N − {n} ∈ SSN → N − {n+1} ∈ SSN 

-- -- Extremal clause
-- nada es un elemento del conjunto SSN, a menos que se puede construir con un número finito 
-- de usos de los casos base y de inducción.



{-- Exercise 32. Given the following definition, show that the set I − {−3} ∈
SSI−.
The set of sets of integers SSI, each of which is missing a distinct negative
integer, is defined inductively as follows:
1. I − {−1} ∈ SSI−
2. I − {n} → I − {n − 1} ∈ SSI−
3. Nothing else is in SSI- unless it can be shown to be in SSI- by a
finite number of uses of rules (1) and (2).-}

-- Mostrar que I − {−3} ∈ SSI−

-- I − {−1} ∈ SSI−
-- I − {-1} → I − {− 2} ∈ SSI−
-- I − {-2} → I − {− 3} ∈ SSI−

-- De acuerdo a la demostracion anterior, se puede establecer que I − {− 3} ∈ SSI−


{-- Exercise 33. Given the following definition, prove that -7 is in ONI. The set
ONI of odd negative integers is defined as follows:

1. −1 ∈ ONI
2. n ∈ ONI → n − 2 ∈ ONI
3. Nothing is in ONI unless it can be shown to be in ONI by a finite
number of uses of the previous rules.-}

--prove that -7 is in ONI
-- −1 ∈ ONI
-- -1 ∈ ONI → − 3 ∈ ONI
-- -3 ∈ ONI → − 5 ∈ ONI
-- -5 ∈ ONI → − 7 ∈ ONI

-- De acuerdo a la demostracion anterior se puede establecer que el numero -7 pertenece
-- al conjunto de ONI


-- Exercise 34. Using data recursion, define the set ni of negative integers.

base34:: Integer -> Integer
base34 x = x - 1

ex34:: [Integer]
ex34 = -1: map base34 ex34


{-- Exercise 35. If you print the elements of
[(a,b) | a <- [0..], b <- [0..]]
will you ever see the element (1,2)?-}

-- se puede observar el conjuto de (1,2) por que la lista de a inicia desde cero hasta 
-- infinito, entonces para formar los conjutnos, es el valor del primer numero con todos
-- los valores de la lista b, esto para poder pasar al sigueinte numero de la lista a.
-- por lo tanto no es posible observar el conjunto (1,2) por que se tienen listas infinitas.


{--Exercise 36. What set is given by the following definition?
Definition 33. The set S is defined as follows:
1. 1 ∈ S
2. n ∈ S → n − n ∈ S
3. Nothing is in S unless it can be shown to be in S by a finite number
of uses of the previous rules.-}

-- 1 ∈ S
-- 1 ∈ S → 1 − 1 ∈ S

-- De acuerdo a lo anterior se puede observar que el conjutno resultante es con los 
-- valores {0,1} solamente de acuerdo a la definicion del conjunto.
