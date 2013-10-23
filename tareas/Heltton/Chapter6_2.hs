----------------------------------------
--Probamos el teorema 35.

import Stdm

theorem35 = [P,Q] `Theorem` (And P Q)
prooft35 = (Assume P, Assume Q)
			{------------------} `AndI`
				(And P Q)

cpt35= check_proof theorem35 prooft35

----------------------------------------

t37=[P,Q,R] `Theorem` (And(And P Q)R)
prooft37= (((Assume P, Assume Q)
			{------------------} `AndI`
			(And P Q), Assume R)
			{-------------------} `AndI`
			(And (And P Q) R)
			)
cpt37 = check_proof t37 prooft37

----------------------------------------

t39=[And (And P Q) R] `Theorem` (And R Q)
prooft39 = ((Assume (And (And P Q) R)
			{---------------}`AndER`
				 R),
			(Assume (And (And P Q) R)
				{-----------} `AndEL`
				 (And P Q)
				{-----------} `AndER`
				 Q))
			{--------------------} `AndI`
			(And R Q)


cpt39 = check_proof t39 prooft39

--------------------------------------------
--Homework 31.
--P,Q,R |- (P^(Q^R))

tHom31=  [P,Q,R] `Theorem` (And P (And Q R))
prooft31 = ((Assume P, ((Assume Q, Assume R)
						{--------------}`AndI`
						(And Q R)))
			{---------------------------}`AndI`
			(And P (And Q R))
			)

			--{-----------------------------}`AndI`
			--(And P (And Q R))
			--			)

cpt31 = check_proof tHom31 prooft31

--------------------------------------------
--Homework 32.
--tHom32 = A /\ (Not A) |- False

tHom32 = [(And A (Not A))] `Theorem` (FALSE)
proft32 = (((Assume (And A (Not A))
		{--------------------------}`AndER`
		A),
		((Assume (And A (Not A)))
		{---------------------}`AndEL`
		(Not A)))
		{-------------------}`ImpE`
		FALSE)

cpt32= check_proof tHom32 proft32

--------------------------------------------
--Exercise 33 A |- ¬(¬A) 
-- ¬(¬A) |- A
tHom33 = [(Not (Not A))] `Theorem` A
prooft33 = (((Assume (A
			{------} `Imp`
			FALSE),
			Assume (A 
				{-----} `Imp`
				FALSE
				{-------}`Imp` 
				FALSE)
				)
			{-------} `ImpE`
			FALSE
			)
			{------}`RAA` A)

cpt33= check_proof tHom33 prooft33

--Excercise 34 A, A->B, B->C, C->D |- D [Note: Extension of Implication Chain Rule, Theorem 11]

tHom34 = [A, (Imp A B), (Imp B C), (Imp C D)] `Theorem` D

proofe34=	( 	
				(	
					(
						(   
							( 
							Assume A,
							Assume (A`Imp`B)
						    )
						{----------------}`ImpE`
						B
						),
						Assume (B`Imp`C)
			 		)
					{--}`ImpE`
					C
				),
				Assume (C`Imp`D)
			)
			{--}`ImpE`
			D	
checke34=check_proof tHom34 proofe34


--Excercise 35 A -> B, Not B |- Not A [Note: This is Modus Tollens, Theorem 12]
tHom35 = Theorem [A`Imp`B,Not B] (Not A)
proofe35 = 	(
				(
					(
						(
							Assume A, 
							Assume(A`Imp`B)
						)
						{--}`ImpE`
						B
					),
					Assume (B`Imp`FALSE)
				)
				{--}`ImpE`
				FALSE
			)
			{--}`ImpI`
			(A`Imp`FALSE)
checke35=check_proof tHom35 proofe35

--Exercise 36  B \/ (Not B), A -> B |- (Not A) \/ B
--e36theorem = Theorem [(Or B (Not B)), (Imp A B) ] (Or (Not A) B)
e36theorem = [(Or B (Not B)), (Imp A B), A ] `Theorem` (Or (Not A) B)

e36proof= ((Assume(Or B (Not B)), (ID (Assume B) B), 
	((( ((Assume A, Assume(Imp A B)) 
		{-------------------------}`ImpE` 
                 	B), 
                 (Assume(Imp B FALSE))) 
                 {----------------------}`ImpE` 
                 FALSE)
                 {-----------------------}`CTR` 
                 B))
                 {-------------------------}`OrE` 
                 B) 
                 {------------------------}`OrIR` 
                 (Or (Not A) B)



e36cpt = check_proof e36theorem e36proof

--Exercise 37 A->B |- (Not B) -> (Not A) [Note: This conclusion is called the contrapositive of the premis]
tHom37 = Theorem [A`Imp`B] ((B`Imp`FALSE)`Imp`(A`Imp`FALSE))
proofe37 = 	
			(
				(	
					(
						(
							(
								Assume A, 
								Assume (A`Imp`B)
							)
							{--}`ImpE`
							B
						),
						Assume (B`Imp`FALSE)
					)
					{--}`ImpE`
					FALSE
				)
				{--}`ImpI`
				(A`Imp`FALSE)

			)
			{--}`ImpI`
			((B`Imp`FALSE)`Imp`(A`Imp`FALSE))

checke37=check_proof tHom37 proofe37

--Exercise 38  A \/ (B /\ C) |- (A \/ B) /\ (A \/ C) [Note: \/ distributes over /\.] ***
-- a ∧ (b ∨ c) = (a ∧ b) ∨ (a ∧ c) {∧ distributes over ∨}  


tHom38= Theorem [Or A (And B C), A] (A)

proof38 = (Assume(A 
			{------------}`Or` 
			(And B C)),((Assume A) 
			{-------------}`ID` 
			A),
			(((Assume A,((Assume(And B C)) 
				{------------}`AndER` 
				C)) 
			{-----------------}`AndI` 
			(And A C)) 
			{-----------------}`AndEL` 
			A)) 
			{--------------}`OrE` 
					A
        

cpt38 = check_proof tHom38 proof38




















