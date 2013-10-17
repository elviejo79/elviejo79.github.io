import Stdm

--teorema35
theorem35 = [P,Q] `Theorem` (P `And` Q)
prooft35 = (Assume P, Assume Q)
           {------------------} `AndI`
               (P `And` Q)
cpt35 = check_proof theorem35 prooft35

--teorema 37  P, Q, R |- (P ∧ Q) ∧ R
t37 = [P,Q,R] `Theorem` ((P `And` Q) `And` R)
prooft37 = ((Assume P, Assume Q)
	       {------------------}`AndI`
	       (P `And` Q), Assume R)
		   {------------------}`AndI`
		   ((P `And` Q) `And` R)
cpt37 = check_proof t37 prooft37 

--teorema 39
t39 = [((P `And` Q) `And` R)] `Theorem` (R `And` Q)
p39 = ((Assume((P `And` Q) `And` R)
	   {-------------------------}`AndER`
	   R),
			(Assume ((P `And` Q)`And` R)
			{-------------------------}`AndEL`
			(P `And` Q)
			{-----------}`AndER`
			Q))
			{------------------} `AndI`
			(R `And` Q)
cpt39 = check_proof t39 p39



--teorema35 otra vez P, Q |- P ∧ Q
teo35 = [P,Q] `Theorem` (P `And` Q)
prueba = (Assume P, Assume Q) 
		{------------------} `AndI`
 			(P `And` Q)
cpteo35 = check_proof teo35 prueba

----teorema 37  P, Q, R |- (P ∧ Q) ∧ R
teo37 = [P,Q,R] `Theorem` ((P `And` Q) `And` R)
preuba37 = ((Assume P, Assume Q)
			{-----------------} `AndI`
			(P `And` Q), Assume R)
			{-----------------} `AndI`
			((P `And` Q) `And`R)
cpteo37 = check_proof teo37 preuba37

--Theorem 38. P, Q∧R |- P ∧ Q
teo38 = [P,(Q `And` R)] `Theorem` (P `And` Q)
pruebateo38 = (Assume P, (Assume(Q `And` R)
	                   {-----------------------}`AndEL`
	                               (Q)))
	                    {----------------------}`AndI`
	                    (P `And` Q)
cpteo38 = check_proof teo38 pruebateo38

--Theorem 40. P ∧ Q |- Q ∧ P
teo40 = [(P `And` Q)] `Theorem` (Q `And` P)
pruebateo40 = ((Assume (P `And` Q)
					{----------}`AndER`
					(Q)),(Assume (P `And` Q)
					{-----------}`AndEL`
					(P)))
					{-----------}`AndI`
					(Q `And` P)
cpteo40 = check_proof teo40 pruebateo40

--theorem 42 Q ∧ P, P ∧ Q → R |- R.
teo42 = [(Q `And` P), ((P `And` Q) `Imp` R)] `Theorem` R
--pruebateo42 = --(Assume(Q `And` P)
				--	{---------}`AndER`
				--		(P), Assume(Q `And` P)
				--	{----------------}`AndEL`
				--		(Q))
				--	{---------------------} `AndI`
				--	     (Q `And` P)
					--Assume(P `Imp`Q)
             		--	{-----------------}`ImpE`
              			--	Q	   
                        -- {----------------------------------}`ImpE`
                              --        (R)
--cpteo42 = check_proof teo42 pruebateo42
-------------------------------------------------------
{-
Exercise 2. 

(a) False /\ True = False
(b) True \/ (not True) = True
(c) not (False \/ True) = False
(d) (not (False /\ True)) \/ False = True
(e) (not True) ==> True = True
(f ) True \/ False ==> True = True
(g) True ==> (True /\ False) = False
(h) False ==> False = True
(i) (not False) <=> True = True
(j) True <=> (False ==> False) = True
(k) False <=> (True /\ (False ==> True)) = False
(l) (not (True \/ False)) <=> False /\ True = True
-}
--------------------------------------------------------------
--Exercise 3
{-
(a) (True ∧ P) ∨ Q   = NO ES UNA TAUTOLOGIA
(b) (P ∨ Q) → (P ∧ Q) = No es una tautologia
(c) (P ∧ Q) → (P ∨ Q) = si es una tautologia
(d) (P ∨ Q) → (Q ∨ P) = Si es una tautologia
(e) ((P ∨ Q) ∧ (P ∨ R)) ↔ (P ∧ (Q ∨ R)) = No es una tautologia

-----a-------
| P | Q | True /\ P | (True /\ P) V Q |
| T | T | T         | T               |
| T | F | T         | T               |
| F | T | F         | T               |
| F | F | F         | F               |

-----b------
| P | Q | (P \/ Q) | (P /\ Q) | (P \/ Q) -> (P /\ Q)|
| T | T | T       | T         | T                   |
| T | F | T       | F         | F                   |
| F | T | T       | F         | F                   |
| F | F | F       | F         | T                   |

------c-----
| P | Q | (P /\ Q) | (P \/ Q) | (P /\ Q) -> (P \/ Q) |
| T | T | T        | T        | T                    |
| T | F | F        | T        | T                    |
| F | T | F        | T        | T                    |
| F | F | F        | F        | T                    |

----d-----
| P | Q | (P \/ Q) | (Q \/ P) | (P \/ Q) -> (Q \/ P) |
| T | T | T        | T        | T                    |
| T | F | T        | T        | T                    |
| F | T | T        | T        | T                    |
| F | F | F        | F        | T                    |

-----------e----------------

P|Q|R|P∧Q|P∨R|∧|Q∨R|∨P|<->
T|T|T|T   |T  |T |T   |T  |T
T|T|F|T   |T  |T |T   |T  |T
T|F|T|T   |T  |T |T   |T  |T
T|F|F|T   |T  |T |F   |F  |F
F|T|T|T   |T  |T |T   |F  |F
F|T|F|T   |F  |F |T   |F  |T
F|F|T|F   |T  |F |T   |F  |T
F|F|F|F   |F  |F |F   |F  |T
-}
---------------------------------------------------------------
{-Exercise 4. 
(True ∧ P) ∨ Q  ==>  WFF  Satisfiable

P  |Q   True ∧ P  |∨ Q
T  |T       T      |T
T  |F       T      |T
F  |T       F      |T
F  |F       F      |F
-}
------------------------------------------------------------------
{-EXERCISE 5
P|Q|R|P∧Q|P∨R|∧|Q∨R|∨P|<->
T|T|T|T   |T  |T |T   |T  |T
T|T|F|T   |T  |T |T   |T  |T
T|F|T|T   |T  |T |T   |T  |T
T|F|F|T   |T  |T |F   |F  |F
F|T|T|T   |T  |T |T   |F  |F
F|T|F|T   |F  |F |T   |F  |T
F|F|T|F   |T  |F |T   |F  |T
F|F|F|F   |F  |F |F   |F  |T

es WFF
Es satisfactible pero no es un a tautologia
-}
-------------------------------------------------------
{-exercise 6 ((P ∧¬Q) ∨ (Q ∧¬P)) →¬(P ↔ Q)
P|Q|P∧|Not Q|∨|Q∧|Not P|->|NoT|P<->Q
1|1|0 |0     |0|0  |0    |1 |0  |1
1|0|1 |1     |1|0  |0    |1 |1  |0
0|1|0 |0     |1|1  |1    |1 |1  |0
0|0|0 |1     |0|0  |0    |1 |0  |1

si es taotologia y es satisfactible 
-}
-------------------------------------------------------
{-Exercise 7 (P → Q) ∧ (P →¬Q)
 P | Q | Not Q| P->Q | P-> Not Q  | (P->Q) /\ (P-> Not Q)
 T | T | F  | T    | F       |  F                   
 T | F | T  | F    | T       |  F                 
 F | T | F  | T    | T       |  T                 
 F | F | T  | T    | T       |  T                 

es WFF
Es satisfactible pero no es un a tautologia
-}
------------------------------------------------------
{-Exercise 8 (P → Q) ∧ (¬P → Q)
 P | Q |Not P | P->Q | (Not P)->Q | (P->Q) /\ (Not P -> Q)
 T | T | F  | T    | T        | T                   
 T | F | F  | F    | T        | F                   
 F | T | T  | T    | T        | T                   
 F | F | T  | T    | F        | F   

 es WFF
Es satisfactible pero no es un a tautologia                
-}
--------------------------------------------------------
{-Exercise 9 (P → Q) ↔ (¬Q →¬P)
 P | Q | -.P |-.Q | P->Q | -.Q -> -.P | (P->Q)<->(-.Q->-.P) 
 T | T | F   | F  | T    |  T         | T                   
 T | F | F   | T  | F    |  F         | T                     
 F | T | T   | F  | T    |  T         | T                   
 F | F | T   | T  | T    |  T         | T  
 si es taotologia y es satisfactible                 
-}
----------------------------------------------------------------
--Exercise 10. Prove P, Q, R |- P ∧ (Q ∧ R).
ex10 = [P,Q,R] `Theorem` (P `And` (Q `And` R))
prueba10 = (Assume P,((Assume Q, Assume R)
					  {------------------}`AndI`
					   (Q `And` R)))
					  {------------------}`AndI`
					  (P `And`(Q `And` R))
cp10 = check_proof ex10 prueba10

{-Prove P, Q, R |- P ∧ (Q ∧ R)
           {---}{∧I}
        P,  Q ∧ R
        {--------}∧I
        P ∧ (Q ∧ R)
-}
------------------------------------------------------
--Exercise 12. Prove (P ∧ Q) ∧ R |- P ∧ (Q ∧ R).
ex12 = [((P `And` Q) `And` R)] `Theorem` (P `And` (Q `And` R))
prueba12 = (Assume((P `And` Q) `And` R)
				  {------------------}`AndEL`
				  (P `And` Q)
				  {---------} `AndEL`
				  (P), (Assume((P `And` Q) `And` R)
				  			  {------------------}`AndEL`
				                 (P `And` Q)
				                 {---------} `AndER`
				                     (Q), Assume((P `And` Q) `And` R)
				                     			  {-----------------}`AndER`
				                     			  (R))
				  					{----------------}`AndI`
				  					(Q `And` R))
					{----------------------------}`AndI`
					(P `And` (Q `And` R))
cp12 = check_proof ex12 prueba12 
{-}
--Exercise 12. Prove (P ∧ Q) ∧ R |- P ∧ (Q ∧ R).
                     {-----------}{∧EL}
                        (P ∧ Q)
                        {-------}{∧ER}
                        	Q, (P ∧ Q) ∧ R
                        		{----------}{∧ER}
                        	Q, 	      R
                        	{----------}{∧I}
           (P ∧ Q) ∧ R    	    Q ∧ R
           {-----------}{∧EL} 
              (P ∧ Q)
              {------}{∧EL} 
                  P,             Q ∧ R
                  {-------------------}{∧I}
                        P ∧ (Q ∧ R)
-}
--------------------------------------------
{-} Exercise 13. Prove  P, P → Q, (P ∧ Q) → (R ∧ S) |- S.
						{--------} {→E}
						     Q , (P ∧ Q),           (P ∧ Q)
						     	 {------} {∧EL}    {------} {∧ER}
						     Q,      P,                 Q   → (R ∧ S)
						     {---------------------------------------}{→E}	 
						     				(R ∧ S)
						     				{------} {∧ER}
-}
-----------------------------------------------------------------------------
{-Exercise 14. Prove P → Q, R → S, P ∧ R |- S ∧ R.
					 P → Q,        R → S,          P ∧ R |- S ∧ R
					 {----}{→E}    {----}{→E}
					 	Q,            S
					 	{--------------}{∧I}
					 	       Q ∧ S,              P ∧ R
					 	       {-----} {∧ER}       {-----} {∧ER}
					 	          S,                   R
					 	          {---------------------}{∧I}
					 	          			S ∧ R
-}
--------------------------------------------------------------------------------
{-Exercise 15. Prove P |- Q → P ∧ Q.
				P   [Q]
	        {---------}{∧I}
	 [Q]      P ∧ Q
	{------------------}{→I}
		Q  → P ∧ Q
------------------------------------------------
Exercise 16. Prove |- P ∧ Q → Q ∧ P.
					  P ∧ Q 			P ∧ Q
					 {-----} {∧ER}     {-----} {∧EL}
					    Q                  P
					   {--------------------}{∧I}
					   			Q ∧ P
-}
-----------------------------------------------

{-Exercise 17. Prove P → False ∨ P

	   P |- False ∨ P
       P  
   ------------{∨I}
   False ∨ P	

-}
--------------------------------------
{-Exercise 18. Prove P, Q |- (P /\ Q) \/ (Q \/ R).
				     {---}{∧I}
					  P ∧ Q
					{---------} {∧IL}        
          			(P/\Q) \/ (Q\/R)
         
-}
--------------------------------------------------------
--ejercicio 31
e31 = [P,Q,R] `Theorem` (P`And`(Q `And` R))
proofe31 = AndI(Assume P, (AndI(Assume Q, Assume R)(And Q R)))
			(And P (And Q R))
cpe31= check_proof e31 proofe31
---------------------------------------------------------
--ejercicio 32      A /\ (Not A) |- False
e32 = [(A `And` (Not A))] `Theorem` (FALSE)
proofe32 = ((Assume (A `And` (Not A)) 
           {-------------} `AndEL`
           A),
			(Assume(A `And` (Not A))
			{--------------} `AndER`
			(Not A)))
			{---------------} `ImpE`
			FALSE
cpe32 = check_proof e32 proofe32
------------------------------------------------------------
--ejercicio 33  A |- Not(Not A)
e33 = [A] `Theorem` ((A `Imp` FALSE) `Imp` FALSE)
proofe33=(Assume A, Assume (A `Imp` FALSE ))
         {--------------------------} `ImpE`
                   FALSE
         {---------------------------} `ImpI`
                ((A `Imp` FALSE) `Imp` FALSE)
cpe33=check_proof e33 proofe33 
------------------------------------------------------------
--ejercicio34
e34=[A, A `Imp` B, B `Imp` C, C `Imp` D] `Theorem` (D)

proofe34=(((Assume A, Assume(A `Imp`B))
             {-----------------}`ImpE`
              B,  Assume (B `Imp` C))
                {--------------------} `ImpE`
                   C,         Assume (C `Imp` D))
                {---------------------------------} `ImpE`
                               D
cpe34=check_proof e34 proofe34
----------------------------------------------------------
--ejercicio35
e35 =  [( A `Imp` B),( B `Imp` FALSE)] `Theorem` ( A `Imp` FALSE)
proofe35 =  (((
			(Assume A, Assume( A `Imp` B))
              {-----------------------}`ImpE`
              B), Assume ( B `Imp` FALSE))
             {------------------------------} `ImpE`
             	 FALSE)
            {--------------------------------} `ImpI`
            		( A `Imp` FALSE)

cp35 = check_proof e35 proofe35
-------------------------------------------------------------
--ejercicio37
e37=[A `Imp` B] `Theorem` ((B `Imp` FALSE) `Imp` (A `Imp` FALSE))
proofe37=(((Assume A, Assume(A `Imp`B))
             {-----------------}`ImpE`
              B),  Assume (B `Imp` FALSE))
                {--------------------} `ImpE`
                   FALSE
                {-----------------} `ImpI`
                  (A `Imp` FALSE)
                {-----------------} `ImpI`
                 ((B `Imp` FALSE) `Imp` (A `Imp` FALSE))
cpe37=check_proof e37 proofe37
-------------------------------------------------------------