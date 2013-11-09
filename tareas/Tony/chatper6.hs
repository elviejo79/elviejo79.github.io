import Stdm

-- Excercise 2

{-- 

(a) False /\ True = False
(b) True \/ (not True) = True
(c) not (False \/ True) = False
(d) (not (False /\ True)) \/ False = True
(e) (not True) ==> True = True
(f) True \/ False ==> True = True
(g) True ==> (True /\ False) = False
(h) False ==> False = True
(i) (not False) <=> True = True 
(j) True <=> (False ==> False) = True
(k) False <=> (True /\ (False ==> True)) = False
(l) (not (True \/ False)) <=> False /\ True = True

-}
exercise2a = False /\ True
exercise2b = True \/ (not True)
exercise2c = not (False \/ True)
exercise2d = (not (False /\ True)) \/ False
exercise2e = (not True) ==> True
exercise2f = True \/ False ==> True
exercise2g = True ==> (True /\ False)
exercise2h = False ==> False
exercise2i = (not False) <=> True
exercise2j = True <=> (False ==> False)
exercise2k = False <=> (True /\ (False ==> True))
exercise2l = (not (True \/ False)) <=> False /\ True


--Exercise 3
{- 

a) (True ∧ P) ∨ Q 
P  Q   True ∧ P   ∨ Q
-------------------------
T  T      T         T     
T  F      T         T
F  T      F         T
F  F      F         F

b) (P ∨ Q) -> (P ∧ Q) 
P  Q   P ∨ Q   P ∧ Q   ->
----------------------------
T  T      T       T      T
T  F      T       F      F
F  T      T       F      F
F  F      F       F      F

c) (P ∧ Q) -> (P ∨ Q)  Tautologia
P  Q   P ∧ Q   P ∨ Q   ->
---------------------------
T  T      T       T      T
T  F      F       T      T
F  T      F       T      T
F  F      F       F      T

d) (P ∨ Q) -> (Q ∨ P) 
P  Q  P ∨ Q   Q ∨ P   ->  
--------------------------
T  T     T       T     T
T  F     T       T     T
F  T     T       T     T
F  F     F       F     T

e) ((P ∨ Q) ∧ (P ∨ R)) ↔ (P ∧ (Q ∨ R))
P  Q  R   P ∨ Q   P ∨ R   ∧   Q ∨ R    P ∧   <->
-----------------------------------------------------
T  T  T     T        T      T      T       T     T
T  T  F     T        T      T      T       T     T
T  F  T     T        T      T      T       T     T
T  F  F     T        T      T      F       F     F
F  T  T     T        T      T      T       F     F
F  T  F     T        F      F      T       F     T
F  F  T     F        T      F      T       F     T
F  F  F     F        F      F      F       F     T

-}

--Exercise 4
{--.
(True ∧ P) ∨ Q  ==>  WFF  Satisfiable
P  Q   True ∧ P  ∨ Q
--------------------------
T  T       T      T
T  F       T      T
F  T       F      T
F  F       F      F
-}

--Excercise 5
{--
(P ∨ Q) ∧ (P ∨ R) ↔ P ∧ (Q ∨ R)  ==> WFF Satisfiable
P  Q  R   P ∨ Q   P ∨ R   ∧   Q ∨ R    P ∧   ↔
-----------------------------------------------------
T  T  T     T        T      T      T       T     T
T  T  F     T        T      T      T       T     T
T  F  T     T        T      T      T       T     T
T  F  F     T        T      T      F       F     F
F  T  T     T        T      T      T       F     F
F  T  F     T        F      F      T       F     T
F  F  T     F        T      F      T       F     T
F  F  F     F        F      F      F       F     T
-}


--Excercise 6
{--
((P ∧ ¬Q) ∨ (Q∧ ¬P))→¬(P ↔ Q)  ==> WFF Tautology
P  Q  P ∧ ¬Q   Q∧ ¬P   ∨   P ↔ Q  ¬  →
-------------------------------------------
T  T    F         F      F     T    F   T
T  F    T         F      T     F    T   T
F  T    F         T      T     T    T   T
F  F    F         F      F     T    T   T

-}
--Excercise 7
{--
(P → Q) ∧ (P →¬Q)  ==> WFF  Tautology
P  Q  P → Q    P →¬Q   ∧
--------------------------
T  T    T        F     F
T  F    F        T     F
F  T    T        T     T
F  F    T        T     T

-}

--Excercise 8
{--
(P → Q) ∧ (¬P → Q)
P  Q   P → Q   ¬P → Q   ∧
----------------------------
T  T    T        T      T       
T  F    F        T      F
F  T    T        T      T
F  F    T        F      F

-}

--Excercise 9

{--
(P → Q) ↔ (¬Q→¬P)
P  Q   P → Q   ¬Q→¬P  ↔
--------------------------
T  T    T        T    T
T  F    F        T    F
F  T    T        F    F
F  F    T        T    T

-}

--Excercise 10
{- Prove P,Q,R |- P ∧ (Q ∧ R)
   P     Q   R
 ----   ------- {∧I}
   P     Q ∧ R
  ---------------  {∧I}
  		P ∧ (Q ∧ R)
-}


--Excercise 7.
{- Prove (P ∧ Q) ∧ R |- P ∧ (Q ∧ R)
  (P ∧ Q) ∧ R                 (P ∧ Q) ∧ R                     (P ∧ Q) ∧ R                     
 ---------------{∧EL}         ---------------{∧EL}             ---------------{∧ER}     
         P ∧ Q                     P ∧ Q  								R
        --------{∧EL}            ----------{∧ER}
			  P                          Q                              R
		--------------------          -----------------------------------------{∧I}	
         	  P										Q ∧ R
         	-------------------------------------------------{∧I}
         					P ∧ (Q ∧ R)
-}

--Excercise 13
{-- Prove P, P → Q, (P ∧ Q) → (R ∧ S) |- S
   			P   P → Q
   		   ------------{→E}
   	  P        Q
   	---------------{I∧}   	
   			P ∧ Q	               (P ∧ Q) → (R ∧ S)
   	    --------------------------------------------------	{→E}
   	    				R ∧ S
   	    			  ---------{∧ER}
   	    			       S
   	    			  	
-}


--Excercise 14
{-- Prove P → Q, R → S, P ∧ R |- S ∧ R
     P ∧ R             
    --------{∧ER}    
        R              R → S            P ∧ R
       -----------------------{→E}     --------{∧ER}
				S                         R
              -------------------------------{I∧}
              			     S ∧ R  
-}


--Excercise 15
{- Prove P |- Q → P ∧ Q
	   	   P   [Q]
	      ---------{∧I}
	 [Q]      P ∧ Q
	------------------{→I}
		Q  → P ∧ Q

-}


--Excercise 16
{- Prove |- P ∧ Q → Q ∧ P
	 P ∧ Q  |-  Q ∧ P

	P ∧ Q            P ∧ Q		 
   --------{∧ER}	---------- {∧EL}
		Q               P
	  ----------------------{∧I}
	          Q ∧ P	

-}

--Excercise 17
{- Prove P → False ∨ P

	   P |- False ∨ P
       P  
   ------------{∨I}
   False ∨ P	

-}

--Excercise 18
{--Prove P, Q |- (P ∧ Q) ∨ (Q ∨ R)
	P    Q           Q    [R]
   --------{∧I}	    ----------{∨I}
    P ∧ Q             Q ∨ R
   ---------------------------{∨I} 
      (P ∧ Q) ∨ (Q ∨ R)

-}


-- Exercise 31  P,Q,R |- P ∧ (Q ∧ R)            
e31theorem = Theorem [P,Q,R] (And P (And Q R))  

e31proof = AndI 
            (
            Assume P
            ,
            (AndI (Assume Q,Assume R) (And Q R))
            )
          (And P (And Q R))


ex31cpt = check_proof e31theorem e31proof


--Exercise 32  A ∧ ¬A |- False   

e32theorem = Theorem [And A (Not A)] (FALSE)

e32proof = ImpE
            (
             AndEL (Assume(And A (Not A))) A
             ,
             AndER (Assume(And A (Not A))) (Not A)     
            )
            FALSE

e32cpt = check_proof e32theorem e32proof

--Exercise 33 A |- ¬(¬A) 
-- ¬(¬A) |- A
e33theorem = Theorem [Imp (Imp A FALSE) FALSE] (A)

e33proof =  RAA (ImpE (Assume (Imp A FALSE),
                Assume (Imp (Imp A FALSE) FALSE))
                FALSE)
                A

e33cpt = check_proof e33theorem e33proof


--Exercise 34  A, A->B, B->C, C->D |- D [Note: Extension of Implication Chain Rule, Theorem 11]  
e34theorem = Theorem [A, (Imp A B), (Imp B C), (Imp C D)] (D)

e34proof = ImpE(  
             (ImpE
              ((ImpE (Assume A, Assume(Imp A B)) B)
              ,
              Assume(Imp B C))
              C)
            ,
            Assume (Imp C D))
            D

e34cpt = check_proof e34theorem e34proof

-- Exercise 35 A -> B, Not B |- Not A [Note: This is Modus Tollens, Theorem 12]  
--e35theorem = Theorem [(Imp A B), (Not B)] (Not A)
e35theorem = Theorem [(Imp A B),(Imp B FALSE)] (Imp A FALSE)

e35proof = ImpI
            (ImpE
              ((ImpE (Assume A, Assume(Imp A B)) B)
              ,
              Assume (Imp B FALSE))
              FALSE)
            (Imp A FALSE)

e35cpt = check_proof e35theorem e35proof

------------------------------------------------------------------------------
------------------------------------------------------------------------------
--Exercise 36  B \/ (Not B), A -> B |- (Not A) \/ B
--e36theorem = Theorem [(Or B (Not B)), (Imp A B) ] (Or (Not A) B)
e36theorem = Theorem [(Or B (Not B)), (Imp A B), A ] (Or (Not A) B)

e36proof= OrIR(
          OrE (
            Assume(Or B (Not B)),
            (ID (Assume B) B),
            (CTR 
              (ImpE (
                (ImpE(Assume A, Assume(Imp A B)) B),
                (Assume(Imp B FALSE))
              ) FALSE)
            B)  
               
          ) B
          )
          (Or (Not A) B)



e36cpt = check_proof e36theorem e36proof

--Exercise 37 A->B |- (Not B) -> (Not A) [Note: This conclusion is called the contrapositive of the premis]
--e37theorem = Theorem [(Imp A B)] (Imp (Imp B FALSE) (Imp A FALSE))
e37theorem = Theorem [(Imp A B)] (Imp (Imp B FALSE) (Imp A FALSE))

e37proof = ImpI 
            (ImpI
              (ImpE (
                (ImpE (Assume A,Assume(Imp A B)) B),
                Assume(Imp B FALSE)
                )
                FALSE
              )
              (Imp A FALSE)
            ) 
            (Imp (Imp B FALSE) (Imp A FALSE))

e37cpt=check_proof e37theorem e37proof

--Exercise 38  A \/ (B /\ C) |- (A \/ B) /\ (A \/ C) [Note: \/ distributes over /\.] ***
-- a ∧ (b ∨ c) = (a ∧ b) ∨ (a ∧ c) {∧ distributes over ∨}  


--e38theorem = Theorem [Or A (And B C)] (And (Or A B) (Or A C))
e38theorem = Theorem [Or A (And B C), A] (And (Or A B) (Or A C))

e38proof = AndI(
            (OrIL(
              OrE( --1
                Assume(Or A (And B C)),
                (ID (Assume A) A),         
                (AndEL(AndI (Assume A,(AndER (Assume(And B C)) C)) (And A C)) A)
              ) A) --1
            (Or A B))
          ,  
            (OrIL(
              OrE(
                Assume(Or A (And B C)),
                (ID (Assume A) A),         
                (AndEL(AndI (Assume A,(AndER (Assume(And B C)) C)) (And A C)) A)
              ) A)
            (Or A C))
          )
          (And (Or A B) (Or A C))

     

e38cpt = check_proof e38theorem e38proof       
      
