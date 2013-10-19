------------------------------
--CHAPTER 7. PREDICATE LOGIC--
--    Rosario Marin P.      --
--     Octuober,18,2013     --
------------------------------

--Quantifiers--
∀x.  	ALL		 ^ (and)
∃x.    EXISTS    v (or)


--------Exercise 1.--------
Topic: 7.1.3 Expanding Quantified Expressions
--Let the universe U={1,2,3}. Expand the following expressions into propositional term:

(a) ∀x. F(x)
	  ^ F(1)
	  ^ F(2)
	  ^ F(3)


(b) ∃x. F(x)
	  v F(1)
	  v F(2)
	  v F(3)


(c) ∃x.∀y. G(x, y)

	--Step 1: Expand the outer quantifier:
	 v(∀y. G(1, y))
	 v(∀y. G(2, y))
	 v(∀y. G(3, y))

	--Step 2: Expand the remaining quantifiers:
	 v((1, 1) ^ (1, 2) ^ (1, 3))
	 v((2, 1) ^ (2, 2) ^ (2, 3))
	 v((3, 1) ^ (3, 2) ^ (3, 3))_


--------Exercise 2.--------
--Let the universe be the set of integers. Expand the following expression:
    ∀x∈{1,2,3,4}. ∃y∈{5,6}.F(x, y)

    --Step 1: Expand the outer quantifier:
	^ (∃y∈{5,6}.F(1, y))
	^ (∃y∈{5,6}.F(2, y))
	^ (∃y∈{5,6}.F(3, y))
	^ (∃y∈{5,6}.F(4, y))

	--Step 2: Expand the remaining quantifiers:
	^ ((1, 5) v (1, 6))
	^ ((2, 5) v (2, 6))
	^ ((3, 5) v (3, 6))
	^ ((4, 5) v (4, 6))

--------Exercise 3.--------
Topic: 7.1.5 Translating Between English and Logic
--Express the following statements formally, using:
--1. Universe of natural numbers 
--2. Predicates: 
	 E(x) ≡ x is even (par)
	 O(x) ≡ x is odd (impar)

(a) There is an even number.
	∃x. E(x)

(b) Every number is either even or odd.
	∀x. E(x) v O(x)

(c) No number is both even and odd.
	∀x.¬(E(x) ^ O(x))

		--Pregunta:Tambien esto es correcto???

	∀x. ((E(x) → ¬O(x)) ^ (¬E(x) → O(x))

(d) The sum of two odd numbers is even.
	∀x.∀y.O(x) ^ O(y) → E(x+y)

(e) The sum of an odd number and an even number is odd.
	∀x.∀y. O(y) ^ E(x) → O(x+y)


--------Exercise 4.--------
--Express the following statements formally, using:
--1. Universe be the set of all animals
--2. Predicates: 
	B(x) ≡ x is a bird
	D(x) ≡ x is a dove
	C(x) ≡ x is a chicken
	P(x) ≡ x is a pig
	F(x) ≡ x can fly
	W(x) ≡ x has wings
	M(x, y) ≡ x has more feathers than y does

(a) Chickens are birds.
	∀x. C(x) → B(x)

(b) Some doves can fly.
	∃x. D(x) ^ F(x)

(c) Pigs are not birds.
	∀x. P(x) → ¬(B(x))

(d) Some birds can fly, and some can’t.
	(∃x. B(x)∧F(x)) ^ (∃x. B(x)∧¬F(x))

	--Pregunta:Tambien esto es correcto???
	∃x. B(x) → (¬(F(x) ^ F(x)))

(e) An animal needs wings in order to fly.
	--Afirmacion: Si un animal NO tiene 'Alas' entonces NO puede 'Volar'
	∀x.(¬W(x)→ ¬F(x))
	--Entnces:
	∀x. W(x) ^ F(x)

(f) If a chicken can fly, then pigs have wings.
	(∃x. C(x)∧F(x)) → (∀x. P(x)→W(x))

(g) Chickens have more feathers than pigs do.
	∀x.∀y.C(x) ^ P(y) → M(x, y)

(h) An animal with more feathers than any chicken can fly.
	∀x.(A(x) ^ (∀y.(C(y) ^ M(x, y))) → F(x))


--------Exercise 5.--------
--Translate the following into English.

(a) ∀x.(∃y.wantsToDanceWith (x, y))
	Todo el mundo tiene a alguien con el que quiere bailar!

(b) ∃x.(∀y.wantsToPhone (y,x))
	Hay alguien con el que todo mundo quiere llamar por telefono!
	

(c) ∃x.(tired (x) ^ ∀y.helpsMoveHouse (x, y))
	Hay alguien que está cansado, y que ayuda a todos a cambiarse de casa!

--------Exercise 6.--------
Topic: 7.2 Computing with Quantifiers
--Translate the following into English.
--Write the predicate logic expressions corresponding to the following 
--Haskell expressions. Then decide whether the value is True or False,
--and evaluate using the computer. Note that(== 2)is a function that
--takes a number and compares it with 2, while(< 4)is a function that
--takes a number and returns True if it is less than 4.

(a) forall [1,2,3] (== 2)
	= 1==2 ^ 2==2 ^ 3==2
	= False ^ True ^ False
	= False


(b) forall [1,2,3] (< 4)
	= 1<4 ^ 2<4 ^ 3<4
	= True ^ True ^ True
	= True

--------Exercise 7.--------
--Again, rewrite the following in predicate logic, work out the values
--by hand and evaluate on the computer:
(a) exists [0,1,2] (== 2)
	= (0==2) v (1==2) v (2==2)
	=  False v False v True
	=   True

(b) exists [1,2,3] (> 5)
	= (1>5) v (2>5) v (3>5)
	=  False v False v False
	=  False





	




