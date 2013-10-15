{-Excercise 2. 

True ==> False = False, todos los demas implica True
<=> Equivalente

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

{-Exercise 3.Use the truth table functions to determine which of the following
formulas are tautologies.
Es tautología si siempre da verdadero

(a) (True∧P)∨Q
	P 		Q     
	T 		T 	T
	T 		F 	T
	F 		T   T
	F 		F   F
	 No es tautología

(b) (P∨Q)→(P∧Q)
	P 		Q  P∨Q    P∧Q     ->
	T 		T 	T 		T 		T     
	T 		F 	T 		F       F
	F 		T   
	F 		F   
     No es tautología

(c) (P∧Q)→(P∨Q)
	P 		Q  P∧Q    P∨Q     ->
	T 		T 	T 		T 		T     
	T 		F 	F 		T       T
	F 		T   F       T       T      
	F 		F   F       F       T
      Es tautología

(d) (P∨Q)→(Q∨P)
	P 		Q  P∨Q    Q∨P     ->
	T 		T 	T 		T 		T     
	T 		F 	T 		T       T
	F 		T   T       T 		T
	F 		F   F       F  		T
      Es tautología

(e) ((P∨Q)∧(P∨R))<->(P∧(Q∨R))
	P   Q   R       
	T   T   T       T∧T<->T∧T = T
	T   T   F       T∧T<->T∧T = T
	T   F   T       T∧T<->T∧T = T
	T   F   F       T∧T<->T∧F = T<->F = F
	F   T   T
	F   T   F
	F   F   T
	F   F   F
	 No es tautología
-}

{-Exercise 4.
Tautología, satisfacible, no satisfacible (contrario de tatutología)

(True∧P)∨Q WFF
(a) (True∧P)∨Q
	P 		Q  True∧P     (True∧P)∨Q
	T 		T 	T 			T
	T 		F 	T 			T
	F 		T   F 			T
	F 		F   F 			F
	 Satisfacible
-}

{-

Exercise 5.
(P∨Q)∧(P∨R)<->P∧(Q∨R)  WFF
                                     *                         *                 <->
	P   Q   R  (P∨Q)   (P∨R)  (P∨Q)∧(P∨R)  P   (Q∨R)   P∧(Q∨R)    (P∨Q)∧(P∨R)<->P∧(Q∨R)
	T   T   T    T        T          T         T     T         T                   T          
	T   T   F    T        T          T         T     T         T                   T   
	T   F   T    T        T          T         T     T         T                   T   
	T   F   F    T        T          T         T     F         F                   F   
	F   T   T    T        T          T         F     T         F                   F
	F   T   F    T        F          F         F     T         F                   T
	F   F   T    F        T          F         F     T         F                   T
	F   F   F    F        F          F         F     F         F                   T
     Satisfacible

Exercise 6.
((P∧¬Q) ∨(Q∧¬P))→¬(P<->Q)
	P   Q  ¬Q  (P∧¬Q)  ¬P   (Q∧¬P)  (P∧¬Q) ∨(Q∧¬P)     ¬(P<->Q)     ((P∧¬Q) ∨(Q∧¬P))→¬(P<->Q)
	T   T   F     F     F       F            F                 F                   T  
	T   F   T     T     F       F            T                 T                   T
	F   T   F     F     T       T            T                 T                   T
	F   F   T     F     T       F            F                 F                   T
	  Tautología
	

Exercise 7.
(P→Q)∧(P→¬Q) Well formed formula WFF

	P   Q  ¬Q  P→Q   P→¬Q     (P→Q)∧(P→¬Q)
	T   T   F   T      F             F
	T   F   T   F      T             F
	F   T   F   T      T             T
	F   F   T   T      T             T
	  Satisfacible

Exercise 8.
(P→Q)∧(¬P→Q)  WFF

	P   Q  ¬P  P→Q   ¬P→Q     (P→Q)∧(¬P→Q)
	T   T   F   T       T            T   
	T   F   F   F       T            F
	F   T   T   T       T            T
	F   F   T   T       F            F
	   Satisfacible

Exercise 9.
(P→Q)<->(¬Q→¬P)  WFF

	P   Q  ¬Q  ¬P  P→Q    ¬Q→¬P      (P→Q)<->(¬Q→¬P) 
	T   T   F   F   T        T               T
	T   F   T   F   F        F               T
	F   T   F   T   T        T               T
	F   F   T   T   T        T               T
		Tautología
-}

{-Theorem 38.P, Q∧R	|-P∧Q
 	Q^R
 P	 Q         {^EL}
  P^Q 		   {^I}
-}

{-Exercise 10. Prove P, Q, R |- P∧(Q∧R).
	  P, Q, R {∧I}
	  P, Q∧R {∧I}
	  P ∧ (Q∧R)
-}

{-Exercise 11.Consider the following two propositions:
x = A∧(B∧(C∧D))
y =(A∧B)∧(C∧D)
Describe the shapes of the proofs for x and y, Assuming A, B, C,and D. Suppose each proposition has 2n propositional variables. What then
would be the heights of the proof trees?
X=2n
y=n
-}

{-
Exercise 12.Prove (P∧Q)∧R |- P∧(Q∧R)
	P∧Q {∧EL}             (P∧Q)∧R   {∧EL}        (P∧Q)∧R     {∧ER}
	P                      (P∧Q)   {∧ER}              R
    P                      Q                           R   {∧I}
    P                      Q∧R    {∧I}
    			P∧(Q∧R)
.-}

{-Exercise 13.ProveP, P→Q,(P∧Q)→(R∧S) |-S 

P, P→Q,(P∧Q)→(R∧S) |-S
   Q, (P∧Q)→(R∧S) {->E}
   Q, Q -> (R∧S) {->E}
   (R∧S)   {∧ER}
    S |- S

.-}


{-Exercise 14.Prove P→Q, R→S, P∧R |- S∧R.
P^R   {AI}
 P     P->Q  {->E}
       Q          (P^R)     {^I}
       Q^(P^R)     {EAD}
          P^R       {EAD}
            R      R->S   {->E}        P^R   {EAD}
                   S                     R   {^I}
                         S^R

-}

{-Exercise 15.Prove P |- Q→P∧Q  

  {∧ER}   P∧Q           Q->P∧Q {∧EL}
           Q             P∧Q    {->E}
               P

.-}

{-Exercise 16.Prove |- P∧Q→Q∧P.
	           P∧Q |- Q∧P
	 P∧Q {∧ED} 		 Q∧P {∧EI}
     Q 					    P   {∧I}
              Q∧P
-}
 
 {-
Exercise 17.Prove P → False∨P.
{∨IL} P -> False ∨ P 
      False∨P -> False∨P

Exercise 18.Prove P, Q |- (P∧Q)∨(Q∨R)
         P     Q             Q  
           P∧Q {∧I}        Q∨R   {∨IR}
             (P∧Q)  ∨     (Q∨R)  {∨IL}
 -}