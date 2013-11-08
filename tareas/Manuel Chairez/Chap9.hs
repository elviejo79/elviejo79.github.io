{-Exercise 1.Is the following a chain? You can test your conclusions by evaluating s in each case-}

imp1 :: Integer -> Integer
imp1 1=2
imp1 x = error "imp1: premise does not apply"

imp2 :: Integer -> Integer
imp2 2=3
imp2 x = error "imp2: premise does not apply"

imp3 :: Integer -> Integer
imp3 3=4
imp3 x = error "imp3: premise does not apply"

s :: [Integer]
s = [1, imp1 (s !! 0), imp2 (s !! 1), imp3 (s !! 2)]

--R = SI ES UNA CADENA (CHAIN)





{-Exercise 2.Is the following a chain?-}

imp1' :: Integer -> Integer
imp1' 1=2
imp1' x = error "imp1: premise does not apply"

imp2' :: Integer -> Integer
imp2' 3=4
imp2' x = error "imp2: premise does not apply"

s' :: [Integer]
s' = [0, imp1' (s' !! 0), imp2' (s' !! 1)]

--R = NO ES UNA CHAIN. No existe una implicación para s' !! 0 => imp1'(0)





{--Exercise 3.Is the following a chain?-}
imp1'' :: Integer -> Integer
imp1'' 0=1
imp1'' x = error "imp1: premise does not apply"

imp2'' :: Integer -> Integer
imp2'' 3=4
imp2'' x = error "imp2: premise does not apply"

s'' :: [Integer]
s'' = [0, imp1'' (s'' !! 0), imp2'' (s'' !! 1)]

--R = NO ES UNA CHAIN. No existe una implicación para s'' !! 1 => imp2''(1)





{-Exercise 4.Is the following a chain?-}
imp1''' :: Integer -> Integer
imp1''' 0=1
imp1''' x = error "imp1: premise does not apply"

imp2''' :: Integer -> Integer
imp2''' 1=2
imp2''' x = error "imp2: premise does not apply"

s''' :: [Integer]
s''' = [0, imp1''' (s''' !! 1), imp2''' (s''' !! 0)]

--R = NO ES UNA CHAIN. La implicación se cicla porque la segunda implicación hace llamada hacia si mismo (elemento en la misma posición que aun no existe)






{- Exercise 5.Given the base case 0∈n and the induction rule x∈n→x+1∈n, fix the following calculation so that 3 is in set n:-}
fun :: Integer -> Integer
fun x=x-1

fun' :: Integer -> Integer
fun' x=x+1

n :: [Integer]
n = 0:map fun' n

--R = Es necesario cambiar el signo a "+" en el calculo de la función "fun"





{-Exercise 6.Use the following definitions, determine whether 4 is in set s, given 1∈s and the induction rule x∈s→x+2∈s.-}
fun'' :: Integer -> Integer
fun'' x=x+2

n' :: [Integer]
n'=0:map fun'' n'

--R= EL ELEMENTO 4 ESTARÁ EN EL CONJUNTO SOLO SI LA PRUEBA DE INDUCCIÓN SE INICIA EN 0, ES DECIR: n'=0:map fun'' n'




{-Exercise 7.Fix this calculation of the positive integers:-}
fun''' :: Integer -> Integer
--fun''' x=0
fun''' x=x+1
p :: [Integer]
p=1:map fun''' p
--R= FIX: CAMBIAR LA EVALUACIÓN fun''' x=0 EN LA FUNCIÓN "fun'''" POR fun''' x=x+1; y la concatenación debe iniciar en 1, es decir: 1:map fun''' p




{-Exercise 8.Fix this calculation of the positive multiples of 3:-}
fun8 :: Integer -> Integer
--fun8 x=x*3:
fun8 x=x+3

p8 :: [Integer]
p8 = 3:map fun8 p8
--R = FIX: CAMBIAR LA EVALUACIÓN fun8 x=x*3 EN LA FUNCIÓN fun8 POR fun8 x=x+3. SUMAR EN LUGAR DE MULTIPLICAR 
-- Y AGREGAR LA CONCATENACIÓN EN LA INDUCCIÓN PARA QUE INICIE EN 3



{-Exercise 9.Here is a Haskell equation that defines the setsinductively. Is 82 an element of s?-}
s9 :: [Integer]
s9=0:map((+) 2) s9
--R = EL CONJUNTO INICIA EN 0 Y CONCATENARA TODOS LOS NÚMEROS PARES, POR LO TANTO 82 PERTENECE AL CONJUNTO. 



{-Exercise 10.What set is defined by the following?-}
s10 :: [Integer]
s10=1:map((*) 3) s10
--R = INICIANDO EN 1, EL CONJUNTO ESTARÁ FORMADO POR EL NÚMERO ANTECESOR MULTIPLICADO POR 3.
--[1,3,9,27,81,243,729,2187,6561,19683,59049,177147,531441,1594323,4782969,14348907,43046721,129140163, ..]


{-Exercise 11.Alter the definition of newBinaryWords and binWords so that they produce all of the octal numbers. An octal number is one that 
contains only the digits 0 through 7-}
newBinaryWords :: [Integer] -> [[Integer]]
newBinaryWords ys = [0 : ys,1:ys]

mappend :: (a -> [b]) -> [a] -> [b]
mappend f [] = []
mappend f (x:xs)=f x++mappend f xs

binWords = [0] : [7] :(mappend newBinaryWords binWords)


{-Exercise 12.Use take 10 integers1 to evaluate the first 10 integers according to this definition. 
Describe the set that is actually defined by Attempt 1.-}
type Set a = [a];

build :: a -> (a -> a) -> Set a
build a f = set where set = a : map f set

nextInteger1 :: Integer -> Integer
nextInteger1 x= -x

integers1 :: [Integer]
integers1 = build 0 nextInteger1

--R = take 10 integers1 = [0,0,0,0,0,0,0,0,0,0]
-- DE ACUERDO A "ATTEMP 1": EL CASO BASE INDICA QUE 0 PERTENECE AL CONJUNTO I; EL CASO DE INDUCCIÓN INDICA QUE SI X PERTENECE AL CONJUNTO I, IMPLICA
-- QUE EL NEGATIVO DE X TAMBIÉN PERTENECE AL CONJUNTO I; EL PROBLEMA ES QUE EL ATTEMP1 ESTA MAL DEFINIDO YA QUE EN EL CASO DE EJEMPLO, SOLO EL 0 FORMARÁ
-- PARTE DEL CONJUNTO.




{-Exercise 13.Use take 20 integers2 to evaluate the first 20 integers according to this definition. 
Describe the set that is actually defined by Attempt 2.-}

builds :: a -> (a -> [a]) -> Set a
builds a f=set where set=a:mappend f set

nextIntegers2 :: Integer -> [Integer]
nextIntegers2 x=[x+1,x-1]

integers2 :: [Integer]
integers2 = builds 0 nextIntegers2

--take 20 integers2 = [0,1,-1,2,0,0,-2,3,1,1,-1,1,-1,-1,-3,4,2,2,0,2]
-- EL CASO BASE ES 0 QUE PERTENECE AL CONJUNTO I; PARA CADA ELEMENTO DEL CONJUNTO GENERADO (INICIANDO EN CERO) SE CONCATENARÁN 2 ELEMENTOS MAS,
-- UNO DE ELLOS RESULTADO DE SUMARLE 1 AL ELEMENTO ORIGEN, Y EL SIGUIENTE DE RESTARLE 1 AL ELEMENTO ORIGEN.


{-Exercise 14.Use the computer to examine the first 10 integers generated by this definition, and describe the set that is defined.-}
nextIntegers3 :: Integer -> [Integer]
nextIntegers3 x=[x+1,-(x+1)]

integers3 :: [Integer]
integers3 = builds 0 nextIntegers3
-- take 10 integers3 = [0,1,-1,2,-2,0,0,3,-3,-1]
-- EL CONJUNTO GENERADO ES UNA DE LAS RUTAS PARA REPARAR UN LIGERO FALLO DEL EJERCICIO 13; EN ESTE CASO SE REALIZA EL INCREMENTO EN AMBOS SUBPARES GENERADOS
-- A PARTIR DEL ELEMENTO ORIGEN, SALVO QUE A UNO DE ELLOS LUEGO DEL INCREMENTO EN 1 SE LE REALIZA EL CAMBIO DE SIGNO, DE ESTE MODO, CADA ELEMENTO ES
-- INTRODUCIDO UNA VEZ CADA DEFINICIÓN, SIN EMBARGO AUN NO SE LLEGA A QUE CADA ELEMENTO SEA INTRODUCIDO PRECISAMENTE SOLO UNA VEZ.


{-Exercise 15.Use the computer to generate some elements of the set defined by Attempt 4, and describe the result.-}

nextInteger4 :: Integer -> Integer
nextInteger4 x=if x<0 then x-1 else x+1
integers4 :: [Integer]
integers4 = build 0 nextInteger4
--take 10 integers4 = [0,1,2,3,4,5,6,7,8,9]
--LA REGLA DEL CASO BASE ES RESTRICTIVA YA QUE PARA TODOS LOS ELEMENTOS DEL CONJUNTO SE ENTRARA SOLO AL ELSE, DE ESTE MODO ESTA CONSTRUYENDO EL CONJUNTO
--DE MANERA INCREMENTAL EN BASE A CADA ELEMENTO ORIGEN; DE IGUAL FORMA SE ESTA INICIANDO EL CONJUNTO CON EL ELEMENTO ORIGEN EN 0, POR LO CUAL SIEMPRE SERÁN
--POSITIVOS.


{-Exercise 16.Use the computer to evaluate the first 10 elements of the set, and describe the result.-}
nextIntegers5 :: Integer -> [Integer]
nextIntegers5 x=if x>0 || x==0 then [x + 1, -(x + 1)] else []
integers5 :: [Integer]
integers5 = builds 0 nextIntegers5
-- take 10 integers5 = [0,1,-1,2,-2,3,-3,4,-4,5]
-- EN ESTA DEFINICIÓN SE LLEGA A LA FORMA EXACTA QUE EL METODO ORIGINAL SUGIERE PARA GENERAR UN CONJUNTO CON LOS NÚMEROS ENTEROS, INCLUIDOS UNA SOLA VEZ,
-- SU FORMA POSITIVA Y NEGATIVA.


{-Exercise 17.Does ints, using the following definition, 
enumerate the integers? 
If it does, then you should be able to pick any integer and see it
eventually in the output produced by ints. 
Will you ever see the value -1?
-}
nats :: [Integer]
nats = build 0 (1 +)

negs :: [Integer]
negs = build (-1) (1 -)

ints :: [Integer]
ints = nats ++ negs
-- R = Solo enumera los enteros positivos.
-- R = Esto se comprueba al evaluar que el valor -1 nunca es visto en la salida del conjunto

{-Exercise 18.Does twos enumerate the set of even natural numbers?-}
twos :: [Integer]
twos = build 0 (2 *)
--R = NO, YA QUE LA GENERACIÓN DEL CONJUNTO INICIA EN 0, POR LO CUAL LA MULTIPLICACIÓN POR 2 HACIA EL ELEMENTO ORIGEN SIEMPRE RESULTARÁ EN 0


{-Exercise 19.What is wrong with the following definition of the stream of natural numbers?-}
nats19 = map (+ 1) nats19 ++ [0]
-- R = LA CONCATENACIÓN DEL ELEMENTO ORIGEN ESTA AL REVES, DEBERÍA SER: [0] ++ map (+ 1) nats19

{-Exercise 20.What is the problem with the following definition of the naturals?-}

naturals :: [Integer] -> [Integer]
naturals (i:acc) = naturals (i + 1:i:acc)

nats20 :: [Integer]
nats20 = naturals [0]
--R = Nunca terminará y devolverá el acumulador.


{-
Exercise 21.Can we write a function that will take a stream of the naturals
(appearing in any order) and give the index of a particular number?
-- R = NO YA QUE AL ESTAR PRESENTADO EN CUALQUIER ORDEN, ES POSIBLE QUE ANTES DEL NÚMERO DEL CUAL ESTAMOS BUSCANDO EL INDICE,
EXISTA UN INFINITO DE NUMEROS NATURALES.


Exercise 22.Using induction, define the set of roots of a given numbern.
Caso base: n^1∈R
Caso de inducción:n^(1/m)∈R→n^(1/m+1)∈R
Clausula extremal:Nada esta en R a menos que pueda demostrarse que esta en R por un número finito de uso de las reglas de inducción.

Exercise 23.Given the following definition, prove that n^3 is in set P of powers of n.
Definition 28.Given a numbern, the set P of powers of n is defined as follows:
•n^0 ∈P
•n^m ∈P→n^m+1 ∈P
•Nothing else is in P unless it can be shown to be in P by a finite number of uses of the base and induction rules.

1. n^0 ∈P by the base case
2. Por la regla de inducción:n^0∈P →n^1∈P
3. Por la regla de inducción:n^1∈P →n^2∈P
4. Por la regla de inducción:n^2∈P →n^3∈P


Exercise 24.When is 0 in the set defined below?
Definition 29.Given a number n, the set N is defined as follows:
•n∈N
•m∈N→m−2∈N
•Nothing is in N unless it can be shown to be in N by a finite number of uses of the previous rules.

R= SOLO CUANDO n SEA UN MULTIPLO POSITIVO DE 2


Exercise 25.What set is defined by the following definition?
Definition 30.The set S is defined as follows:
•1∈S
•n∈S∧n mod 2=0→n+1∈S
•n∈S∧n mod 2=1→n+2∈S
•Nothing else is in S unless it can be shown to be in S by a finite
number of uses of the previous rules.

R=LOS NÚMEROS ENTEROS IMPARES.



Exercise 26.Prove that 4 is in the set defined as follows:
Definition 31.The set S is defined as follows:
1. 0∈S
2. n∈S∧n mod 2=0→n+2∈S
3. n∈S∧n mod 2=1→n+1∈S
4. Nothing is in S unless it can be shown to be in S by a finite number of uses of the previous rules
R= 
	REGLA 1: 0∈S
	REGLA 2: 0∈S→2∈S
	REGLA 2: 0∈S→4∈S
				  -----


Exercise 27.Given the following definition, prove that the string ‘yyyy’ is in YYS.
Definition 32.The set YYS of strings containing pairs of the letter ’y’ is defined as follows:
1.""∈YYS
2. s∈YYS→"yy"++s∈YYS
3. Nothing else is in YYS unless it can be shown to be in YYS by a
finite number of uses of rules (1) and (2).

1."" ∈ YYS
2."" ∈ YYS → "yy" ∈ YYS
3."yy" ∈ YYS → "yyyy" ∈ YYS


Exercise 28.Using data recursion, define the set of strings containing the letter ‘z’.
zs = "" : map ('z':) zs




Exercise 29.Using induction, define the set of strings of spaces of length less than or equal to some positive integer n.
1. " " ∈ Strings
2. ss ∈ Strings ∧length ss < n → ' ' : ss∈SS
3. Nada esta en Strings a menos que pueda ser comprobado en Strings por un uso finito de las reglas 1 y 2.


Exercise 30.Using recursion, define the set of strings of spaces of length less
than or equal to length n,where n is a positive integer.
-}
ss :: Int -> String
ss 0=[]
ss n = take n (repeat ' ')

{-


Exercise 31.We could have a set that consists of all the natural numbers except for 2; you can write this as N−{2}. Similarly, for every natural
number x, there is a set that contains all the natural numbers except for x. Now, we could make a set SSN of all of these results. Write an
inductive definition of SSN.
	1. N−{0}∈SSN
	2. (N−{n})∈SSN →(N−{n+1}∈SSN
	3. Nada esta en SSN a menos que pueda ser comprobado que esta en SSN por un uso finito de las reglas 1 y 2.



Exercise 32.Given the following definition, show that the setI −{−3}∈SSI−.
The set of sets of integers SSI, each of which is missing a distinct negative
integer, is defined inductively as follows:
1. I −{−1}∈SSI−
2. I −{n}→I −{n−1}∈SSI−
3. Nothing else is in SSI- unless it can be shown to be in SSI- by a finite number of uses of rules (1) and (2).

1. I −{−1}∈SSI−
2. I −{−1}→I −{−2}∈SSI−
3. I −{−2}→I −{−3}∈SSI−
4. Por Modus Ponens, I −{−3}∈SSI−.
                     --------------


Exercise 33.Given the following definition, prove that -7 is in ONI. The set ONI of odd negative integers is defined as follows:
1. −1∈ONI
2. n∈ONI→n−2∈ONI
3. Nothing is in ONI unless it can be shown to be in ONI by a finite number of uses of the previous rules.
	1.−1∈ONI
	2.−1∈ONI→−3∈ONI por lo tanto −3∈ONI.
	3.−3∈ONI→−5∈ONI por lo tanto −5∈ONI.
	4.−5∈ONI→−7∈ONI por lo tanto −7∈ONI.



Exercise 34.Using data recursion, define the set ni of negative integers.
-}

dec :: Integer -> Integer
dec x=x-1
ni = -1 : map dec ni



{-
Exercise 35.If you print the elements of [(a,b)|a<-[0..], b <- [0..]] will you ever see the element(1,2)?
	R = No ya que primero el 0 se generar en duplas con los números infinitos.



Exercise 36.What set is given by the following definition?
Definition 33.The set S is defined as follows:
1. 1∈S
2. n∈S→n−n∈S
3. Nothing is in S unless it can be shown to be in S by a finite number of uses of the previous rules.

	R= Conjunto => {0,1}

-}