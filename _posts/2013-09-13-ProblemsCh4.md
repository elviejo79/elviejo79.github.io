---
layout: post
title: Solutions to Chapter 4
category: haskell
---

* auto-gen TOC:
{:toc}

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

** Elviejo: Changed this formula definition because the books syntax isn't valid haskell **

{% endhighlight %}


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

{% highlight haskell %}
    map f . concat = concat (map (map f )).
{% endhighlight %}

**************************************************************

Exercise 11.
============
Prove that the ++ operator is associative.

**************************************************************

Exercise 12.
============
Prove

{% highlight haskell %}
    sum . map length = length . concat
{% endhighlight %}

**************************************************************

Exercise 13.
=============
What is the flaw in the proof given above?

**************************************************************

Exercise 14.
============
State the requirements on finite length that the proof of
P imposes on the arguments of concat, where P is defined as

{% highlight haskell %}
    P (n) ≡ concat xss = foldr (++) [] xss
{% endhighlight %}

**************************************************************

Exercise 15.
============
Check that Theorem 27 holds for the argument [1, 2, 3].

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

**************************************************************

Exercise 17.
============
Use induction to prove Theorem 27.

{% highlight haskell %}
    reverse (reverse xs) = xs.
{% endhighlight %}

**************************************************************

Exercise 18.
============
Explain why Theorem 27 does not hold for infinite lists.

**************************************************************

Exercise 19.
===========
Assume that xss is a finite list of type [[a]], that it is of length n,
and that xs is a finite list and an arbitrary element of xss.
Prove that length

{% highlight haskell %}
    (concat xss) = sum (map length xss).
{% endhighlight %}


**************************************************************

Exercise 20.
===========
Prove that **or** defined over an argument that has an arbitrary
number of elements delivers the value True if True occurs as one of the
elements of its argument.

**************************************************************

Exercise 21.
===========
Prove that **and** defined over an argument that has an arbitrary
number of elements delivers the value True if all of the elements in its
argument are True.

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

**************************************************************

Exercise 25.
===========
Prove the equation

{% highlight haskell %}
    concat = foldr (++) []
{% endhighlight %}


Assume that the lists are finite, so that list induction can be used.

**************************************************************

Exercise 26.
===========
Define an **and** operator using **&&** and foldr.


**************************************************************

Exercise 27.
===========
 Given a list xs of type Bool, prove that

{% highlight haskell %}
    and ([False] ++ xs) = False
{% endhighlight %}
