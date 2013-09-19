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


map f(xs++ys) = map f xs ++ map f ys

base 
map f[] = map [] ++ map []
[] 		= [] ++ []
[]		= []

ipotesis.
map f(xs++ys) = map f xs ++ map f ys

map f ((x:xs)++ys)				=	map f xs ++ map f ys		{(++).2}
f x : map f ()xs++ys			=								{map.2}
f x : (map f xs ++ map f ys)	=								{ipotesis}
(f x : map f xs) ++ map f ys	=								{(++).2}
map f(x:xs) ++ map f ys			=								{map.2}
map f xs ++ map f ys			=	map f xs ++ map f ys



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


Explain in English what this theorem says. Using the definitions of the
functions involved (sum, length and map), calculate the values of the left
and right-hand sides of the equation using xs = [1, 2, 3, 4].



bases []

sum(map (k) []) = k * length [] + sum []
sum []			= k * length [] + sum [] 		{def map}
0				= k * length [] + sum []		{def suma}
				= (k*0 + 0)						{def length}
0				= 0

1.- inducción. [] 
	sum (map (1+)xs)			= length xs + sum xs
	sum (map (1+)xs)			= (k * length xs) + sum xs
	sum(map (k)x:xs)			= k*lenth x:xs
	sum((k+)x : map(++)xs)		= k*lenth x:xs
	(k+)x + sum (map (++)xs) 	=
	k+x+length xs + sum xs		=
	k+k+length xs + x+sum xs 	= 
	k(1+length xs) + sum x:xs 	=
	k * length x:xs + sum x:xs 	= k * length xs + sum xs
	k * length xs + sum xs		= k * length xs + sum xs


**************************************************************

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


Exercise 10.
============
Prove Theorem 25.

map f . concat = concat (map (map f))

base p([])
map f (concat[]) 			=	concat(map(map f)[])
map f []					=	concat ([])
			[]				=	[]

Inducción.

map f (concat (x:xs))		=	concat (map(map f) x:xs)			{def. concat}
map f (x ++ concat xs)		=	concat (map f x: map(map f) xs)		{facto}
map f x ++ map f (concat xs)=	map fx ++ concat(map (map f) xs)	{hipo}
map f x ++ map f (concat xs)=	map f x ++ map f (concat xs)  






**************************************************************


Exercise 11.
============
Prove that the ++ operator is associative.

(xs++ys)+zs = xs+(ys+zs)


base 
([]++b)++c 	= [] ++(b++c)
b++c		=  a++b 					{++.1}

induccion
(a++b)+c = a+(b+c)
((a:as)++b)++c	=	(a:as)++(b++c)		{++.2}
a:(as++b)++c	=	a:(as++(b++c))		{hypotesis}
a:(as++b)++c	=	a:(as++b)++c


**************************************************************

Exercise 12.
============
Prove

sum.map(length) 	=	length.concat
sum(map length xs)	=	length(concat xs)

base p([])

sum(map (length []))	=	length (concat[])
sum([])					=	0
		0				=	0


2 inducción. (xs:xss)

sum (map length xs:xss)			=	length (concat xs:xss)
sum (length xs: map length xss)	=	length (xs ++ concat xss)		{concat.2}
sum (length xs: map length xss)	=	length xs ++ length(concat xss)	{map.2}
length xs + sum(map length xs)	=	length xs ++ sum(map length xs)	{hipotesis}



**************************************************************

Exercise 13.
=============
What is the flaw in the proof given above?

P(n) = n +1 hourses
Set 1 = h1.....hn+1



P(3)
Set 1 = h1,h2, h3, h4
		A= h1, h2, h3
		B= h2, h3, h4

		Cb2= Ca2 = Ch

P(1)
Set 1 h1. h2
		A= h1
		B= h2



Para P(1) no es posible probar la inducción porque ambos conjuntos no cuentan con los mismos caballos.


**************************************************************

Exercise 14.
============
State the requirements on finite length that the proof of
P imposes on the arguments of concat, where P is defined as

P(n) ≡ concat xss = foldr (+) [] xss

Tanto como concat y foldr no pueden trabajar con listas infinitas.

**************************************************************

Exercise 15.
============
Check that Theorem 27 holds for the argument [1, 2, 3].


reverse . reverse = [1,2,3]		{def .1}
reverse(reverse[1,2,3])			{def reverse}
reverse([3,2,1])				{def reverse}
[1,2,3]


**************************************************************

Exercise 16.
============
Prove the following theorem, using induction:
reverse (xs+ys) = reverse ys+reverse xs


basic xs <- []
reverse ([]++ys)		=	reverse ys ++ reverse []
reverse (ys)			=	reverse ys					{++.1}{reverse.1}

induccion

reverse(x:xs ++ ys)					=	reverse ys ++ reverse x:xs
(reverse xs ++ (x)) ++ reverse ys	=	reverse ys ++ reverse x:xs 			{def. reverse.3}
(reverse xs ++ (x)) ++ reverse ys	=	reverse ys ++ (reverse xs ++ (x)) 	{def. reverse.3}

Then decide whether this theorem happens to be true for infinite lists like
[1 . .]. Try to give a good argument for your conclusion, but you don’t
have to prove it.

**************************************************************

Exercise 17.
============
Use induction to prove Theorem 27.

base []

reverse (reverse xs) = xs
reverse (reverse []) = []
[]					 = []		{def reverse .2}


induccion x:xs

reverse (reverse x:xs) 		= x:xs
reverse (reverse xs ++ [x])	= x:xs 				{def. reverse.3}
reverse	(reverse xs)++ reverse [x]	=	x:xs 	{facto}
reverse(reverse xs) ++ x 			= 			{def. rev.3}
reverse (xs) 		++ x 			= 	x:xs 	{def. rev}
						x:xs 		= 	x:xs 	{def. (++)}

**************************************************************

Exercise 18.
============
Explain why Theorem 27 does not hold for infinite lists.

No funciona para listas infinitas ya que por la definición de reverse:

reverse :: [a,b] -> [b,a]
reverse [a] = [a]
reverse [] = []
reverse (x:xs) = reverse xs++[x]

siempre busca el último elemento del conjunto, y por lo tanto nuca tendrá el conjunto final.


**************************************************************

Exercise 19.
===========
length (concat xss) = sum (map length xss)

base xss<- [[]]
length (concat [[]]) = sum (map length [[]])
length (concat [])	 = sum ([[]])					{def. map}
length ([])			 = 0							{def. concat}
0					 = 0

Inducción
xs:xss
length (concat xss) = sum (map length xss)



length (concat xs:xss)			=	sum (map length xs:xss)	
length (xs ++ concat xss)		=	sum (length xs: map length xss)	{concat.2}
length xs ++ length(concat xss)	=	sum (length xs: map length xss)	{map.2}
length xs ++ sum(map length xs)	=	length xs ++ sum(map length xs)	{hipotesis}





**************************************************************

Exercise 20.
===========
Prove that **or** defined over an argument that has an arbitrary
number of elements delivers the value True if True occurs as one of the
elements of its argument.

P(True)
or True -> foldr (||) False [True[]]
True || (foldr(||), False[])
True ||
True

P(x:xs)
	or xs = foldr (||) False xs
			foldr (||) False (x:xs)
		  = x || foldr False xs

True 
		=  True || foldr False null
		=  True

xs 	= True
	= x || foldr || False True
	= x || True
	= True


**************************************************************

Exercise 21.
===========
Prove that **and** defined over an argument that has an arbitrary
number of elements delivers the value True if all of the elements in its
argument are True.

xs 	=	True
foldr (&&) True [True []]
foldr (&&) (foldr (&&) True [])
True && True
True

Inducción

xs <- True= ys
foldr(&&) True xs
foldr(&&) True (True ys)
true (&&) (foldr (&&) True ys)
True && True
True


**************************************************************

Exercise 22.
===========
Assume there is a function called max that delivers the larger of its two arguments.


{% highlight haskell %}
    max x y = x   if x >= y
    max x y = y   if y >= x
{% endhighlight %}


Write a function maximum that, given a non-empty sequence of values
whose sizes can be compared (that is, values from a type of class Ord),
delivers the largest value in the sequence.

**************************************************************

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
Write a function that, given a sequence containing only nonempty sequences,
delivers the sequence made up of the first elements of each of those non-empty
sequences.

obtenerPrimeros			::	[a] -> a
obtenerPrimeros (x:xs)	=	x

obtenerPrimeros (listas 	::	[[a]] -> [a])
obtenerPrimeros Listas xss = map (obtenerPrimeros)xs


**************************************************************

Exercise 25.
===========
Prove the equation
    concat = foldr (++) []

 Basic xss <-[[]]
 concat [[]]	= foldr(++)[[]]
 		[]		=	[]

Inducción.	x:xs
concat x:xs 	=	foldr(++) x:xs
x++concat xs 	=	foldr(++) x:xs 			{++}
x++concat xs 	=	x++foldr (++) [] xs 	{foldr}
x ++ concat xs 	=	x++concat xs 			{hipot} 




Assume that the lists are finite, so that list induction can be used.

**************************************************************

Exercise 26.
===========
Define an **and** operator using **&&** and foldr.

and :: [Bool] -> Bool
and =	foldr (&&) True


**************************************************************

Exercise 27.
===========
 Given a list xs of type Bool, prove that

    and ([False] ++ xs) = False
xs<- []
and(false ++ xs)				=	False
foldr(&&)True(False:xs)			=	False
False(&&) (foldr(&&) True xs)	=	False
False && True 					=	False
false 							=	false