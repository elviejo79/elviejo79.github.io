
----------------------------------------------------
Ejercicio 2.
(a) False /\ True 
False 
(b) True \/ (not True)
True
(c) not (False \/ True)
False
(d) (not (False /\ True)) \/ False
True
(e) (not True) ==> True
False
(f) True \/ False ==> True
True
(g) True ==> (True /\ False)
False
(h) False ==> False
True
(i) (not False) <=> True
True
(j) True <=> (False ==> False)
True
(k) False <=> (True /\ (False ==> True))
False
(l) (not (True \/ False)) <=> False /\ True
True


----------------------------------------------------
Exercise 3. Use the truth table functions to determine which of the following
formulas are tautologies.

(a) (True ∧ P ) ∨ Q
(b) (P ∨ Q) → (P ∧ Q)
(c) (P ∧ Q) → (P ∨ Q)
(d) (P ∨ Q) → (Q ∨ P )
(e) ((P ∨ Q) ∧ (P ∨ R)) ↔ (P ∧ (Q ∨ R))


(a) (True ∧ P ) ∨ Q
P Q  |  
T T  | T
T F  | T
F T  | T
F F  | F

NO ES TAUTOLOGIA

(b) (P ∨ Q) → (P ∧ Q)
P Q  |  
T T  | T
T F  | F
F T  | 
F F  | 

NO ES TAUTOLOGIA 

(c) (P ∧ Q) → (P ∨ Q)
P Q  |  
T T  | T
T F  | T
F T  | T
F F  | T

SI ES TAUTOLOGÍA

(d) (P ∨ Q) → (Q ∨ P )
P Q  |  
T T  | 
T F  | 
F T  | 
F F  | 

SI ES TAUTOLOGÍA

(e) ((P ∨ Q) ∧ (P ∨ R)) ↔ (P ∧ (Q ∨ R))
P Q R  |  

F F F  | T
F F T  | T
F T F  | T
F T T  | F
T F F  | F
T F T  | T
T T F  | T
T T T  | T
  
----------------------------------------------------
Exercise 4. In this exercise, and several more that follow it, you are given
an expression. Verify that the expression is a WFF by analyzing its
constituents at all levels down to the atomic primitives. Build a truth
table for the formula with one column for the formula itself (this should
be the rightmost column), and one column for each constituent of the
formula (at any level in the analysis).
Each row in the table will correspond to a distinct combination of values
of the atomic primitives in the formula, and the rows will exhaust all
possible such combinations. Each column will begin with a heading,
which is a WFF (the full WFF or one of its constituents), and will be
filled with the value of the WFF that corresponds to the combination of
values of the primitives represented by a particular row.
A WFF is said to be satisfiable if it is True for some values of its propo-
sitional variables. All WFFs fall into exactly one of three categories:
tautology, contradiction, or satisfiable but not tautology. Based on the
results in the truth table, place the WFF in one of these categories.

(True ∧ P ) ∨ Q

1. Si es una WFF
2. Analizando tablas de verdad.
P Q  |  
T T  | T
T F  | T
F T  | T
F F  | F

3. Es Satisfacible. Pq es verdadera para alguno de los casos.

----------------------------------------------------
Exercise 5.
(P ∨ Q) ∧ (P ∨ R) ↔ P ∧ (Q ∨ R)
1. WFF?  SI 
2. Analizando tablas de verdad.
P Q R | 
T T T | T
T T F | T
T F T | T
T F F | F
F T T | F
F T F | T
F F T | T
F F F | T

3. Satisfacible

----------------------------------------------------
Exercise 6.
((P ∧ ¬Q) ∨ (Q ∧ ¬P )) → ¬(P ↔ Q)
1. WFF? SI
2. Analizando tablas de verdad.
P Q  |  
T T  | T
T F  | T
F T  | T
F F  | T

3. Tautología

----------------------------------------------------
Exercise 7.
(P → Q) ∧ (P → ¬Q)

1. WFF? SI
2. Analizando tablas de verdad.
P Q  |  
T T  | F
T F  | F
F T  | T
F F  | T

3. Satisfacible

----------------------------------------------------
Exercise 8.
(P → Q) ∧ (¬P → Q)

1. WFF? SI
2. Analizando tablas de verdad.
P Q  |  
T T  | T
T F  | F
F T  | T
F F  | F

3. Satisfacible

----------------------------------------------------
Exercise 9.
(P → Q) ↔ (¬Q → ¬P )

1. WFF?
2. Analizando tablas de verdad.
P Q  |  
T T  | T
T F  | T
F T  | T
F F  | T

3. Tautología

----------------------------------------------------
Exercise 10. Prove P, Q, R |-  P ∧ (Q ∧ R).
     and induct    P, Q /\  R
     and induct    P /\ (Q /\ R)

----------------------------------------------------
Exercise 11. Consider the following two propositions:
x = A ∧ (B ∧ (C ∧ D))
y = (A ∧ B) ∧ (C ∧ D)

Describe the shapes of the proofs for x and y, Assuming A, B, C, and
D. Suppose each proposition has 2n propositional variables. What then
would be the heights of the proof trees?

----------------------------------------------------
Exercise 12. Prove (P ∧ Q) ∧ R            |-   P ∧ (Q ∧ R)

and elim        (P /\ Q)         R
                  Q
                                   and induct
                       Q && R
    (P /\ Q)                       and induct
       P
                P && (Q && R)

----------------------------------------------------
Exercise 13. Prove P, P → Q, (P ∧ Q) → (R ∧ S)   |-   S 

P, P → Q, (P ∧ Q) → (R ∧ S)   |-   S 
-> elim
Q,         and elim L
          Q -> (R && S) and elim R
Q,          Q -> S
Resul                     S


----------------------------------------------------
Exercise 14. Prove    P → Q, R → S, P ∧ R   |-   S ∧ R.

1.  P /\ R      p -> q
      P

            Q

2.
  P/\R
   R             R -> S
          S

1 2  and induction

Q /\ S      P /\ R
   S          R
       S /\R

----------------------------------------------------
Exercise 15. Prove P  |-  Q → P ∧ Q 
                           Q -> P      Q -> Q
                            Q -> P   ,  Q
                              P

----------------------------------------------------
Exercise 16. Prove    |-   P ∧ Q → Q ∧ P.

       P/\Q                P/\Q
       ------{aer}      ------{ael}
         Q                   P
        ------------------------ {AndI}
                Q/\P 

----------------------------------------------------

Exercise 17. Prove P → False ∨ P .
  or induct R  false \/ P          el or se comporta de acuerdo a P
  
          False       P
         ------------{OR}
        False  \/ P
        ------------{ORIntroduction}
              True     

----------------------------------------------------
Exercise 18. Prove P, Q  |-   (P ∧ Q) ∨ (Q ∨ R).

   and induct              or induct
          P && Q   Or    (Q or R)   como es or... puede dar lo que tenga Q
             P /\ Q \/ (Q \/ R)