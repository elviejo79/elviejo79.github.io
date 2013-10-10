Exercise 1.
===========
Let a be an arbitrary real number. Prove, for all natural numbers
m and n, that $$a^{m \times n} = (a^m)^n $$


**************************************************************

Exercise 2.
===========
Prove that the sum of the first n odd positive numbers is $$n^2 $$.

$$
\sum_{i=1}^{n} 2i-1 = n^2
$$

Basis 1
--------
*para n = 1*

$$
\begin{aligned}
\sum_{i=1}^{1} 2i-1 = 1^2 \\
2(1)-1 = 1^2 \\
1 = 1 \\
\end{aligned}
$$

Induction (n) hypothesis
--------------------
We assume that
$$
\sum_{i=1}^{n} 2i-1 = n^2
$$ is true

Induction (n+1)
---------------
consideramos $$ n <- n+1 $$

$$
\begin{aligned}
\sum_{i=1}^{n+1} 2i-1 = (n+1)^2 \\
2(n+1)-1 + \sum_{i=1}^{n} 2i-1 =  (n+1)^2 \\
2n+2-1 + \sum_{i=1}^{n} 2i-1 =  (n+1)^2 \\
2n + 1 + n^2 = (n+1)^2 \\
(n+1)^2 = (n+1)^2 \\
\end{aligned}
$$

**************************************************************

Exercise 3.
===========
Prove that $$\sum_{i=1}^n a^i =  (a^{n+1} − 1)/(a − 1) $$
, where a is a real number and $$ a \neq 1 $$.

$$
\begin{aligned}
\sum_{i=1}^n a^i = \frac{(a^{n+1} − 1)}{(a − 1)}
\end{aligned}
$$


**************************************************************

Exercise 4.
==========
(This problem is from [12], where you can find many more.)
The nth Fibonacci number is defined as follows:


{% highlight haskell %}

> fib :: Integer -> Integer
> fib 0 = 0
> fib 1 = 1
> fib (n) = fib (n-1) + fib (n-2)

{% endhighlight %}

** Elviejo: Changed this formula definition because the books syntax isn't valid haskell **

The first few numbers in this famous sequence are 0, 1, 1, 2, 3, 5, . . . .
Prove the following:

$$\sum_{i=1}^n fib (i) =  fib (n+2) -1  $$


Basis 1
-------

<div>$$\begin{aligned}
\sum_{i=1}^1 fib (i) =  fib (1+2) -1 \\
fib (1) =  fib (3) -1 \\
fib (1) = fib (2) + fib (1) -1 \\
fib (1) = fib (1) +  fib (0) + fib (1) -1 \\
fib (1) = 1 + 0 + 1 -1 \\
fib (1) = 1 \\
1 = 1  \\
\end{aligned}$$</div>

Induction n hypothesis
----------------------
We assume $$\sum_{i=1}^n fib (i) =  fib (n+2) -1  $$ is true.

Induction n+1
----------------
$$ n <- n + 1 $$

<div>$$\begin{aligned}
\sum_{i=1}^{n+1} fib (i) =  fib ((n+1)+2) -1 \\
fib (n+1) + \sum_{i=1}^n fib (i) =  fib (n+3) -1 \\
fib (n+1) + fib (n+2) -1 = fib (n+3) -1 \\
fib (n+1) + fib (n+2) -1 = fib (n+2) + fib (n+1) -1 \\
QED \\
\end{aligned}$$</div>

**************************************************************

Exercise 5.
==========
Prove Theorem 16.

{% highlight haskell %}

   length (xs++ys) = length xs + length ys

{% endhighlight %}

Definitions
-----------

{% highlight haskell %}

    length :: [a] -> Int
    length []     = 0
    length (x:xs) = 1 + length xs

    (++) :: [a] -> [a] -> [a]
    (++) [] ++ ys     = ys
    (++) (x:xs) ++ ys = x : (xs ++ ys)

{% endhighlight %}

Basis []
---------
$$ xs <- [] $$

{% highlight haskell %}
    length ([]++ys) = length [] + length ys
    length ([]++ys) = 0 + length ys   {def len []}
    lenght (ys)     = lenght ys           {def (++) [] ++ ys}
{% endhighlight %}

Induction xs hypothesis
-----------------------
We assume
{% highlight haskell %}

   length (xs++ys) = length xs + length ys

{% endhighlight %}
is true

Induction x:xs
---------------
{% highlight haskell %}

            length (x:xs++ys) = length x:xs + length ys
            length (x:xs++ys) = length x:xs + length ys   {def ++}
         length (x: (xs++ys)) = length x:xs + length ys   {def ++}
          1 + length (xs++ys) = length x:xs + length ys   {def length x:xs}
    1 + length xs + length ys = length x:xs + length ys   {hypothesis}
      length x:xs + lenght ys = length x:xs + length ys   {def length x:xs}
    {QED}

{% endhighlight %}


******************************************************************

Exercise 6.
===========
Prove Theorem 18.

map f (xs ++ ys) == map f xs ++ map f ys

Definición de map
map :: (a->b) ->[a]->[b]
map _ [] = []
map f (x:xs) = f x:map f xs
Definición de (++) => Concatenar

Basis = []

1.-map f ([]++[]) => map f [] => [] (map _ [] = [])
2.- map f [] ++ map f [] => [] ++ [] => []
Therefore 1===2

Induction:
map f (xs ++ ys) == map f xs ++ map f ys

map f (xs ++ ys) => por propiedad conmutativa fijamos ys

map f ((x:xs)++ys)
f x:map f(xs++ys)
f x:map f xs ++ map f ys
map f (x:xs) ++ map f ys  ===> map f (x:xs) = f x:map f xs

******************************************************************

Exercise 7.
==========
Prove Theorem 19.

{% highlight haskell %}
    (map f . map g) xs = map (f.g) xs
{% endhighlight %}

Definitions
-----------
{% highlight haskell %}
    map :: (a->b) -> [a] -> [b]
    map f []     = []
    map f (x:xs) = f x : map f xs

    (.) :: (b -> c) -> (a -> b) -> (a -> c)
    (f.g) x = f (g x)
{% endhighlight %}

Basis []
--------
xs <- []

{% highlight haskell %}
    (map f . map g) xs = map (f.g) xs
    (map f . map g) [] = map (f.g) []  {xs <- []}
    (map f . map g) [] = []            {def map f []}
    map f (map g [])   = []            {def (.)}
    map f []           = []            {def map f []}
                    [] = []            {def map f []}
{% endhighlight %}

Induction xs hypotesis
-----------------------
We assume
{% highlight haskell %}
    (map f . map g) xs = map (f.g) xs
{% endhighlight %}
is true

Induction x:xs
--------------------
xs <- x:xs

{% highlight haskell %}
    (map f . map g) x:xs             = map (f.g) x:xs
    map f (map g x:xs)               = map (f.g) x:xs           {def (.)}
    map f (g x : map g xs)           = map (f.g) x:xs           {def map f (x:xs)}
    f(g x) : map f (map g xs)        = map (f.g) x:xs           {def map f (x:xs)}
    f(g x) : ((map f . map g) xs)    = map (f.g) x:xs           {def (.)}
    ((f.g) x) : ((map f . map g) xs) = map (f.g) x:xs           {def (.)}
    ((f.g) x) : (map (f.g) xs)       = map (f.g) x:xs           {def (.)} {hypothesis}
    ((f.g) x) : (map (f.g) xs)       = ((f.g) x) : map (f.g) xs {def map f x:xs}
    {QED}
{% endhighlight %}

**************************************************************

Exercise 8.
==========
Recall Theorem 20, which says

{% highlight haskell %}
    sum (map (1+) xs) = length xs + sum xs.
{% endhighlight %}

sum (map (1+) xs) = length xs + sum xs.

map :: (a->b)->[a]->[b] ====> map takes a function and a list and applies that function to every element in the list, producing a new list.

sum :: Num a => [a] -> a =====> The sum function computes the sum of a finite list of numbers.
length :: [a] -> Int ====> The length function returns the number of elements in a list

Basis = [1]

Izqui
sum (map (1+) [1])
sum (1+1:map 1+ [])
sum (1+1:[])
sum([2])
2
se aplica la función (1+) a todos los elementos de una lista, siendo el último elemento una lista vacía, y al final se hace la sumatoria de todos los elementos de la lista.

Dere
length xs + sum xs
length [1] + sum [1]
1 + 1
2
Se calcula el número de elementos en una lista y se le suma la suma de los elementos que tiene la misma lista

sum (map (1+) [1,2,3,4])
sum (1+1:map (1+) [2,3,4])
sum (1+1:1+2:map (1+) [3,4])
sum (1+1:1+2:1+3:map (1+) [4])
sum (1+1:1+2:1+3:1+4 map (1+) [])
sum (1+1:1+2:1+3:1+4:[])
sum (2:3:4:5:[])
sum [2,3,4,5]
14

length [1,2,3,4] + sum [1,2,3,4]
4 + 10
14



Explain in English what this theorem says. Using the definitions of the
functions involved (sum, length and map), calculate the values of the left
and right-hand sides of the equation using xs = [1, 2, 3, 4].

**************************************************************


(map f . map g) xs = map (f . g) xs
===================================

(map f . map g) x:xs = map (f . g) x:xs
map f(map g(x:xs)) = map (f . g) x:xs
map f ((g x) : map g xs) = map (f . g) x:xs
f(g(x)) : map f (map g (xs)) = map (f . g) x:xs
f(g(x)):(map f . map g) xs =  map (f . g) x:xs
f(g(x)):map (f . g)xs = map (f . g) x:xs
(f . g)x = map (f . g) xs = map (f . g) x:xs

Exercise 9.
===========
Invent a new theorem similar to Theorem 20, where (1+) is replaced by (k+).
Test it on one or two small examples. Then prove your theorem.

**Theorem 20**

{% highlight haskell %}
    sum (map (1+) xs) = length xs + sum xs.
{% endhighlight %}

**Theorem 20Bis**
{% highlight haskell %}
    sum (map (k+) xs) = k*length xs + sum xs.
{% endhighlight %}

Definitions
-----------
{% highlight haskell %}

    sum :: Num a => [a] -> a
    sum [] = 0
    sum (x:xs) = x + sum xs

{% endhighlight %}

Basis []
--------
xs <- []
{% highlight haskell %}

    sum (map (k+) []) = k*length [] + sum []
    sum ([])          = k*lenght [] + sum [] {def map f []}
                   0  = k*lenght [] + 0      {def sum []}
                   0  = k*0 + 0              {def len []}
                   0  = 0
{% endhighlight %}

Induction xs hypothesis
-----------------------
we assume
{% highlight haskell %}

    sum (map (k+) xs) = k*length xs + sum xs.

{% endhighlight %}
is true

Induction x:xs
-----------------------
xs <- x:xs
{% highlight haskell %}

    sum (map (k+) x:xs)            = k*length x:xs + sum x:xs
    sum (((k+)x): map (k+) xs )    = k*lenght x:xs + sum x:xs {def map f x:xs}
    ((k+)x) + sum (map (k+) xs )   = k*lenght x:xs + sum x:xs {def sum x:xs}
    ((k+)x) + k*length xs + sum xs = k*lenght x:xs + sum x:xs {hypothesis}
    k + x + k*length xs + sum xs   = k*lenght x:xs + sum x:xs {parenthesis}
    k + k*length xs + x + sum xs   = k*lenght x:xs + sum x:xs {changed order}
    k * (1+lenght xs) + x + sum xs = k*lenght x:xs + sum x:xs {factorizing k}
    k * (lenght x:xs) + x + sum xs = k*lenght x:xs + sum x:xs {def len x:xs}
    k * (lenght x:xs) + sum x:xs   = k*lenght x:xs + sum x:xs {def sum x:xs}
    {QED}

{% endhighlight %}


**************************************************************

Ejercicio 9.
============

sum(map (1+) xs) = len xs + sum as
--
len xs = map 1 xs
--
sum(map (1+) xs) = map 1 xs + sum as
--sum (map (k+) xs) = (k * len xs) + sum xs

sum(map(k+)xs) = (k * len xs)
sum(map(k+)x:xs) = k * len x:xs
sum ((k+)x : map(k+) xs) =
(k+)x + sum (map(k+)xs) =
(k+ x + k * len xs + sum xs)
k + k + len xs + k + sym xs
k (1 + len xs) + sum x:xs = 
k + len x: xs (sum x:xs) = k * len x:xs

**************************************************************

Exercise 10.
============
Prove Theorem 25.

{% highlight haskell %}
    map f . concat = concat (map (map f )).
{% endhighlight %}

map f . concat = concat (map (map f ))

concat :: [[a]] -> [a]
concat [] = []
concat (xs:xss) = xs ++ concat xss
[[1],[2],[3]] => [1,2,3]

(.) composition
(.) :: (b -> c) -> (a -> b) -> (a -> c)
(f.g) x = f (g x)

Basis = [1,2]

map f .concat[[1],[2]]
map f .[1]++concat[[2]]
map f .[1]++[2]++concat[[]]
map f .[1]++[2]++[]
map f [1,2]
f 1:map f [2]
f 1:f 2: map f []
f 1:f 2:[]

concat (map (map f [[1],[2]]))
concat (map (f [1]:map f [[2]]))
concat (map (f [1]:f [2]:map f [[]]))
concat (map (f [1]:f [2]:[]))
concat (f 1:map (f [2]:[]))
concat (f 1:f 2(map f []))
concat (f 1:f 2:[])
f 1:f 2:[]

Induction
map f . concat [(xs:xss)]= concat (map (map f [(xs:xss)]))

map f . [xs]++concat[xss] => por la propiedad de concat nos queda una lista de elementos
map f (xs:xss)
f xs: map f xss => por la propiedad de map, llegará un momento donde tendremos una lista vacía
f xs:f xss:[]
[f xs,f xss]

concat (map (map f [(xs:xss)]))
concat (map (f xs:map f xss))
concat (map (f xs:f xss:map f []))
concat (map (f xs:f xss:[]))
concat (f xs:map (f xss:[]))
concat (f xs:f xss:map (f []))
concat (f xs:f xss:[])
f xs++concat(f xss:[])
f xs++f xss++concat([])
f xs++f xss++[]
[f xs,f xss]


**************************************************************
Exercise 11.
============
Prove that the ++ operator is associative.

xs ++ (ys ++ zs) = (xs ++ ys) ++ zs

asociativo : 1 + (2 + 3) = (1 + 2) + 3 pero no se puede 1 + (2 + 3) = (1 + 3) + 2
conmutativo: 1 * (2 * 3) = (1 * 2) * 3 ó (1 * 3) * 2 = 1 * (2 * 3)

Basis = [1,2], [2,3], [3,4]

[1,2]++([2,3]++[3,4])
[1,2]++[2,3,3,4]
[1,2,2,3,3,4]

([1,2]++[2,3])++[3,4]
[1,2,2,3]++[3,4]
[1,2,2,3,3,4]

xs ++ (ys ++ zs) = (xs ++ ys) ++ zs

(x:xs) ++ (ys ++ zs)
(x:xs) ++ (ys:zs)
(x:xs:ys:zs)
And then, a miracle happens...
(x:xs++ys):zs
(x:xs++ys)++zs


**************************************************************
Exercise 12.
============
Prove

{% highlight haskell %}
    sum . map length = length . concat
{% endhighlight %}

sum . map length = length . concat

Basis = [[1,2]]

sum . map length [[1],[2]]
sum . (length [1]:map length [[2]])
sum . (length [1]:length [2]:map length [[]])
sum . (length [1]:length [2]:[])
sum . ([1]:[1]:[])
sum [1,1]
2

length . concat [[1,2]]
length . [1,2]:concat[]
length [1,2]
2

sum . map length xs = length . concat xs
C = {1..n} => C = {as..xs}
n, n + 1 => xs, ys

C = [as..]

sum . length xs:map length [] + ys
sum . length xs:[] + ys
sum [lxs] + ys
lxs + ys


length . concat [xs] + ys
length . xs++concat[] + ys
length . xs++[] + ys
length [xs] + ys
lxs + ys


**************************************************************____________________

Exercise 14.
============
State the requirements on finite length that the proof of
P imposes on the arguments of concat, where P is defined as

{% highlight haskell %}
    P (n) ≡ concat xss = foldr (++) [] xss
{% endhighlight %}

Cuando se hace una prueba por inducción, se tiene que definir un número finito en el conjunto, aunque se exprese con una variable, así podremos comprobar el último valor del conjunto y el valor siguiente. (ver problemas anteriores) 


**************************************************************

Exercise 15.
============
Check that Theorem 27 holds for the argument [1, 2, 3].

ej.15
reverse :: [a] -> [a]
reverse(reverse xs) = xs
reverse . reverse = id   <--- false in case of infinite list

reverse(reverse xs) = xs
reverse(reverse [1,2,3]) = [1,2,3]
reverse([3,2,1]) = [1,2,3]
[1,2,3] = [1,2,3]
**************************************************************

Exercise 16.
============
Prove the following theorem, using induction:

{% highlight haskell %}
    reverse (xs++ys) = reverse ys++reverse xs
{% endhighlight %}

Then decide whether this theorem happens to be true for infinite lists like
[1 . .]. Try to give a good argument for your conclusion, but you don’t
have to prove it.

ej. 16
hip.
reverse (xs ++ ys) = reverse ys ++ reverse xs

pb.
reverse([] ++ ys) = reverse ys ++ reverse []
reverse(ys) = reverse ys ++ []
reverse(ys) = reverse ys

reverse((x:xs) ++ ys) = reverse ys ++ reverse (x:xs)
reverse(x:(xs++ys))
reverse x:reverse (xs++ys)
x:reverse (xs++ys)
--Por la hip
x:(reverse xs ++ reverse ys)
(x:reverse xs) ++ reverse ys
reverse x:reverse xs ++ reverse ys
reverse (x:xs) ++ reverse ys = reverse ys ++ reverse (x:xs)

**************************************************************
Exercise 17.
============
Use induction to prove Theorem 27.

{% highlight haskell %}
    reverse (reverse xs) = xs.
{% endhighlight %}

ej 17
Use induction to prove Theorem 27
reverse (reverse xs) = xs

pb
reverse (reverse [])
reverse ([])
[]

reverse (reverse xs)
reverse (reverse (x:xs))
reverse (reverse x ++ reverse xs)
reverse (x ++ reverse xs)
reverse (x) ++ reverse(reverse xs)
x ++ xs
x:xs

**************************************************************

Exercise 19.
===========
Assume that xss is a finite list of type [[a]], that it is of length n,
and that xs is a finite list and an arbitrary element of xss.
Prove that length

{% highlight haskell %}
    (concat xss) = sum (map length xss).
{% endhighlight %}

________
ej. 19

igual al problema 12


**************************************************************

Exercise 20.
===========
Prove that **or** defined over an argument that has an arbitrary
number of elements delivers the value True if True occurs as one of the
elements of its argument.
______________________

Exercise 20. Prove that or defined over an argument that has an arbitrary
number of elements delivers the value True if True occurs as one of the
elements of its argument

foldr (||) True xs = True
P(True) = foldr (||)True[] = True 
P(x:xs) = foldr (||)True(x:xs) = True 
(||) foldr (||) True(xs)) True
(||) (True) = True 
True = True

**************************************************************
_________________


Exercise 21.
===========
Prove that **and** defined over an argument that has an arbitrary
number of elements delivers the value True if all of the elements in its
argument are True.

&& :: Bool -> Bool -> Bool 
&& True (xs) = foldl && True xs

**************************************************************_____________________________

Exercise 22.
===========
Exercise 22. Assume there is a function called max that delivers the larger of
its two arguments.
max x y = x
if x >= y
and
max x y = y
if y >= x
Write a function maximum that, given a non-empty sequence of values
whose sizes can be compared (that is, values from a type of class Ord),
delivers the largest value in the sequence.

foldr (max) 0 xs
xs:[7,2,9]

foldr(max) 0 [7,3,9]
max(7max(2max(0 9)))
max 7(max 2 9)
max (7 9)
9

max :: [a] -> a
max [] = 0¹
max xs = (foldr(max) 0 xs)

_______

Exercise 23.
===========
Assume that the list xs is of type Ord a => [a],
and that x is an arbitrary element of xs.
Given the definition of maximum, defined as

{% highlight haskell %}

> maximum ::  Ord a => [a] -> a
> maximum xs = foldr (max) y ys
>              where  y:ys = xs

{% endhighlight %}

prove that maximum has the following property:

{% highlight haskell %}
    (maximum xs) >= x
{% endhighlight %}

**************************************************************

Exercise 24.
===========

Exercise 24. Write a function that, given a sequence containing only non-
empty sequences, delivers the sequence made up of the first elements of
each of those non-empty sequences.

first :: [a] -> a
first (x:xs) = x
firstEl :: [[a]] -> [a] 0¹
firstEl xs = map(first)xs

______

*************************************************************

Excercise 25.
============

concat xss = foldr (++) [] xs

Basis: concat xss
concat []  
[]

foldr (++) [] []
foldr (++) [] xss

Inductive Case:
concat xss
concat ys : yss
ys ++ concat yss
foldr (++) [] (ys : yss)
foldr (++) [] xss

**************************************************************

Exercise 26.
===========
Exercise 26. Define an and operator using && and foldr.

&& :: Bool -> Bool -> Bool
and :: [Bool] -> Bool

and xs = foldr (&&) True xs
and = (foldr(&&) True)

**************************************************************

Excercise 27.
============

and ([False] + xs) 
and (False : xs)
foldr (&&) True (False : xs)
False && (foldr (&&) True xs)
False && True
False
