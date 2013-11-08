import Stdm

-- Exercise 2. Check your understanding of or, and, and not by deciding what
-- value each of these expressions has and then evaluating it with the computer
-- (you will need to import the Stdm module provided on the web
-- page for this book):

-- (a) False /\ True =False
-- (b) True \/ (not True) = True
-- (c) not (False \/ True) = False
-- (d) (not (False /\ True)) \/ False = True
-- (e) (not True) ==> True = True
-- (f) True \/ False ==> True = 
-- (g) True ==> (True /\ False)
-- (h) False ==> False
-- (i) (not False) <=> True
-- (j) True <=> (False ==> False)
-- (k) False <=> (True /\ (False ==> True))
-- (l) (not (True \/ False)) <=> False /\ True

-- Exercise 3. Use the truth table functions to determine which of the following
-- formulas are tautologies.

{--(a) (True ∧ P) ∨ Q

	P 		Q 		True ∧ P 	∨ Q
	False	False	False		False
	False	True	False		False
	True	False	True		True
	True	True	True		True 

(b) (P ∨ Q) → (P ∧ Q)

	P 		Q 		P ∨ Q	P ∧ Q 		→
	False	False	False	False		True
	False	True	True	False		False
	True	False	True	False		False
	True	True	True	True		True

(c) (P ∧ Q) → (P ∨ Q)

	P 		Q 		P ∧ Q	P ∨ Q 		→
	False	False	False	False		True
	False	True	False	True		True
	True	False	True	True		True
	True	True	True	True		True	


(d) (P ∨ Q) → (Q ∨ P)
	
	P 		Q 		P ∨ Q	Q ∨ P 		→
	False	False	False	False		True
	False	True	True	True		True
	True	False	True	True		True
	True	True	True	True		True	


(e) ((P ∨ Q) ∧ (P ∨ R)) ↔ (P ∧ (Q ∨ R))
	
	P 		Q		R		P ∨ Q	P ∨ R	(P ∨ Q) ∧ (P ∨ R)		Q ∨ R	P ∧ (Q ∨ R)	↔
	False	False	False 	False	False	False					False	False			True
	False	False	True	False	True	False					True	False			True
	False	True	False	True	False	False					True	False			True
	False	True	True	True	True	True					True	False			False
	True	False	False	True	True	True					False	False			False
	True	False	True	True	True	True					True	True			True
	True	True	False	True	True	True					True	True			True
	True	True	True	True	True	True					True	True			True

	-}

	-- Exercise 4. In this exercise, and several more that follow it, you are given
-- an expression. Verify that the expression is a WFF by analyzing its
-- constituents at all levels down to the atomic primitives. Build a truth
-- table for the formula with one column for the formula itself (this should
-- be the rightmost column), and one column for each constituent of the
-- formula (at any level in the analysis).
-- Each row in the table will correspond to a distinct combination of values
-- of the atomic primitives in the formula, and the rows will exhaust all
-- possible such combinations. Each column will begin with a heading,
-- which is a WFF (the full WFF or one of its constituents), and will be
-- filled with the value of the WFF that corresponds to the combination of
-- values of the primitives represented by a particular row.
-- A WFF is said to be satisfiable if it is True for some values of its propositional
-- variables. All WFFs fall into exactly one of three categories:
-- tautology, contradiction, or satisfiable but not tautology. Based on the
-- results in the truth table, place the WFF in one of these categories.

{--	(True ∧ P) ∨ Q

	P 		Q		True ∧ P 	(True ∧ P) ∨ Q
	False	False	False		False
	False	True	False		False
	True	False	True		True
	True	True	True		True
	-}

-- Exercise 5. (P ∨ Q) ∧ (P ∨ R) ↔ P ∧ (Q ∨ R)

-- La expresion anterior es WFF, entonces
{--
	P 		Q		R		P ∨ Q	P ∨ R	(P ∨ Q) ∧ (P ∨ R)		Q ∨ R	P ∧ (Q ∨ R)	↔
	False	False	False 	False	False	False					False	False			True
	False	False	True	False	True	False					True	False			True
	False	True	False	True	False	False					True	False			True
	False	True	True	True	True	True					True	False			False
	True	False	False	True	True	True					False	False			False
	True	False	True	True	True	True					True	True			True
	True	True	False	True	True	True					True	True			True
	True	True	True	True	True	True					True	True			True
-}

-- Exercise 6. ((P ∧ ¬Q) ∨ (Q∧ ¬P)) → ¬(P ↔ Q)
{--	P 		Q		¬P 		¬Q 		P ∧ ¬Q 		Q ∧ ¬P 		(P ∧ ¬Q) ∨ (Q∧ ¬P)	P ↔ Q 	¬(P ↔ Q)	((P ∧ ¬Q) ∨ (Q∧ ¬P)) → ¬(P ↔ Q)
	False	False	True	True	False		False		False					True	False		True
	False	True	True	False	False		True		True					False	True		True
	True	False	False	True	True		False		True					False	True		True
	True	True	False	False	False		False		False					True	False		True
	-}

{-- Exercise 7. (P → Q) ∧ (P →¬Q)

	P 		Q 		P → Q 	¬Q 		P → ¬Q 	(P → Q) ∧ (P →¬Q)
	False	False	True	True	True	True
	False	True	True	False	True	True
	True	False	False	True	True	False
	True	True	True	False	False	False

-- Exercise 8. (P → Q) ∧ (¬P → Q)

	P 		Q 		P → Q 	¬P 		¬P → Q 	(P → Q) ∧ (¬P → Q)
	False	False	True	True	False	False		
	False	True	True	True	True	True
	True	False	False	False	True	False
	True	True	True	False	True	True

-- Exercise 9. (P → Q) ↔ (¬Q → ¬P)
	P 		Q 		P → Q 	¬Q		¬P 		¬Q → ¬P		(P → Q) ↔ (¬Q → ¬P)
	False	False	True	True	True	True		True		
	False	True	True	True	True	True		True
	True	False	False	False	False	False		True
	True	True	True	False	False	True		True

-- Exercise 10. Prove P,Q,R |- P ∧ (Q ∧ R).

-- Exercise 11. Consider the following two propositions:
		x = A ∧ (B ∧ (C ∧ D))
		y = (A ∧ B) ∧ (C ∧ D)

--	Describe the shapes of the proofs for x and y, Assuming A, B, C, and
--	D. Suppose each proposition has 2n propositional variables. What then
--	would be the heights of the proof trees?


-- Exercise 12. Prove (P ∧ Q) ∧ R |- P ∧ (Q ∧ R).

	(P ∧ Q) ∧ R 			(P ∧ Q) ∧ R 			(P ∧ Q) ∧ R
	_____________{∧EL}		_____________{∧EL}		_____________{∧ER}
		P ∧ Q 					P ∧ Q 						R
		_______{∧EL}			_______{∧EL}
		  P 						Q
		  						_________________________________{∧I}
		  						  			Q ∧ R
	_____________________________________________________________{∧I}	
					P ∧ (Q ∧ R)


-- Exercise 13. Prove P, P → Q, (P ∧ Q) → (R ∧ S) |- S.
   			P   P → Q
   		   ____________{→E}
   	  P        Q
   	____________________{I∧}   	
   			P ∧ Q	               (P ∧ Q) → (R ∧ S)
   	    ______________________________________________	{→E}
   	    				R ∧ S
   	    			  __________{∧ER}
   	    			       S

-- Exercise 14. Prove P → Q, R → S, P ∧ R |- S ∧ R.
     P ∧ R             
    __________{∧ER}    
        R              R → S            P ∧ R
       ______________________{→E}     __________{∧ER}
				S                         R
              _______________________________{I∧}
              			     S ∧ R  

-- Exercise 15. Prove P |- Q → P ∧ Q.
		P Q
     __________{∧I}
Q   P ∧ Q
_________________{→I}
    Q → P ∧ Q


-- Exercise 16. Prove |- P ∧ Q → Q ∧ P.
              P ∧ Q  |-  Q ∧ P
	     P ∧ Q            P ∧ Q		 
        _______{∧ER}	___________ {∧EL}
		Q               P
	    ____________________________{∧I}
	          Q ∧ P	

-- Exercise 17. Prove P → False ∨ P.
	       P |- False ∨ P
           P  
      _____________________{∨I}
             False ∨ P	

-- Exercise 18. Prove P, Q |- (P ∧ Q) ∨ (Q ∨ R).
	   P    Q           Q    [R]
      ________{∧I}	   __________{∨I}
       P ∧ Q             Q ∨ R
      ____________________________{∨I} 
             (P ∧ Q) ∨ (Q ∨ R)
-}

-- Theorem 35
theorem35 = [P,Q]`Theorem`(P `And` Q)

prooft35 = (Assume P, Assume Q)
			{-------------------} `AndI`
			 (P `And` Q)
cpt35 = check_proof theorem35 prooft35


-- Theorem37
theorem37 = [P,Q,R] `Theorem`((P `And` Q) `And` R)
prooft37 = ((Assume P, Assume Q)
			{------------------} `AndI`
			(P `And` Q), Assume R)
			{--------------------} `AndI`
			((P `And` Q) `And` R)
cpt37 = check_proof theorem37 prooft37


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

-- Homework 31
hm31 = Theorem [P,Q,R] (And P(And Q R))
prooft31 = (Assume P,
					  (Assume Q, Assume R)
					  {------------------}`AndI`
					  			 (Q`And`R))
								 {--------}`AndI`
								 (P`And`(Q`And`R))

cpt31 = check_proof hm31 prooft31

-- homework 32
hm32 = [(A `And` (Not A))] `Theorem` (FALSE)
prooft32 = ((Assume(A `And` (Not A))
        {------------------------} `AndEL`
             A),
       (Assume (A `And` (Not A))
       {--------------------} `AndER`
         (Not A)))
        {--------------------} `ImpE`                                                                                                                 
         FALSE
cpt32 = check_proof hm32  prooft32

--Excercise 33 A |- Not(Not A)
hm33 = Theorem [Not(Not A)] (A)
prooft33= 	((Assume (A `Imp` FALSE),
			   	Assume ((A `Imp` FALSE) `Imp` FALSE))
			   	{------------------------------------}`ImpE`
				                 FALSE)
			                {-----------}`RAA`
		                       	A
cpt33=check_proof hm33 prooft33

--Excercise 34 A, A->B, B->C, C->D |- D [Note: Extension of Implication Chain Rule, Theorem 11]

hm34 = Theorem [A,A`Imp`B,B`Imp`C,C`Imp`D] (D)
prooft34=	(((((Assume A,
						Assume (A`Imp`B))
						{----------------}`ImpE`
						B),
						Assume (B`Imp`C))
					   {-----------------}`ImpE`
					           C),
				         Assume (C`Imp`D))
			        {-----------------------}`ImpE`
			                    D	
cpt34=check_proof hm34 prooft34

--Excercise 35 A -> B, Not B |- Not A [Note: This is Modus Tollens, Theorem 12]
hm35 = Theorem [A`Imp`B,Not B] (Not A)
prooft35b = 	((((Assume A, 
						Assume(A`Imp`B))
						{---------------}`ImpE`
						B),
					Assume (B`Imp`FALSE))
				{-------------------------}`ImpE`
				          FALSE)
			      {----------------}`ImpI`
			         (A`Imp`FALSE)

cpt35b=check_proof hm35 prooft35b

--Exercise 37 A->B |- (Not B) -> (Not A) [Note: This conclusion is called the contrapositive of the premis]
hm37 = Theorem [A`Imp`B] ((B`Imp`FALSE)`Imp`(A`Imp`FALSE))
prooft37b =(((((Assume A, 
						Assume (A`Imp`B))
					    {---------------}`ImpE`
							  B),
						Assume (B`Imp`FALSE))
					{------------------------}`ImpE`
					          FALSE)
				{----------------------------}`ImpI`
				            (A`Imp`FALSE))
			    {----------------------------}`ImpI`
			     ((B`Imp`FALSE)`Imp`(A`Imp`FALSE))

cpt37b=check_proof hm37 prooft37b