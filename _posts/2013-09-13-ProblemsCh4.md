---
layout: post
title: Solutions to Chapter 4
category: haskell
---

Exercise 1.
===========
Let a be an arbitrary real number. Prove, for all natural numbers
m and n, that $$a^{m \times n} = (a^m)^n $$

Exercise 2.
===========
Prove that the sum of the first n odd positive numbers is $$n^2 $$.



Exercise 3.
===========
Prove that $$\sum_{k=1}^n a^i =  (a^{n+1} − 1)/(a − 1) $$
, where a is a real number and $$ a \neq 1 $$.


Exercise 4.
==========
(This problem is from [12], where you can find many more.)
The nth Fibonacci number is defined as follows:


{% highlight haskell %}

> fib :: Integer -> Integer
> fib 0 = 0
> fib 1 = 1
> fib (n+2) = fib n + fib (n+1)

{% endhighlight %}


The first few numbers in this famous sequence are 0, 1, 1, 2, 3, 5, . . . .
Prove the following:

$$\sum_{i=1}^n fib (i) =  fib (n+2) -1  $$



Exercise 5.
==========
Prove Theorem 16.
Theorem 16. length (xs++ys) = length xs + length ys


Exercise 7.
==========
Prove Theorem 19.

Exercise 9.
===========
Invent a new theorem similar to Theorem 20, where (1+) is re-
placed by (k+). Test it on one or two small examples. Then prove your
theorem.
Theorem 20. sum (map (1+) xs) = length xs + sum xs
