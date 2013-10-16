--ghci -x *.lhs Nombre.hs

--Theorem 35

import Stdm
theorem35=[P,Q]`Theorem`(P`And`Q)

prooft35=	(Assume P, Assume Q)
			{------------------} `AndI`
 			(P `And` Q)


cpt35=check_proof theorem35 prooft35


--Theorem 37

theorem37=[P,Q,R] `Theorem` ((P`And`Q)`And`R)
prooft37= ((Assume P, Assume Q)
		{------------------}`AndI`
		(P`And`Q), Assume R)
			{-----------------}`AndI`
		((P`And`Q)`And`R)

cpt37=check_proof theorem37 prooft37

--Theorem 39

theorem39=[((P`And`Q)`And`R)]`Theorem`(R`And`Q)

prooft39=	((Assume ((P`And`Q)`And`R)
			{----------------------}`AndER`
						 R),
			(Assume ((P`And`Q)`And`R)
			{-----------------}`AndEL`
					(P`And`Q)
			{---------------}`AndER`
						   Q))
			{---------------}`AndI`
					(R`And`Q)

cpt39=check_proof theorem39 prooft39

 
 --Excersise 31 P, Q, R	- P /\ (Q /\ R)
e31=Theorem [P,Q,R] (And P(And Q R))
proofe31=AndI(Assume P,(AndI(Assume Q, Assume R)(And Q R)))
         (And P(And Q R))

proofE31'= (Assume P,
					  (Assume Q, Assume R)
					  {------------------}`AndI`
					  			 (Q`And`R))
								 {--------}`AndI`
								 (P`And`(Q`And`R))


checke31=check_proof e31 proofe31
checke31'=check_proof e31 proofE31'



--Excercise 32 A /\ (Not A) |- False                                                                                                                             
e32 = [(A `And` (Not A))] `Theorem` (FALSE)
pe32 = ((Assume(A `And` (Not A))
        {------------------------} `AndEL`
             A),
       (Assume (A `And` (Not A))
       {--------------------} `AndER`
         (Not A)))
        {--------------------} `ImpE`                                                                                                                 
         FALSE
checke32 = check_proof e32 pe32

--Excercise 33 A |- Not(Not A)
e33 = Theorem [Not(Not A)] (A)
proofe33= 	(
				(
				Assume (A `Imp` FALSE),
			   	Assume (
			   			(A `Imp` FALSE) `Imp` FALSE
			   		   )
			  	)
			  	{---}`ImpE`
				FALSE
			)
			{---}`RAA`
			A
checke33=check_proof e33 proofe33
	  	

--Excercise 34 A, A->B, B->C, C->D |- D [Note: Extension of Implication Chain Rule, Theorem 11]

e34 = Theorem [A,A`Imp`B,B`Imp`C,C`Imp`D] (D)
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
checke34=check_proof e34 proofe34


--Excercise 35 A -> B, Not B |- Not A [Note: This is Modus Tollens, Theorem 12]
e35 = Theorem [A`Imp`B,Not B] (Not A)
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
checke35=check_proof e35 proofe35

--Exercise 36 B \/ (Not B), A -> B |- (Not A) \/ B


--Exercise 37 A->B |- (Not B) -> (Not A) [Note: This conclusion is called the contrapositive of the premis]
e37 = Theorem [A`Imp`B] ((B`Imp`FALSE)`Imp`(A`Imp`FALSE))
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

checke37=check_proof e37 proofe37

--Exercise 38 A \/ (B /\ C) |- (A \/ B) /\ (A \/ C) [Note: \/ distributes over /.]