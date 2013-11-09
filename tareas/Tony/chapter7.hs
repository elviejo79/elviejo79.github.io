import Stdm


--Exersice 1
{-

(a) ∀x. F(x)
	F(1) ∧ F(2) ∧ F(3)

(b) ∃x. F(x)
	F(1) ∨ F(2) ∨ F(3)

(c) ∃x. ∀y. G(x, y)
	( G(1,1) ∧ G(1,2) ∧ G(1,3) )
  ∨	( G(2,1) ∧ G(2,2) ∧ G(2,3) )
  ∨	( G(3,1) ∧ G(3,2) ∧ G(3,3) )

-}


--Exercise 2
{-
 

	(F(1,5) ∨ F(1,6)) ∧
	(F(2,5) ∨ F(2,6)) ∧
	(F(3,5) ∨ F(3,6)) ∧
	(F(4,5) ∨ F(4,6)) 
-}


--Exercise 3
{-
E(x) ≡ x is even 
O(x) ≡ x is odd

There is an even number.
∃x. E(x) 
Every number is either even or odd.
∀x. E(x) ∨ O(x)
No number is both even and odd.
∀x. ¬(E(x) ∧ O(x))
The sum of two odd numbers is even.
∀x.∀y. (O(x) ∧ O(y)) -> E(x+y)
The sum of an odd number and an even number is odd.
∀x.∀y. (O(x) ∧ E(y)) -> O(x+y)
-}


--Exercise 4
{-
B(x) ≡ x is a bird.
D(x) ≡ x is a dove.
C(x) ≡ x is a chicken.
P(x) ≡ x is a pig.
F(x) ≡ x can fly.
W(x) ≡ x has wings.
M(x, y) ≡ x has more feathers than y does.

∀x. C(x) -> B(x)
Some doves can fly.
∃x. D(x) ∧ F(x) 
Pigs are not birds.
∀x. P(x) -> ¬B(x)
Some birds can fly, and some can’t.
(∃x. B(x) ∧ F(x)) ∨ (∃x. B(x) ∧ ¬F(x))
An animal needs wings in order to fly.
∃x. W(x) -> F(x)
If a chicken can fly, then pigs have wings.
(∃x. C(x) -> F(x)) -> (∀x. P(x) -> W(x))
Chickens have more feathers than pigs do.
∀x.∀y. (C(x) ∧ P(y)) -> M(x,y)
An animal with more feathers than any chicken can fly.
Z(x) = x is an animal
∃x.∀y. (Z(x) ∧ C(y) ∧ M(x,y)) -> F(x)
-}

--Exercise 5
{-
∀x. (∃ y. wantsToDanceWith (x, y))
∃x. (∀ y. wantsToPhone (y, x))
∃x. (tired (x) ∧ ∀y. helpsMoveHouse (x, y))

-}

--Exercise 6
{-
forall [1,2,3] (== 2) 
	∀x ∈ {1,2,3}. x==2 =
	= 1==2 ∧ 2==2 ∧ 3==2
	= F ∧ T ∧ F
	= F

forall [1,2,3] (< 4)
	∀x ∈ {1,2,3}. x<4 =
	= 1<4 ∧ 2<4 ∧3<4
	= T ∧ T ∧ T
	= T
-}

ex16_1 = forall [1,2,3] (== 2)
ex16_2 = forall [1,2,3] (< 4)

--Exercise 7
{-
exists [0,1,2] (== 2)
	∃x ∈ {1,2,3}. x==2 =
	= 1==2 ∨ 2==2 ∨ 3==2
	= F ∨ T ∨ F
	= T
exists [1,2,3] (> 5)
	∃x ∈ {1,2,3}. x>5 =
	= 1>5 ∨ 2>5 ∨ 3>5
	= F ∨ F ∨ F
	= F

-}
ex17_1 = exists [1,2,3] (==2)
ex17_2 = exists [1,2,3] (>5)

--Exercise 8
{-
a) ∀ x. (∃ y. p(x, y)) =
	= (1=1+1 ∨ 1=2+1) ∧ (2=1+1 ∨ 2=2+1)
	= (F ∨ F) ∧ (T ∨ F)
	= F ∧ T
	= F

b) ∃x, y. p(x, y) =
	= (1=1+1 ∨ 1=2+1) ∨ (2=1+1 ∨ 2=2+1)
	= (F ∨ F) ∨ (T ∨ F)
	= T

c) ∃ x. (∀ y. p(x, y)) =
	= (1=1+1 ∧ 1=2+1) ∨ (2=1+1 ∧ 2=2+1)
	= ( F ∧ F ) ∨ ( T ∧ F)
	= F ∨ F
	= F

d) ∀ x, y. p(x, y) =
	= (1=1+1 ∧ 1=2+1) ∧ (2=1+1 ∧ 2=2+1)
	= ( F ∧ F ) ∧ (T ∧ F)
	= F ∧ F
	= F

-}


innerfun_8_1 :: Int -> Bool
innerfun_8_1 x = exists [1,2] (==x+1)  

innerfun_8_2 :: Int -> Bool
innerfun_8_2 x = forall [1,2] (==x+1)  

ex8_a = forall [1,2] innerfun_8_1
ex8_b = exists [1,2] innerfun_8_1
ex8_c = exists [1,2] innerfun_8_2
ex8_d = forall [1,2] innerfun_8_2


{- 
Exercise 9. Prove ∀x.F (x), ∀x.F (x) → G(x) |- ∀x.G(x).

	∀x.F (x)			∀x.F (x) → G(x)
   -----------{∀E}	  -------------------{∀E}	
	  F(p)                F(p) → G(p)
	------------------------------------ {->E}
					G(p)
				  -------- {∀I}	
				   ∀x.G(x)

-}

{-
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
-}

--Exercise 11
{-


U={1,2,3} F(x,y) = (y==x+y)
			∀y. ∃x. F(x, y)          |-         ∃x. ∀y. F(x, y) 
   = (F(0,0) ∨ F(0,1) ∨ F(0.2))      |    = (F(0,0) ∧ F(0,1) ∧ F(0.2))
   ∧(F(1,0) ∨ F(1,1) ∨ F(1.2))	  |    ∨ (F(1,0) ∧ F(1,1) ∧ F(1.2))
   ∧(F(2,0) ∨ F(2,1) ∨ F(2.2))      |    ∨ (F(2,0) ∧ F(2,1) ∧ F(2.2))
   = (0==0+0 ∨ 1==0+1 ∨ 2==0+2)     |	   = (0==0+0 ∧ 1==0+1 ∧ 2==0+2) 
   ∧(0==1+0 ∨ 1==1+1 ∨ 2==1+2)	  |    ∨ (0==1+0 ∧ 1==1+1 ∧ 2==1+2)
   ∧(0==2+0 ∨ 1==2+1 ∨ 2==2+2)     |	   ∨ (0==2+0 ∧ 1==2+1 ∧ 2==2+2) 
   = (T	∨ T ∨ T)                    |	   = (T	∧ T ∧ T) 
   ∧(F	∨ F ∨ F)                    |	   ∨(F	∧ F ∧ F)
   ∧(F	∨ F ∨ F)                    |	   ∨(F	∧ F ∧ F) 
   = T ∧ F ∧ F                      |     = T ∨ F ∨ F
   = F                               |     = T 

-}

--Exercise 12
{-

	∀x.(F(x) ∧ G(x))			∀x.(F(x) ∧ G(x))
   -------------------{∀E}    --------------------{∀E}
        F(p) ∧ G(p)				   F(p) ∧ G(p)
       -------------{∧ER}        --------------{∧EL}   
             F(p)                      G(p)
			------{∀I}               ------{∀I}
			∀x.F(x)                 ∀x.G(x) 
		   ----------------------------------{∧I}	
		         ∀x.F (x) ∧ ∀x.G(x)


-}
