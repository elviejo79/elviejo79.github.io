import Stdm


{-------------------------------------------------------------------------
Exercise 1.
Let the universe U = {1, 2, 3}. Expand the following expressions
into propositional term (i.e., remove the quantifiers):
    (a) ∀x. F (x)
    (b) ∃x. F (x)
    (c) ∃x. ∀y. G(x, y)
--}

{--
    (a) F(1) ∧ F(2) ∧ F(3)
    (b) F(1) ∨ F(2) ∨ F(3)
    (c)   (G(1,1) ∧ G(1,2) ∧ G(1,3))
        ∨ (G(2,1) ∧ G(2,2) ∧ G(2,3))
        ∨ (G(3,1) ∧ G(3,2) ∧ G(3,3))
--}


{--------------------------------------------------------------------------
Exercise 2.
Let the universe be the set of integers. Expand the following
expression: ∀x ∈ {1, 2, 3, 4}. ∃y ∈ {5, 6}. F (x, y)
--}

{--
      (F(1,5) ∨ F(1,6))
    ∧ (F(2,5) ∨ F(2,6))
    ∧ (F(3,5) ∨ F(3,6))
    ∧ (F(4,5) ∨ F(4,6))
--}


{--------------------------------------------------------------------------
Exercise 3.
Express the following statements formally, using the universe
of natural numbers, and the predicates E(x) ≡ x is even and O(x) ≡
x is odd.
    • There is an even number.
    • Every number is either even or odd.
    • No number is both even and odd.
    • The sum of two odd numbers is even.
    • The sum of an odd number and an even number is odd.
--}

{--
    • There is an even number.
        ∃x. E(x)

    • Every number is either even or odd.
        ∀x. E(x) ⊗ O(x)    //Exclusive logical or

    • No number is both even and odd.
        ∀x. ¬(E(x) ∧ O(x))

    • The sum of two odd numbers is even.
        ∀x,y. E(O(x) + O(y))

    • The sum of an odd number and an even number is odd.
        ∀x,y. O(E(x) + O(y))
--}


{--------------------------------------------------------------------------
Exercise 4.
Let the universe be the set of all animals, and define the following
predicates:
    B(x) = is a bird.
    D(x) = is a dove.
    C(x) = is a chicken.
    P(x) = is a pig.
    F(x) = can fly.
    W(x) = has wings.
    M(x, y) = has more feathers than y does.
Translate the following sentences into logic. There are generally several
correct answers. Some of the English sentences are fairly close to logic,
while others require more interpretation before they can be rendered in
logic.
    • Chickens are birds.
    • Some doves can fly.
    • Pigs are not birds.
    • Some birds can fly, and some can’t.
    • An animal needs wings in order to fly.
    • If a chicken can fly, then pigs have wings.
    • Chickens have more feathers than pigs do.
    • An animal with more feathers than any chicken can fly.
--}

{--
    • Chickens are birds.
        ∀x. C(x) -> B(x)

    • Some doves can fly.
        ∃x. D(x) ∧ F(x)

    • Pigs are not birds.
        ∀x. ¬(P(x) -> B(x))

    • Some birds can fly, and some can’t.
        ∃x. (B(x) ∧ F(x)) ∨ ¬(B(x) ∧ F(x))

    • An animal needs wings in order to fly.
        ∀x. W(x) ∧ F(x)

    • If a chicken can fly, then pigs have wings.
        ∀x. C(x) ∧ F(x) -> P(x) ∧ W(x)

    • Chickens have more feathers than pigs do.
        ∀x,y. M(C(x), P(x))

    • An animal with more feathers than any chicken can fly.
        ∀x,y. M(y, C(x)) ∧ F(y)

--}


{--------------------------------------------------------------------------
Exercise 5.
Translate the following into English.
    • ∀ x. (∃ y. wantsToDanceWith (x, y))
    • ∃ x. (∀ y. wantsToPhone (y, x))
    • ∃ x. (tired (x) ∧ ∀ y. helpsMoveHouse (x, y))
--}

{--
    • ∀ x. (∃ y. wantsToDanceWith (x, y))
        Los hombres quieren bailar con alguna mujer.

    • ∃ x. (∀ y. wantsToPhone (y, x))
        Algunos hombres quieren hablar por teléfono a todas las mujeres.

    • ∃ x. (tired (x) ∧ ∀ y. helpsMoveHouse (x, y))
        Algunas personas se cansan cuando ayudan a alguien a cambiar de casa.

--}


{--------------------------------------------------------------------------
Exercise 6.
Write the predicate logic expressions corresponding to the follow-
ing Haskell expressions. Then decide whether the value is True or False,
and evaluate using the computer. Note that (== 2) is a function that
takes a number and compares it with 2, while (< 4) is a function that
takes a number and returns True if it is less than 4.
    forall [1,2,3] (== 2)
    forall [1,2,3] (< 4)
Like forall, the function exists applies its second argument to all of the
elements in its first argument:
    exists :: [Int] -> (Int -> Bool) -> Bool
However, exists forms the disjunction of the result, using the Haskell function
    or :: [Bool] -> Bool.
--}

{--
    forall [1,2,3] (== 2)
        False And True And False = False

    forall [1,2,3] (< 4)
         True And True And True = True
--}


{--------------------------------------------------------------------------
Exercise 7.
Again, rewrite the following in predicate logic, work out the values
by hand and evaluate on the computer:
    exists [0,1,2] (== 2)
    exists [1,2,3] (> 5)
--}

{--
    exists [0,1,2] (== 2)
        False Or False Or True = True

    exists [1,2,3] (> 5)
        False Or False Or False = False
--}


{--------------------------------------------------------------------------
Exercise 8.
Define the predicate p x y to mean x = y + 1, and let the universe
be {1, 2}. Calculate the value of each of the following expressions, and
then check your solution using Haskell.
    (a) ∀ x. (∃ y. p(x, y))
    (b) ∃ x, y. p(x, y)
    (c) ∃ x. (∀ y. p(x, y))
    (d) ∀ x, y. p(x, y)
--}

{--
    (a) ∀ x. (∃ y. p(x, y))
         forall [1,2] inner_fun_8e
             = and [inner_fun_8e 1, inner_fun_8e 2]
             = and [exists [1,2] (== 1 + 1),
                    exists [1,2] (== 2 + 1)]
             = and [or [1 == 2, 2 == 2],
                    or [1 == 3, 2 == 3]]
             = and [True, False]
             = False

    (b) ∃ x, y. p(x, y)
        exists [1,2] inner_fun_8e
            = or [inner_fun8e 1, inner_fun_8e 2]
            = or [exists [1,2] (== 1 + 1),
                  exists [1,2] (== 2 + 1)]
            = or [or [1 == 2, 2 == 2],
                  or [1 == 3, 2 == 3]]
            = or [True, False]
            = True

    (c) ∃ x. (∀ y. p(x, y))
        exists [1,2] inner_fun_8a
            = or [inner_fun8a 1, inner_fun_8a 2]
            = or [forall [1,2] (== 1 + 1),
                  forall [1,2] (== 2 + 1)]
            = or [and [1 == 2, 2 == 2],
                  and [1 == 3, 2 == 3]]
            = or [False, False]
            = False

    (d) ∀ x, y. p(x, y)
        forall [1,2] inner_fun_8a
            = and [inner_fun8a 1, inner_fun_8a 2]
            = and [forall [1,2] (== 1 + 1),
                  forall [1,2] (== 2 + 1)]
            = and [and [1 == 2, 2 == 2],
                   and [1 == 3, 2 == 3]]
            = and [False, False]
            = False

--}
inner_fun_8e :: Int -> Bool
inner_fun_8e x = exists [1,2] (== x + 1)

inner_fun_8a :: Int -> Bool
inner_fun_8a x = forall [1,2] (== x + 1)

{--------------------------------------------------------------------------
Exercise 9.
Prove ∀x.F (x), ∀x.F (x) → G(x) |- ∀x.G(x).
--}

{--

--}


{--------------------------------------------------------------------------
Exercise 10.
Prove ∃x. ∃y. F (x, y) |- ∃y. ∃x. F (x, y).
--}

{--

--}


{--------------------------------------------------------------------------
Exercise 11.
The converse of Theorem 66 is the following:
    ∀y. ∃x. F (x, y) |- ∃x. ∀y. F (x, y)     Wrong!
Give a counterexample that demonstrates that this statement is not valid.
--}

{--

--}


{--------------------------------------------------------------------------
Exercise 12.
Prove ∀x.(F (x) ∧ G(x)) |- (∀x.F (x)) ∧ (∀x.G(x)).
--}

{--

--}


{--------------------------------------------------------------------------
Exercise 13.
Suppose the universe contains 10 elements. How many times
will F occur when ∀x. ∃y.∀z. F (x, y, z) is expanded into quantifier-free
form? How large in general are expanded expressions?
--}

{--

--}


{--------------------------------------------------------------------------
Exercise 14.
Prove (∃x. f (x)) ∨ (∃x. g(x)) |- ∃x. (f (x) ∨ g(x)).
--}

{--

--}


{--------------------------------------------------------------------------
Exercise 15.
Prove (∀x. f (x)) ∨ (∀x. g(x)) |- ∀x. (f (x) ∨ g(x)).
--}

{--

--}


{--------------------------------------------------------------------------
Exercise 16.
Prove the converse of Theorem 63.
--}

{--

--}


{--------------------------------------------------------------------------
Exercise 17.
Find counterexamples that show that Laws 7.12 and 7.13, which
are implications, would not be valid as equations.
--}

{--

--}


{--------------------------------------------------------------------------
Exercise 18.
Prove the following implication:
    (∀x. f (x) → h(x) ∧ ∀x. g(x) → h(x)) → ∀x. (f (x) ∨ g(x) → h(x))
--}

{--

--}


{--------------------------------------------------------------------------
Exercise 19.
Define a predicate (with the natural numbers 0, 1, 2, . . . as its
universe) that expresses the notion that all of the elements that occur
in either of the sequences supplied as operands to the append operator
(++) also occur as elements of the sequence it delivers. That is, the
predicate states that under certain constraints on the number of elements
in the sequence xs, any element that occurs in either the sequence xs
or the sequence ys also occurs in the sequence xs ++ ys. Hint: Take
’x occurs in xs’ to mean ∃y.∃ys.(xs = (y : ys)∧(x = y)∨(x occurs in ys)).
That is, the proposition ’x occurs in xs’ always has the same value as the
proposition ∃y.∃ys.(xs = (y : ys) ∧ (x = y) ∨ (x occurs in ys)). Denote
the predicate ’x occurs in xs’ by the formula ’x ∈ xs’ (overloading the
’∈’ symbol used to denote set membership).
--}

{--

--}
