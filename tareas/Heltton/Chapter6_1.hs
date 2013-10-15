--Exercise 2. Check your understanding of or, and, and not by deciding what value each of these expressions has and then evaluating it with the com- puter (you will need to import the Stdm module provided on the web page for this book):
(a) False /\ True 
(b) True \/ (not True)
(c) not (False \/ True) 
(d) (not (False /\ True)) \/ False  = True
(e) (not True) ==> True 			= False
(f) True \/ False ==> True 			= True
(g) True ==> (True /\ False) 		= False
(h) False ==> False					= True
(i) (not False) <=> True			= True
(j) True <=> (False ==> False) 		= True
(k) False <=> (True /\ (False ==> True))	= False
(l) (not (True \/ False)) <=> False /\ True = True

--Exercise 3. Use the truth table functions to determine which of the following formulas are tautologies.
--Una tautologia son las expreciones que siempre son True.

-- P | Q | PVQ | QVP |  -> |
-----|---|-----|-----|-----|
-- T | T |  T  |  T  |  T  |
-- T | F |  T  |  T  |  T  |
-- F | T |  T  |  T  |  T  |   
-- F | F |  F  |  F  |  T  |
--


(a) (True∧P)∨Q 						= -- No es una tautologia.
(b) (P ∨Q)→(P ∧Q) 					= -- No es una tautologia
(c) (P ∧Q)→(P ∨Q) 					= -- Esto si es una tautologia
(d) (P∨Q)→(Q∨P)						= -- Si es tautologia
(e) ((P ∨Q)∧(P ∨R)) ↔ (P ∧(Q∨R)) 	= -- No es una tautologia.
-- Stdm


--Exercise 4. In this exercise, and several more that follow it, you are given an expression. Verify that the expression is a WFF by analyzing its constituents at all levels down to the atomic primitives. Build a truth table for the formula with one column for the formula itself (this should be the rightmost column), and one column for each constituent of the formula (at any level in the analysis).

--1 ¿WFF?
-- (True ^ P)v Q 
-- 2
-- P | Q | (True ^ P ) 	| v Q
-----|---|----------------------
-- T | T |  T  			| T
-- T | F |  T  			| T
-- F | T |  T  			| T
-- F | F |  F  			| F

--3.- Satisfactible.

{-
------------------------------------------------------------------------------

Exercise 5.	
1.-  (P ∨Q)∧(P ∨R)↔P ∧(Q∨R)

2.- 
 P 	|	Q 	| 	R 	| (P ∨Q)  |  ∧  |  (P ∨R) | ↔ | P ∧  | (Q∨R) |
 -----------------------------------------------------------------
 T 	|	T 	| 	T 	|    T    |  T  |    T    | T |  T   |   T   |   
 T 	|	T 	| 	F 	|    T    |  T  |    T    | T |  T   |   T   |   
 T	|	F 	| 	T 	|    T    |  T  |    T    | T |  T   |   T   |   
 T 	|	F 	| 	F 	|    T    |  T  |    T    | F |  F   |   F   |   
 F 	|	T 	| 	T 	|    T    |  T  |    T    | F |  F   |   T   |   
 F 	|	T 	| 	F 	|    T    |  F  |    F    | T |  F   |   T   |   
 F 	|	F 	| 	T 	|    F    |  F  |    T    | T |  F   |   T   |   
 F  |   F   |   F   |	 F 	  |	 F	|	 F 	  |	T |  F	 |   F   |
      
3.- Satisfactible

------------------------------------------------------------------------------

Exercise 6.

1.- ((P ∧¬Q) ∨(Q∧¬P))→¬(P ↔Q)

2.-

-- P | Q | ((P ∧¬Q) | ∨  | (Q∧¬P)) | →  |¬(P ↔ Q)
-----|---|-----------------------------------------
-- T | T |    F     | F  | 	 F	   |  T |    F
-- T | F |    T		| T	 | 	 F	   |  T |    T
-- F | T |    F		| T	 | 	 T	   |  T |    T
-- F | F |    F		| F	 | 	 F	   |  T |    F
 
3.-  Es tautologia.

------------------------------------------------------------------------------

Exercise 7.

1.- (P → Q) ∧ (P → ¬Q)

2.- 
-- P | Q | (P → Q)	| ∧  | (P → ¬Q)|
-----|---|-----------------------------------------
-- T | T |    T 	| F	 |    F 
-- T | F |    F 	| F	 |	  T
-- F | T |    T 	| T	 |    T
-- F | F |    T 	| T  |    T

3.- 
Satisfactible


------------------------------------------------------------------------------

Exercise 8.

1.-(P → Q) ∧ (¬P → Q)

2.- 
-- P | Q | (P → Q)	| ∧  | (¬P → Q)
-----|---|-----------------------------------------
-- T | T |    T		| T  |    T
-- T | F |    F		| F	 |    T
-- F | T |    T		| T	 |    T
-- F | F |    T		| F	 |    F

3.-
Satisfactible


------------------------------------------------------------------------------

Exercise 9.

1.- (P →Q)↔(¬Q→¬P)

2.-
-- P | Q | (P →Q)	|↔ 	 |  (¬Q→¬P)
-----|---|-----------------------------------------
-- T | T |    T		| T	 |		T
-- T | F |    F		| F	 |		T
-- F | T |    T		| F	 |		F
-- F | F |    T		| T	 |		T

3.- 
Satisfactoria


------------------------------------------------------------------------------

Exercise10. ProveP,Q,|- R P∧(Q∧R)

P,	Q,	R 	|- 	R 	 P∧ 	(Q∧R)
	------- {∧I}
P	Q ∧	R
------------- {∧ I}
P 	(Q∧R)

------------------------------------------------------------------------------
Exercise 11. Consider the following two propositions:
x = A∧(B∧(C∧D)) y = (A∧B)∧(C∧D)
Describe the shapes of the proofs for x and y, Assuming A, B, C, and D. Suppose each proposition has 2n propositional variables. What then would be the heights of the proof trees?

x = A∧(B∧(C∧D)) 
y = (A∧B)∧(C∧D)

A∧ 	(B∧	(C∧D)) 				(A∧B) 		∧ 	(C∧D)
		 ------{∧ER}		-----{∧ER}   	------{∧ER}
	B∧ 	 D         			 B     		∧	  D
	-----------{∧ER}		----------------------{∧ER}
A∧	D 								D
---------------{∧ER}
D

El más alto es el X debido a que ese debe ser desarrollado por partes.

------------------------------------------------------------------------------
Exercise 12. Prove (P ∧Q)∧R |- P ∧(Q∧R)

(P ∧Q) ∧ R |- P ∧(Q∧R)

(P ∧Q) ∧ R 			(P ∧Q) ∧ R 			(P ∧Q) ∧ R
-----------{∧EL}	-----------{∧EL} 	-------------{∧ER}
(P ∧ Q)				(P ∧ Q)				R
-----------{∧EL}	-----------{∧ER} 	
P					Q 					R
					----------------------------------{∧I}
p					(Q ∧ R)
------------------------------------------------------{∧I}
P ∧ (Q∧R)


------------------------------------------------------------------------------
Exercise13.ProveP,P→Q,(P∧Q)→(R∧S) |- S

P,P→Q,(P∧Q)→(R∧S) |- S

P,P→Q,			(P∧Q)			→ 		(R∧S) 			
------{→E} 		------{∧ER} 			---------{∧ER}
Q 				Q 				→ 		S
--------------------------------------------------{→E}
						S





------------------------------------------------------------------------------
Exercise14.ProveP→Q,R→S,P∧R |- S∧R.

P → Q, 	R → S,	P∧R 			P → Q, 	R → S,	P∧R 		P → Q, 	R → S,	P∧R			
			    -----{∧EL}						----{∧ER}                   ----{∧ER}
P → Q			P 						R → S	R 							R
---------------------{→E} 		---------------------{→E}
		Q 								S
-----------------------------------------------------{∧I}
			Q ∧ S
			-----------{∧ER}
				S 															R
------------------------------------------------------------------------------{∧I}
						(S∧R)				



------------------------------------------------------------------------------
Exercise15. ProveP |- Q→P∧Q

P |- Q→P∧Q

P 	[Q]
----------{∧I}
[Q]   P∧Q
--------------{→I}
Q → P∧Q

------------------------------------------------------------------------------
Exercise 16. Prove |- P ∧Q → Q∧P

|- 	P∧Q → Q∧P
	-----{∧ER}
	Q


------------------------------------------------------------------------------
Exercise 17. Prove P → False ∨ P 

P → False ∨ P




------------------------------------------------------------------------------
Exercise 18. Prove P, Q |- (P ∧Q)∨(Q∨R)

P, Q |- (P ∧Q)∨(Q∨R)

P 	Q
----------{∧I}
P∧Q
------------------{∨IL}
(P ∧Q)∨(Q∨R)

------------------------------------------------------------------------------



P,P→Q,(P∧Q)→(R∧S) |- S.

Exercise13.ProveP,P→Q,(P∧Q)→(R∧S) |- S
P,P→Q,(P∧Q)→(R∧S) |- S



Exercise14. ProveP→Q,R→S,P∧R |- S∧R.

P→Q,R→S,P∧R |- S∧R.

p^R
------
P

}

para hoy, hasta el 18.




