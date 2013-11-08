{-
∧ ∨ ∃ ∀

Exercise 1.Let the universeU={1,2,3}. Expand the following expressions
into propositional term (i.e., remove the quantifiers):
(a) ∀x. F(x) = F(1) ∧ F(2) ∧ F(3)
(b) ∃x. F(x) = F(1) ∨ F(2) ∨ F(3)
(c) ∃x.∀y. G(x, y) = (G(1,1)∧G(1,2)∧G(1,3)) ∨ (G(2,1)∧G(2,2)∧G(2,3)) ∨ (G(3,1)∧G(3,2)∧G(3,3))

-}

{-
Exercise 2.Let the universe be the set of integers. Expand the following
expression: ∀x∈{1,2,3,4}. ∃y∈{5,6}.
F(x, y)

= (F(1,5)∨F(1,6)) ∧ (F(2,5)∨F(2,6)) ∧ (F(3,5)∨F(3,6)) ∧ (F(4,5)∨F(4,6)) 

-}

{-

Exercise 3.Express the following statements formally, using the universe
of natural numbers, and the predicates E(x) ≡x is even and O(x) ≡ x is odd.
•There is an even number = ∃x.isEven(x)
•Every number is either even or odd = ∀x.IsEven(x)∨isOdd(x)
•No number is both even and odd = ∀x.¬(isEven(x)∧isOdd(x))
•The sum of two odd numbers is even = ∀x,y.isOdd(x)∧isOdd(y) -> isEven(x+y)
•The sum of an odd number and an even number is odd = ∀x,y.isOdd(x)∧isEven(y) -> isOdd(x+y)

-}

{-
Exercise 4.Let the universe be the set of all animals, and define the following
predicates:
B(x) ≡ x is a bird.
D(x) ≡ x is a dove.
C(x) ≡ x is a chicken.
P(x) ≡ x is a pig.
F(x) ≡ x can fly.
W(x) ≡ x has wings.
M(x, y) ≡ x has more feathers than y does.

Translate the following sentences into logic. There are generally several
correct answers. Some of the English sentences are fairly close to logic,
while others require more interpretation before they can be rendered in
logic.

•Chickens are birds = ∀x. C(x)→B(x)
•Some doves can fly = ∃x. D(x)∧F(x)
•Pigs are not birds. = ∀x. P(x)→¬B(x)
•Some birds can fly, and some can’t. = (∃x. B(x)∧F(x))∧(∃x. B(x)∧¬F(x))
•An animal needs wings in order to fly = ∀x.(W(x)→F(x))
•If a chicken can fly, then pigs have wings = (∃x. C(x)∧F(x))→(∀x. P(x)→W(x))
•Chickens have more feathers than pigs do = ∀x.∀y(C(x)∧P(y))→M(x,y)
•An animal with more feathers than any chicken can fly = ∀x.((A(x)∧(∀y.(C(y)∧M(x, y))))→F(x))

-}


{-

Exercise 5.Translate the following into English.
•∀x.(∃y.wantsToDanceWith (x, y)) = Para todas las personas existe al menos una persona que quiere bailar con ella
•∃x.(∀y.wantsToPhone (y,x)) = Todas las personas quieren llamarle al menos a una persona ; Hay alguien a quien alguna persona quiere llamarle
•∃x.(tired (x)∧∀y.helpsMoveHouse (x, y)) = Hay alguien que esta cansado de ayudar a todas las personas a mudarse de casa.

-}

{-
Exercise 6.Write the predicate logic expressions corresponding to the following Haskell expressions. Then decide whether the value is True or False,
and evaluate using the computer. Note that(== 2) is a function that takes a number and compares it with 2, while(< 4)is a function that
takes a number and returns True if it is less than 4.

forall [1,2,3] (== 2) = ∀x. F(x==2)

(1==2) ∧ (2==2) ∧ (3==2)
FALSE ∧ TRUE ∧ FALSE = 
						FALSE


forall [1,2,3] (< 4) = ∀x. F(x<4)
(1<4) ∧ (2<4) ∧ (3<4)
TRUE ∧ TRUE ∧ TRUE = 
						TRUE

-}


{-
Exercise 7.Again, rewrite the following in predicate logic, work out the values
by hand and evaluate on the computer:
exists [0,1,2] (== 2) = ∃x∈xs.x=2  ==> (1=2) ∨ (2=2) ∨ (3=2)
exists [1,2,3] (> 5) = ∃x∈xs.x>5   ==> (1>5) ∨ (2>5) ∨ (3>5)
-}

{-
Exercise 8.Define the predicate pxy to mean x=y+1, and let the universe
be {1,2}. Calculate the value of each of the following expressions, and
then check your solution using Haskell.

U = {1,2}

(a) ∀x.(∃y. p(x, y))
		∀x. x=1+1∨x=2+1
		(1=1+1 ∨ 1=2+1) ∧ (2=1+1 ∨ 2=2+1)
		(FALSE ∨ FALSE) ∧ (TRUE ∨ FALSE)
			FALSE 		 ∧ 		 TRUE 		= FALSE

(b) ∃x,(∃y. p(x, y)
		∃x. (x=1+1)∨(x=2+1)
		((1=1+1)∨(1=2+1)) ∨ ((2=1+1)∨(2=2+1))
		(FALSE ∨ FALSE) ∨ (TRUE ∨ FALSE)
			 FALSE 		 ∨       TRUE        = TRUE

(c) ∃x.(∀y. p(x, y))
		∀x. x=1+1∧x=2+1
		(1=1+1 ∧ 1=2+1) ∨ (2=1+1 ∧ 2=2+1)
		(FALSE ∧ FALSE) ∨ (TRUE ∧ FALSE)
			  FALSE      ∨      FALSE         = FALSE

(d) ∀x, y. p(x, y)
		∀x.(x=1+1∧x=2+1)
		(1=1+1∧1=2+1) ∧ (2=1+1∧2=2+1)
		(FALSE ∧ FALSE) ∧ (TRUE ∧ FALSE)
			   FALSE     ∧      FALSE         = FALSE

-}

{-
Exercise 9.Prove ∀x.F(x) , ∀x.F(x) → G(x) |- ∀x.G(x)

∀x.F(x)				∀x.F(x) → G(x)
-------- {∀E}		---------------- {∀E}
   F(x)		,		F(X) → G(x)
   ----------------------------- {→E}
   					G(x)
   				   ------{∀E}
				   ∀E.G(x)
-}

{-
	Exercise 10.Prove ∃x.∃y. F(x, y) |- ∃y.∃x. F(x, y).

						F(x,y)
					   --------{∃I}
			∃y.F(x,y)  ∃x.F(x,y)
			----------------------{∃E}
					∃x.F(x,y)
		-----------------------------{∃I}
∃x.∃y. F(x, y)     ∃y.∃x. F(x, y)
--------------------------------------{∃E}
				∃y.∃x. F(x, y)
-}

{-
Exercise 11.The converse of Theorem 66 is the following:
∀y.∃x. F(x, y) |- ∃x.∀y. F(x, y) Wrong!
Give a counterexample that demonstrates that this statement isnotvalid

X = {0,1,2}
Y = {0,1,2}

F x y = y == x+y

∀y.∃x. F(x, y)
   (F(0,0) ∨ F(0,1) ∨ F(0,2))                                                                                                                           
∧ (F(1,0) ∨ F(1,1) ∨ F(1,2))                                                                                                                           
∧ (F(2,0) ∨ F(2,1) ∨ F(2,2))
   
   (T ∨ T ∨ T)                                                                                                                           
∧ (F ∨ F ∨ F)                                                                                                                           
∧ (F ∨ F ∨ F)
---------------
FALSE

∃x.∀y. F(x, y)
   (F(0,0) ∧ F(0,1) ∧ F(0,2))                                                                                                                           
∨ (F(1,0) ∧ F(1,1) ∧ F(1,2))                                                                                                                           
∨ (F(2,0) ∧ F(2,1) ∧ F(2,2))
   
   (T ∧ T ∧ T)                                                                                                                           
∨ (F ∧ F ∧ F)                                                                                                                           
∨ (F ∧ F ∧ F)
---------------
TRUE

-}

{-
Exercise 12.Prove ∀x.(F(x)∧G(x)) |- (∀x.F(x))∧(∀x.G(x)).

	∀x.F(x)∧G(x)				∀x.F(x)∧G(x)
   --------------{∀E}		   ---------------{∀E}
   	  F(x)∧G(x)					  F(x)∧G(x)
   	  ----------{∧EL}			 ------------{∧ER}
   	  	  F(x)                        G(x)
   	  -----------{∀I}            -----------{∀I}
   	  	∀x.F(x)                     ∀x.G(x)
   	  -------------------------------------------{∧I}
   	  			 (∀x.F(x))∧(∀x.G(x))

-}