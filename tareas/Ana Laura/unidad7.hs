-- Exercise 1. Let the universe U = {1, 2, 3}. Expand the following expressions
-- into propositional term (i.e., remove the quantifiers):

-- (a) ∀x. F(x) = F(1) ∧ F(2) ∧ F(3)

-- (b) ∃x. F(x) = F(1) ∨ F(2) ∨ F(3)

-- (c) ∃x. ∀y. G(x, y) = (G(1, 1) ∧ G(1, 2) ∧ G(1, 3)) ∨ (G(2, 1) ∧ G(2, 2) ∧ G(2, 3)) ∨ (G(3, 1) ∧ G(3, 2) ∧ G(3, 3))


-- Exercise 2. Let the universe be the set of integers. Expand the following
-- expression: ∀x ∈ {1, 2, 3, 4}. ∃y ∈ {5, 6}. F(x, y)

(F(1, 5) ∨ F(1, 6)) ∧ (F(2, 5) ∨ F(2, 6)) ∧ (F(3, 5) ∨ F(3, 6)) ∧ (F(4, 5) ∨ F(4, 6))


-- Exercise 3. Express the following statements formally, using the universe
-- of natural numbers, and the predicates E(x) ≡ x is even and O(x) ≡
-- x is odd.

-- • There is an even number. 
-- ∃x. Even(x)

-- • Every number is either even or odd.
-- ∀x. (Even(x) ∨ Odd(x))

-- • No number is both even and odd.
-- ∀x. ¬(Even(x) ∧ Odd(x))

-- • The sum of two odd numbers is even.
-- ∀x. ∀y. Odd(x) ∧ Odd(y) → Even(x + y))

-- • The sum of an odd number and an even number is odd.
-- ∀x. ∀y. Odd(x) ∧ Even(y) → Odd(x + y))


-- Exercise 4. Let the universe be the set of all animals, and define the following
-- predicates:

B(x) ≡ x is a bird.
D(x) ≡ x is a dove.
C(x) ≡ x is a chicken.
P(x) ≡ x is a pig.
F(x) ≡ x can fly.
W(x) ≡ x has wings.
M(x, y) ≡ x has more feathers than y does.

-- Translate the following sentences into logic. There are generally several
-- correct answers. Some of the English sentences are fairly close to logic,
-- while others require more interpretation before they can be rendered in
-- logic.

• Chickens are birds.
∀x. D(x) → B(x)

• Some doves can fly.
∃x. D(x) ∧ F(x)

• Pigs are not birds.
∀x. P(x) → ¬B(x)

• Some birds can fly, and some can’t.
(∃x. B(x) ∧ F(x)) ∧ (∃x. B(x) ∧ ¬F(x))

• An animal needs wings in order to fly.
∀x. (¬W(x) →¬F(x))

• If a chicken can fly, then pigs have wings.
(∃x. C(x) ∧ F(x)) → (∀x. P(x) → W(x))

• Chickens have more feathers than pigs do.
(∀x.∀y. C(x) ∧ P(y)) → M(x,y)

• An animal with more feathers than any chicken can fly.
∀x. ((A(x) ∧ (∀y. (C(y) ∧M(x, y)))) → F(x))



-- Exercise 5. Translate the following into English.

• ∀x. (∃ y. wantsToDanceWith (x, y))
Todos tienen a alguien con quien quieren bailar.

• ∃x. (∀ y. wantsToPhone (y, x))
Hay alguien a quien todos quieren hablar por telefono

• ∃x. (tired (x) ∧ ∀y. helpsMoveHouse (x, y))
Hay algunos que  esta cansado y  ayuda a todos a mudarse de casa.



-- Exercise 6. Write the predicate logic expressions corresponding to the following
-- Haskell expressions. Then decide whether the value is True or False,
-- and evaluate using the computer. Note that (== 2) is a function that
-- takes a number and compares it with 2, while (< 4) is a function that
-- takes a number and returns True if it is less than 4.

forall [1,2,3] (== 2)
= 1==2 /\ 2==2 /\ 3==2
= False /\ True /\ False
= False


forall [1,2,3] (< 4)
= (1 < 4) /\ (2 < 4) /\ (3 < 4)
= True /\ True /\ True
= True


-- Exercise 7. Again, rewrite the following in predicate logic, work out the values
-- by hand and evaluate on the computer:

exists [0,1,2] (== 2)
= 0==2 \/ 1==2 \/ 2==2
= False \/ False \/ True
= True

exists [1,2,3] (> 5)
= (1 > 5) \/ (2 > 5) \/ (3 > 5)
= False \/ False \/ False
= False


-- Exercise 8. Define the predicate p x y to mean x = y+1, and let the universe
-- be {1, 2}. Calculate the value of each of the following expressions, and
-- then check your solution using Haskell.

(a) ∀ x. (∃ y. p(x, y))
= ∀x. x = 1+1 ∨ x = 2+1
= (1 = 1+1 ∨ 1 = 2+1) ∧ (2 = 1 + 1 ∨ 2 = 2+1)
= (False ∨ False) ∧ (True ∨ False)
= False ∧ True
= False

(b) ∃ x, y. p(x, y)
= ∃x.(x = 1+1) ∨ (x = 2+1)
= (1 = 1+1 ∨ 1 = 2+1) ∨ (2 = 1 + 1 ∨ 2 = 2+1)
= (False ∨ False) ∨ (True ∨ False)
= False ∨ True
= True

(c) ∃ x. (∀ y. p(x, y))
= ∃x.(x = 1+1 ∧ x = 2+1)
= (1 = 1+1 ∧ 1 = 2+1) ∨ (2 = 1 + 1 ∧ 2 = 2+1)
= (False ∧ False) ∨ (True ∧ False)
= False ∨ False
= False

(d) ∀ x, y. p(x, y)
= ∀x.(x = 1+1 ∧ x = 2+1)
(1 = 1 + 1 ∧ 1 = 2+1) ∧ (2 = 1 + 1 ∧ 2 = 2+1)
= (False ∧ False) ∧ (True ∧ False)
= False ∧ False
= False

-- Exercise 9. Prove ∀x.F (x), ∀x.F (x) → G(x) |- ∀x.G(x).
	
	 ∀x. F(x)        ∀x. F(x) → G(x)
	__________{∀E}   ________________{∀E}
	    F(x) ,           F(x) → G(x)
	_____________________________________{E}
				G(x)
			____________{∀I}
			   ∀x. G(x)


-- Exercise 10. Prove ∃x. ∃y. F(x, y) |- ∃y. ∃x. F(x, y).


-- Exercise 11. The converse of Theorem 66 is the following:
-- ∀y. ∃x. F(x, y) |- ∃x. ∀y. F(x, y) Wrong!

-- Give a counterexample that demonstrates that this statement is not valid.
x = [1,2]
y = [1,2]

∀y. ∃x. F(x, y)
= ∀y (1 = y V 2 = y)
= (1 = 1 V 2 = 1) ∧ (2 = 1 V 2 = 2)
= (T V F) ∧ (F V T)
= T ∧ T
= T

∃x. ∀y. F(x, y)
= ∃x (x=1 ∧ x=2)
= (1=1 ∧ 1=2) V (2=1 ∧ 2=2)
= (T ∧ F) V (F ∧ T)
= F V F
= F

-- Exercise 12. Prove ∀x.(F(x) ∧ G(x)) |- (∀x.F (x)) ∧ (∀x.G(x)).

∀x.F (x) ∧ G(x)            ∀x.F (x) ∧ G(x)
_________________{∀E}       ________________{∀E}

   F(p) ∧ G(p)               F(q) ∧ G(q)
_____________________{∧EL}   _____________{∧ER}

        F(p)                    G(q)
______________________{∀I}    ________{∀I}

      ∀x.F (x)                  ∀x.G(x)
_____________________________________________{∧I}  

                  ∀x.F (x) ∧ ∀x.G(x)