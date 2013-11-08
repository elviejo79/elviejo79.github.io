{-Exercise 1. Let the universe U = {1, 2, 3}. Expand the following expressions into propositional term (i.e., remove the quantifiers):
 (a) ∀x. F(x) = F(1) ∧ F(2) ∧ F(3)

 (b) ∃x. F(x) = F(1) ∨ F(2) ∨ F(3)

 (c) ∃x. ∀y. G(x, y) = (G(1, 1) ∧ G(1, 2) ∧ G(1, 3)) ∨ (G(2, 1) ∧ G(2, 2) ∧ G(2, 3)) ∨ (G(3, 1) ∧ G(3, 2) ∧ G(3, 3))-}
--------------------------------------------------------------------------------------
{-Exercise 2. Let the universe be the set of integers. Expand the following
expression: ∀x ∈{1, 2, 3, 4}. ∃y ∈{5, 6}.F(x, y)

(F(1, 5) ∨ F(1, 6)) ∧ (F(2, 5) ∨ F(2, 6)) ∧ (F(3, 5) ∨ F(3, 6)) ∧ (F(4, 5) ∨ F(4, 6))
-}
-----------------------------------------------------------------------------------------------------
{-Exercise 3. Express the following statements formally, using the universe
of natural numbers, and the predicates E(x) ≡ x is even and O(
x) ≡
x is odd.
• Thereisanevennumber.
• Every number is either even or odd.
• No number is both even and odd.
• Thesumoftwooddnumbersiseven.
• The sum of an odd number and an even number is odd.

 ∃x. isEven(x)
 ∀x. isEven(x) OR isOdd(x)
 ∀x Not(isEven(x) Y isOdd(x))
 ∀x ∀y isOdd(x) Y isOdd(y) -> isEven(x+y)
 ∀x ∀y isOdd(x) Y isEven(y) -> isOdd(x+y)
---------------------------------------------------------------------------------------
{-Exercise 4. Let the universe be the set of all animals, and deﬁne the following
predicates:
B(x) ≡ x is a bird.
D(x) ≡ x is a dove.
C(x) ≡ x is a chicken.
P(x) ≡ x is a pig.
F(x) ≡ x can ﬂy.
W(x) ≡ x has wings.
M(x, y) ≡ x hasmorefeathersthany does.

Translate the following sentences into logic. There are generally several
correct answers. Some of the English sentences are fairly close to logic,
while others require more interpretation before they can be rendered in
logic.
• Chickens are birds.
	∀x. D(x) → B(x)
• Some doves can ﬂy.
	∃x. D(x) ∧ F(x)
• Pigs are not birds.
	∀x. P(x) → ¬B(x)
• Some birds can ﬂy, and some can’t.
	(∃x. B(x) ∧ F(x)) ∧ (∃x. B(x) ∧ ¬F(x))
• An animal needs wings in order to ﬂy.
	∀x. (¬W(x) →¬F(x))
• If a chicken can ﬂy, then pigs have wings.
	(∃x. C(x) ∧ F(x)) → (∀x. P(x) → W(x))
• Chickens have more feathers than pigs do.
	(∀x.∀y. C(x) ∧ P(y)) → M(x,y)
• An animal with more feathers than any chicken can ﬂy.
	∀x. ((A(x) ∧ (∀y. (C(y) ∧M(x, y)))) → F(x))
-}
---------------------------------------------------------------------------------------------
{-Exercise 5. Translate the following into English.

•∀x. (∃ y. wantsToDanceWith (x, y)) = todos quieren bailar con alguien
•∃x. (∀ y. wantsToPhone (y, x)) = hay alguien en el que almenos todos le quieren hablas
•∃x. (tired (x) ∧∀y. helpsMoveHouse (x, y)) = Alguien esta cansado y el ayuda a todas las personas a mover de casa-}
----------------------------------------------------------------------------------------------
Exercise 6. Write the predicate logic expressions corresponding to the following
Haskell expressions. Then decide whether the value is True or False,
and evaluate using the computer. Note that (== 2) is a function that
takes a number and compares it with 2, while (< 4) is a function that
takes a number and returns True if it is less than 4.
forall [1,2,3] (== 2) 
	∀x ∈ {1,2,3}. x==2 =
	= 1==2 ∧ 2==2 ∧ 3==2
	= F ∧ T ∧ F
	= F
forall [1,2,3] (< 4)
   = (1 < 4) /\ (2 < 4) /\ (3 < 4)
   = True /\ True /\ True
   = True
----------------------------------------------------------------------------------------------
Exercise 7. Again, rewrite the following in predicate logic, work out the values
by hand and evaluate on the computer:
xs=[1,2,3]
exists [0,1,2] (== 2) 
∃x Exs. x=2
--> (1=2) or (2=2) or (3=2) = True

exists [1,2,3] (> 5) 
∃x Exs. x>5
--> (1>5) or (2>5) or (3>5) = False
--------------------------------------------------------------------------------------------------
Exercise 8. Deﬁne the predicate pxyto mean x = y +1, and let the universe
be {1, 2}. Calculate the value of each of the following expressions, and
then check your solution using Haskell.
(a) ∀ x. (∃ y. p(x, y)) =
	= (1=1+1 ∨ 1=2+1) ∧ (2=1+1 ∨ 2=2+1)
	= (F ∨ F) ∧ (T ∨ F)
	= F ∧ T
	= F

(b) ∃ x, y. p(x, y)
	= (1=1+1 ∨ 1=2+1) ∨ (2=1+1 ∨ 2=2+1)
	= (F ∨ F) ∨ (T ∨ F)
	= T

(c) ∃ x. (∀ y. p(x, y)) =
	= (1=1+1 ∧ 1=2+1) ∨ (2=1+1 ∧ 2=2+1)
	= ( F ∧ F ) ∨ ( T ∧ F)
	= F ∨ F
	= F

(d) ∀ x, y. p(x, y)
	∀ x, y. p(x, y) =
	= (1=1+1 ∧ 1=2+1) ∧ (2=1+1 ∧ 2=2+1)
	= ( F ∧ F ) ∧ (T ∧ F)
	= F ∧ F
	= F
---------------------------------------------------------------------------------------------------

Exercise 9. Prove ∀x.F (x), ∀x.F (x) → G(x) ∀x.G(x).

∀x.F (x)			∀x.F (x) → G(x)
   -----------{∀E}	  -------------------{∀E}	
	  F(p)                F(p) → G(p)
	------------------------------------ {->E}
					G(p)
				  -------- {∀I}	
				   ∀x.G(x)
---------------------------------------------------------------------------------------------------
Exercise 10. Prove ∃x. ∃y. F(x, y) |- ∃y. ∃x. F(x, y).

				F(p,q)
			   ---------{∃I}
		 ∃y. F(p,y) 	∃x. F(x,q)
		----------------------------{∃E}
				  ∃x.F(x,q) 
				 ------------{∃I}
		∃x.∃y. F(x,y)   ∃y.∃x. F(x,y)
	   -----------------------------------{∃E}    				     				 
					∃y.∃x. F(x,y)
---------------------------------------------------------------------------------------------------
Exercise 11 The converse of Theorem 66 is the following:
∀y. ∃x. F(x,y) |- ∃x. ∀y. F(x,y)	Wrong!
Give a counterexample that demonstrates that this statement is not valid.
 Give a counterexample that demonstrates that this statement is not valid.
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
----------------------------------------------------------------------------------------------------
Exercise 12. Prove ∀x.(F(x) ∧ G(x)) |- (∀x.F (x)) ∧ (∀x.G(x)).

	∀x.(F(x) ∧ G(x))			∀x.(F(x) ∧ G(x))
   -------------------{∀E}    --------------------{∀E}
        F(p) ∧ G(p)				   F(p) ∧ G(p)
       -------------{∧ER}        --------------{∧EL}   
             F(p)                      G(p)
			------{∀I}               ------{∀I}
			∀x.F(x)                 ∀x.G(x) 
		   ----------------------------------{∧I}	
		         ∀x.F (x) ∧ ∀x.G(x)
----------------------------------------------------------------------------------------------------
Exercise 13. Suppose the universe contains 10 elements. How many times
will F occur when ∀x. ∃y.∀z. F(x, y, z) is expanded into quantiﬁer-free
form? How large in general are expanded expressions?
-}