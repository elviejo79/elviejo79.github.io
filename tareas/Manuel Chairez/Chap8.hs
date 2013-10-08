--417

{-Exercise 1.Given the sets A={1,2,3,4,5}and B={2,4,6}, calculate the following sets:
(a) A u (B n A) = {1,2,3,4,5} u {2,4} = {1,2,3,4,5}	
(b) (A n B) u B = {2,4} u {2,4,6} = {2,4,6}
(c) A−B = {1,3,5}
(d) (B−A) n B = {6} n {2,4,6} = {6}
(e) A u (B−A) = {1,2,3,4,5} u {6} = {1,2,3,4,5,6}
-}

type Set a = [a];

{-Excersise 2-Work out the values of the following set expressions, and then
check your answer using the Haskell expression that follows.-}
(+++) :: Eq a => Set a -> Set a -> Set a
(+++) conjA conjB = foldr agregar conjA conjB where agregar new acc = if new `elem` acc then acc else new : acc

(***) :: Eq a => Set a -> Set a -> Set a
(***) conjA conjB = foldr intersect [] conjB  where intersect new acc = if new `elem` conjA then new:acc else acc

dif :: Eq a => Set a -> Set a -> Set a
dif conjA conjB = foldr diff [] conjA  where diff new acc = if new `elem` conjB then acc else new:acc

esElem :: (Eq a) => a -> Set a -> Bool
esElem x conjunto = foldr ((||) . (== x)) False conjunto

subset :: (Eq a) => Set a -> Set a -> Bool
subset xs ys = all (`esElem` ys) xs

setEq  :: (Eq a) => Set a -> Set a -> Bool
setEq xs ys = subset xs ys && subset ys xs

properSubset :: (Eq a) => Set a -> Set a -> Bool
properSubset xs ys = subset xs ys && (not $ subset ys xs)

{-
[1,2,3] +++ [3] = [1,2,3]
[4,2] +++ [2,4] = [4,2]
[1,2,3] *** [3] = [3]
[] *** [1,3,5] = []
[1,2,3] `dif` [3] = [1,2]
[2,3] `dif` [1,2,3] = []
[1,2,3] *** [1,2] = [1,2]
[1,2,3] +++ [4,5,6] = [4,5,6,1,2,3]
([4,3] `dif` [5,4]) *** [1,2] = []
([3,2,4] +++ [4,2]) `dif` [2,3] = [4]
subset [3,4] [4,5,6] = False
subset [1,3] [4,1,3,6] = True
subset [] [1,2,3] = True
setEq [1,2] [2,1] = True
setEq [3,4,6] [2,3,5] = False
[1,2,3] `dif` [1] = [2,3]
[] `dif` [1,2] = []
-}

{- Exercise 3. The function powerset :: (Eq a, Show a) => Set a -> Set (Set a)
takes a set and returns its power set. Work out the values of the following expressions:-}

powerset :: Eq a => Set a -> [Set a]
powerset [] = [[]]
powerset (x:xs) = xss ++ map (x:) xss where xss = powerset xs
{-
powerset [3,2,4] = [[],[4],[2],[2,4],[3],[3,4],[3,2],[3,2,4]]
powerset [2] = [[],[2]]
-}

{-Exercise 4.Thecross product of two sets A and B is defined as
A×B={(a, b)| a∈A, b∈B}
The function
crossproduct :: (Eq a, Show a, Eq b, Show b) =>
Set a -> Set b -> Set (a,b)
takes two sets and returns their cross product. Evaluate these expressions-}

crossproduct :: Set a -> Set b -> Set (a,b)
crossproduct xs ys= [(x,y) | x <- xs, y <- ys]
{-
crossproduct [1,2,3] ['a','b'] = [(1,'a'),(1,'b'),(2,'a'),(2,'b'),(3,'a'),(3,'b')]
crossproduct [1] ['a','b'] = [(1,'a'),(1,'b')]
-}



{-Exercise 5.In the following exercise, let u be [1,2,3,4,5,6,7,8,9,10], a
be [2,3,4], b be [5,6,7] and c be [1,2]. Give the elements of each set:

let u = [1,2,3,4,5,6,7,8,9,10];
let a = [2,3,4];
let b = [5,6,7];
let c = [1,2];

a +++ b = [5,6,7,2,3,4]
u `dif` a *** (b +++ c) = [1,5,6,7]
c `dif` b = [1,2]
(a +++ b) +++ c = [1,5,6,7,2,3,4]
u `dif` a = [1,5,6,7,8,9,10]
u `dif` (b *** c) = [1,2,3,4,5,6,7,8,9,10]

-}

{-Exercise 6.What are the elements of the set{x+y|x∈{1,2,3}∧y∈{4,5}}?

[5,6,6,7,7,8]

-}



{-Exercise 7.Write and evaluate a list comprehension that expresses the set {x|x∈{1,2,3,4,5}∧x<0}

[x|x<-[1,2,3,4,5],x<0]

-}


{-Exercise 8.Write and evaluate a list comprehension that expresses the set {x+y|x∈{1,2,3}∧y∈{4,5}} 

 [x+y|x<-[1,2,3],y<-[4,5]] = [5,6,6,7,7,8]

-}


{-Exercise 9.Write and evaluate a list comprehension that expresses the set {x|x∈{1,2,3,4,5,6,7,8,9,10}∧even x} 

[x|x<-[1,2,3,4,5,6,7,8,9,10], x `mod` 2 == 0]

-}


{-Exercise 10.What is the value of each of the following expressions?

subset [1,3,4] [4,3] = False
subset [] [2,3,4] = True
setEq [2,3] [4,5,6] = False
setEq [1,2] [1,2,3] = False

-}


{-Exercise 11.Let A, B,and C be sets. Prove that if A⊂B and B⊂C, then A⊂C .

A=[1]
B=[1,2]
C=[1,2,3]


1. A⊂B {Premisa}
2. x∈A→x∈B && A≠B {Def.⊂}
3. B⊂C {Premisa}
4. x∈B→x∈C && B≠C  {Def.⊂}
5. x∈A→x∈C && A≠C {Hyp.Cambio regla}
6. ∀x.(x∈A→x∈C) && A≠C {∀ introducción }
7. A⊂C {Def.⊂}

-}


{-Exercise 12.Consider the following two claims. For each one, if it is true
give a proof, but if it is false give a counterexample.
(a) If A⊆B and B⊆C,then A⊂C.
  
  A⊆B {premisa}
  x∈A→x∈B {def.⊆}
  B⊆C {Premisa}
  x∈B→x∈C {Def.⊆}
  A⊂C {Premisa}
  x∈A→x∈C && A≠C {Hyp.Cambio regla}
  A⊂C {Def.⊂} Falso
	  A=[1]
	  B=[1]
	  C=[1]
	   A⊆B = True
	   B⊆C = True
	   A⊂C = False {Por la def. de ⊂:x∈A→x∈C && A≠C}

(b) If A⊂B and B⊂C,then A⊆C.

  A⊂B {premisa}
  x∈A→x∈B && A≠B {def.⊂}
  B⊂C {Premisa}
  x∈B→x∈C && B≠C {Def.⊂}
  A⊆C {Premisa}
  x∈A→x∈C {cambio de regla}
	  A=[1]
	  B=[1,2]
	  C=[1,2,3]
	   A⊂B = True
	   B⊂C = True
	   A⊆C = False {Por la def. de ⊆:x∈A→x∈C}
-}

																						{-
																						1.A∪B=B∪A
																						2.A∩B=B∩A
																						3.A∪(B∪C)=(A∪B)∪C
																						4.A∩(B∩C)=(A∩B)∩C
																						5.A−B=A∩B'
																						-}

{-Exercise 13.For the following questions, give a proof using set laws, or find
a counterexample.
(a) (A'∪B)'∩C'=A∩(B∪C)'
    (A'' ∩ B') ^ C'=A∩(B∪C)' {de morgan}
    (A ∩ B') ∩ C'=A∩(B∪C)' {doble complemento}
    A ∩ (B' ∩ C')=A∩(B∪C)' {asociatividad}
    A ∩ (B ∪ C)'=A∩(B∪C)' {de morgan}

(b) A−(B∪C)'=A∩(B∪C)
    A∩(B∪C)''=A∩(B∪C) {A−B=A∩B'}
    A∩(B∪C)=A∩(B∪C) {A=A''}

(c) (A∩B)∪(A∩B')=A
	A∩(B∪B')=A {Distributiva}
	A∩U=A {definicion 24}
	A=A {identidad A∩U=A}

(d) A∪(B−A)=A∪B
	A∪(B∩A')=A∪B {def A−B=A∩B'}
	(A∪B)∩(A∪A')=A∪B {def distributiva A∪(B∩C)=(A∪B)∩(A∪C)}
	(A∪B)∩U=A∪B  {definicion 24 Universo}
	A∪B=A∪B {definición identidad A∩U=A}

(e) A−B=B'−A
	A∩B'=B'−A    {def A−B=A∩B' izq}
	A∩B'=B'∩A'' {def A−B=A∩B' der}
	A∩B'=B'∩A {def A=A'' doble compl}

(f ) A∩(B−C)=(A∩B)−(A∩C)


(g) A−(B∪C)=(A−B)∩(A−C)
	A∩(B∪C)'=(A−B)∩(A−C) {def A−B=A∩B'}
	A∩(B'∩C')=(A−B)∩(A−C) {def DeMorgan (A∪B)'=A'∩B'}
	

(h) A∩(A'∪B)=A∩B
(i) (A−B')∪(A−C')=A∩(B∩C)
-}

{-Exercise 14.The function
smaller :: Ord a => a -> [a] -> Bool
takes a value and a list of values and returns True if the value is smaller
than the first element in the list. Using this function, write a function
that takes a set and returns its powerset. Usefoldr.-}

smaller :: Ord a => a -> [a] -> Bool
smaller _ [] = True
smaller x (y:_) = x < y

{-Exercise 15.Prove that (A∪B)'=((A∪A')∩A')∩((B∪B')∩B')       .-}


{-Exercise 16.Using a list comprehension, write a function that takes two sets
and returns True if the first is a subset of the other.-}

issubset xs ys = and [x `elem` ys | x <- xs]


{-Exercise 17.What is wrong with this definition ofdiff, a function that takes
two sets and returns their difference?-}

baddiff :: Eq a => [a] -> [a] -> [a]
baddiff set1 set2 = [e | e <- set2, not (elem e set1)]
--EL ORDEN DE LA EVALUACION DE CADA SET ESTA INVERTIDO

{-Exercise 18.What is wrong with this definition ofintersection, a function
that takes two sets and returns their intersection?-}
intersection :: [a] -> [a] -> [a]
intersection set1 set2 = [e|e<-set1, e <- set2]
--SE REALIZA UNA ITERACION PARA TODOS LOS VALORES DE SET 2 POR CADA VALOR DE SET 1

{-Exercise 19.Write a function using a list comprehension that takes two sets
and returns their union.-}
unionlc set1 set2 = [x|x<-set1, not (x `elem` set2)] ++ set2


{-Exercise 20.Is it ever the case that A∪(B−C)=B? 
   Solamente que A fuera un resultado de B-C.
    A = B - C
-}

{-Exercise 21.Give an example in which (A∪C)∩(B∪C)=0

	A=[]
	B=[]
	C=[]
-}

{-Exercise 22.Prove the commutative law of set-intersection,A∩B=B∩A-}

{-Exercise 23.Express the commutative law of set-intersection in terms of the
set operations and Boolean operations defined in the Stdm module.-}
commutative a b = ((***) a b) `setEq` ((***) a b)
commutative [1,2] [1,2,4]
{-Exercise 24.Prove the associative law of set-union, (A∪B)∪C=A∪(B∪C).-}

{-Exercise 25.Prove that the difference between two sets is the intersection of
one with the complement of the other, which can be written as A−B=A∩B' .-}

{-Exercise 26.Prove that union distributes over intersection, A∪(B∩C)=(A∪B)∩(A∪C).-}

{-Exercise 27.Prove DeMorgan’s law for set intersection, (A∩B)' =A'∪B' .-}