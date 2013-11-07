--------------Exercise 1-------------------------


1True  = El autobus va al aeropuerto.
1False = El siguiente autobus va al aeropuerto.
2True  = La computadora Bob no dice la verdad
2False = La computadora Bob dice la verdad


|   1   |   2   | Respuesta |
|-------+-------+-----------|
| True  | True  | True      |
| True  | False | False     |
| False | True  | True      |
| False | False | False     |
   



--------------Exercise 2-------------------------

(a) False /\ True
    False

(b) True \/ (not True)
    True \/ False
    True

(c) not (False \/ True)
    not (True)
    False

(d) (not (False /\ True)) \/ False
    (not (False)) \/ False
       True \/ False
          True


(e) (not True) ==> True
     (False) ==> True
      True 


(f) True \/ False ==> True
        True ==> True
          True  

(g) True ==> (True /\ False)
      True ==> (False)
          False


(h) False ==> False
       True

(i) (not False) <=> True
     True <=> True
       True
 
(j) True <=> (False ==> False)
     True <=> (True)         
         True

(k) False <=> (True /\ (False ==> True))
       False <=> (True /\ True)
       False <=> True
         False

           

(l) (not (True \/ False)) <=> False /\ True
      (not (True)) <=> False
      (False) <=> False 
          True


--------------Exercise 3-------------------------

(a) (True /\ P) \/ Q


| P | Q | True /\ P | (True /\ P) V Q |
+---+---+---------- +-----------------|
| T | T | T         | T               |
| T | F | T         | T               |
| F | T | F         | T               |
| F | F | F         | F               |

- No es tautología


(b) (P \/ Q) -> (P /\ Q)

| P | Q | (P \/ Q) | (P /\ Q) | (P \/ Q) -> (P /\ Q)|
|---+---+---------+-----------+---------------------|
| T | T | T       | T         | T                   |
| T | F | T       | F         | F                   |
| F | T | T       | F         | F                   |
| F | F | F       | F         | T                   |
- No es tautología



(c) (P /\ Q) -> (P \/ Q)

| P | Q | (P /\ Q) | (P \/ Q) | (P /\ Q) -> (P \/ Q) |
+---+---+----------+----------+----------------------|
| T | T | T        | T        | T                    |
| T | F | F        | T        | T                    |
| F | T | F        | T        | T                    |
| F | F | F        | F        | T                    |
- Si es tautología


(d) (P \/ Q) -> (Q \/ P)
| P | Q | (P \/ Q) | (Q \/ P) | (P \/ Q) -> (Q \/ P) |
+---+---+----------+----------+----------------------|
| T | T | T        | T        | T                    |
| T | F | T        | T        | T                    |
| F | T | T        | T        | T                    |
| F | F | F        | F        | T                    |
- Si es tautología



(e) ((P \/ Q) /\ (P \/ R)) <-> (P /\ (Q \/ R))

| P | Q | R | P \/ Q | P \/ R | ((P \/ Q) /\ (P \/ R)) | (Q \/ R) | (P /\ (Q \/ R)) | ((P \/ Q) /\ (P \/ R)) <-> (P /\ (Q \/ R)) |
+---+---+---+--------+--------+------------------------+----------+-----------------+--------------------------------------------|
| F | F | F | F      | F      | F                      | F        | F               | T                                          |
| F | F | T | F      | T      | F                      | T        | F               | T                                          |
| F | T | F | T      | F      | F                      | T        | F               | T                                          |
| F | T | T | T      | T      | T                      | T        | F               | F                                          |
+---+---+---+--------+--------+------------------------+----------+-----------------+--------------------------------------------|
| T | F | F | T      | T      | T                      | F        | F               | F                                          |
| T | F | T | T      | T      | T                      | T        | T               | T                                          |
| T | T | F | T      | T      | T                      | T        | T               | T                                          |
| T | T | T | T      | T      | T                      | T        | T               | T                                          |
-Es satisfacible pero no es tautología



--------------Exercise 5-------------------------
 
P \/ Q /\ (P \/ R) <-> P /\ (Q \/ R)

| P | Q | R | P \/ Q | P \/ R | ((P \/ Q) /\ (P \/ R)) | (Q \/ R) | (P /\ (Q \/ R)) | ((P \/ Q) /\ (P \/ R)) <-> (P /\ (Q \/ R)) |
+---+---+---+--------+--------+------------------------+----------+-----------------+--------------------------------------------|
| F | F | F | F      | F      | F                      | F        | F               | T                                          |
| F | F | T | F      | T      | F                      | T        | F               | T                                          |
| F | T | F | T      | F      | F                      | T        | F               | T                                          |
| F | T | T | T      | T      | T                      | T        | F               | F                                          |
+---+---+---+--------+--------+------------------------+----------+-----------------+--------------------------------------------|
| T | F | F | T      | T      | T                      | F        | F               | F                                          |
| T | F | T | T      | T      | T                      | T        | T               | T                                          |
| T | T | F | T      | T      | T                      | T        | T               | T                                          |
| T | T | T | T      | T      | T                      | T        | T               | T                                          |
-Es satisfacible pero no es tautología





--------------Exercise 6-------------------------


((P /\ -.Q) \/ (Q/\ -.P)) -> -.(P <-> Q)

| P | Q | P /\ -.Q | Q/\ -.P | ((P /\ -.Q) \/ (Q/\ -.P)) | (P <-> Q) | -.(P <-> Q) | ((P /\ -.Q) \/ (Q/\ -.P)) -> -.(P <-> Q) |
+---+---+----------+---------+---------------------------+-----------+-------------+------------------------------------------|
| T | T | F        | F       | F                         | T         | F           | T                                        |
| T | F | T        | F       | T                         | F         | T           | T                                        |
| F | T | F        | T       | T                         | F         | T           | T                                        |
| F | F | F        | F       | F                         | T         | F           | T                                        |
- Si es Tautología



--------------Exercise 7-------------------------

(P -> Q) /\ (P -> -.Q)

| P | Q | -.Q| P->Q | P->-.Q  | (P->Q) /\ (P-> -.Q)|
|---+---+----+------+---------+--------------------|
| T | T | F  | T    | F       |  F                 |  
| T | F | T  | F    | T       |  F                 |
| F | T | F  | T    | T       |  T                 |
| F | F | T  | T    | T       |  T                 |
- Es satisfacible pero no es tautología



--------------Exercise 8-------------------------
(P -> Q) /\ (-.P -> Q)

| P | Q |-.P | P->Q | (-.P)->Q | (P->Q) /\ (-.P -> Q)
|---+---+----+------+--------------------------------|
| T | T | F  | T    | T        | T                   |
| T | F | F  | F    | T        | F                   |
| F | T | T  | T    | T        | T                   |
| F | F | T  | T    | F        | F                   |
- Es satisfacible pero no es tautología






--------------Exercise 9-------------------------
(P -> Q) <-> (-.Q->-.P)

| P | Q | -.P |-.Q | P->Q | -.Q -> -.P | (P->Q)<->(-.Q->-.P) |
+---+---+-----+----+------+------------+---------------------|
| T | T | F   | F  | T    |  T         | T                   |
| T | F | F   | T  | F    |  F         | T                   |  
| F | T | T   | F  | T    |  T         | T                   |
| F | F | T   | T  | T    |  T         | T                   |
- Si es tautología







--------------Exercise 10-------------------------
 P,Q,R |- P /\ (Q/\R)

   Q R
  -------- {/\I}
R   Q /\ R
----------- {/\I}
  P /\ (Q/\R)




--------------Exercise 11-------------------------
-Consider the following two propositions:
x = A /\ (B /\ (C /\ D))
y = (A /\ B) /\ (C /\ D)
Describe the shapes of the proofs for x and y, Assuming A, B, C, and
D. Suppose each proposition has 2n propositional variables. What then
would be the heights of the proof trees?

---La prueba de y sera una forma simetrica, pero la prueba de x será triangular,
con más inferencia en el lado derecho que en el lado izquierdo. En el caso
general, la prueba de x con 2 a la n variables tendrá peso de 2 a la n, porque
cada variable extra requerirá una inferencia sobre lo demás. En contraste,
la prueba de y con 2 a la n variables tendrá un peso de n.




--------------Exercise 12-------------------------

Prove (P /\ Q) /\ R |- P /\ (Q /\ R).                   

                         (P/\Q) /\ R
                         -----------{AndEL}
(P/\Q)/\R                P/\Q                     (P/\Q)/\R
---------{AndEL}         ----{AndER}              ---------{AndER}
P/\Q                       Q                           R
----{AndEL}               --------------------------------{AndI}
 P                                 Q/\R
--------------------------------------------------------------{AndI}
             P /\ (Q/\R)



--------------Exercise 13-------------------------
Prove P, P -> Q, (P /\ Q) -> (R /\ S) |- S.
 

      P    P->Q
      ----------{->E}
 P       Q
---------------------{AndI}
         P/\Q                     P/\Q ->R/\S
 ----------------------------------------------{->E}
               R/\S
 -----------------------------------------------{AndER}
                        S



--------------Exercise 14-------------------------
Prove P -> Q, R -> S, P /\ R |- S /\ R.


         P /\ R
        --------{AndER}
            P            P->Q
        ------------------------{->E}
                  Q                            P/\R
              ----------------------------------------
                   Q         /\             (P/\R)
                  --------------------------------{AndER}
                                P /\ R 
                                --------{AndER}
                                     R             R->S             P/\R
                                    --------------------{->E}       -----{AndER}
                                            S                         R
                                         -------------------------------
                                                 S /\  R



--------------Exercise 15-------------------------
Prove P |- Q -> P /\ Q.


       P       Q
       ----------{AndI}
 Q        P/\Q
------------------{->I}
     Q->P/\Q






--------------Exercise 16-------------------------

Prove |- P /\ Q -> Q /\ P.

P /\ Q                     Q/\P
          equivalente a 


       P/\Q |- Q /\ P

      
       P/\Q                P/\Q
       ------{ANDER}      ------{AEL}
         Q                   P
        ------------------------ {AndI}
                Q/\P 



--------------Exercise 17-------------------------

Prove P -> False \/ P.

Assume P=True

        False       P
         ------------{OR}
        False  \/ P
        ------------{ORIntroduction}
              True     


--------------Exercise 18-------------------------
Prove P, Q |- (P /\ Q) \/ (Q \/ R).

          P   Q
          -----{AndI}
          P /\ Q
          ---------------{ORIL}
         (P/\Q) \/ (Q\/R)



>import Stdm


-----------------Exercise 31-----------------------

>e31 = Theorem [P,Q,R] (And P (And Q R))



>p31 = AndI
>            (
>            Assume P
>            ,
>            (AndI (Assume Q,Assume R) (And Q R))
>            )
>          (And P (And Q R))


>cp31 = check_proof e31 p31




-----------------Exercise 32-----------------------



>e32=[A `And` (Not A)] `Theorem` (FALSE)

>p32=((Assume (A `And` (Not A))
>             {-----------------}`AndEL`
>              A),
>               (Assume(A `And` (Not A)) 
>                {------------ss--------} `AndER`
>                             (Not A)))
>                           {------------} `ImpE`
>                               FALSE
>cp32=check_proof e32 p32





-----------------Exercise 33-----------------------

>e33=[A] `Theorem` ((A `Imp` FALSE) `Imp` FALSE)

>p33=(Assume A, Assume (A `Imp` FALSE ))
>         {-------------------------------} `ImpE`
>                   FALSE
>         {----------------------------------} `ImpI`
>                ((A `Imp` FALSE) `Imp` FALSE)
>cp33=check_proof e33 p33                  




-----------------Exercise 34-----------------------

>e34=[A, A `Imp` B, B `Imp` C, C `Imp` D] `Theorem` (D)

>p34=(((Assume A, Assume(A `Imp`B))
>             {-----------------}`ImpE`
>              B,  Assume (B `Imp` C))
>                {--------------------} `ImpE`
>                   C,         Assume (C `Imp` D))
>                {---------------------------------} `ImpE`
>                               D
>cp34=check_proof e34 p34





-----------------Exercise 35-----------------------
A->B, Not B |- Not A

>e35 =  [( A `Imp` B),( B `Imp` FALSE)] `Theorem` ( A `Imp` FALSE)

>p35 =  ((( (Assume A, Assume( A `Imp` B))
>              {-------------------}`ImpE`
>              B), Assume ( B `Imp` FALSE))
>             {-------------} `ImpE`
>              FALSE)
>            {--------------} `ImpI`
>            ( A `Imp` FALSE)

>cp35 = check_proof e35 p35






-----------------Exercise 36-----------------------
B \/ (Not B), A -> B |- (Not A) \/ B

>e36 =  [( B  `Or` (Not B)), ( A `Imp` B), A ]  `Theorem` ( (Not A) `Or` B)

>p36= (( Assume( B  `Or` (Not B)),
>            ( (Assume B) `ID` B),
>            (((((Assume A, Assume( A `Imp` B)) 
>                 {---------------------} `ImpE`
>                B), (Assume( B  `Imp` FALSE)))
>                {---------------} `ImpE`
>               FALSE)
>              {-------------} `CTR`
>            B))
>           {-----------}`OrE` 
>            B)
>           {-------------}`OrIR`
>          ( (Not A) `Or` B)

>cp36 = check_proof e36 p36








-----------------Exercise 37-----------------------

>e37=[A `Imp` B] `Theorem` ((B `Imp` FALSE) `Imp` (A `Imp` FALSE))

>p37=(((Assume A, Assume(A `Imp`B))
>             {-----------------}`ImpE`
>              B),  Assume (B `Imp` FALSE))
>                {--------------------} `ImpE`
>                   FALSE
>                {-----------------} `ImpI`
>                  (A `Imp` FALSE)
>                {-----------------} `ImpI`
>                 ((B `Imp` FALSE) `Imp` (A `Imp` FALSE))
>cp37=check_proof e37 p37






-----------------Exercise 38-----------------------
A \/ (B /\ C) |- (A \/ B) /\ (A \/ C) [Note: \/ distributes over /.]


>e38 =  [ A  `Or` ( B  `And` C), A]  `Theorem`  (And (Or A B) (Or A C))

>p38 = ((((Assume( A  `Or` ( B `And` C)),  Assume A, (( (Assume A,( (Assume( B  `And`  C))  
>                                                                        {--------------------}`AndER` 
>                                                                                  C))
>                                               {---------------------------------------}  `AndI`
>                                               ( A `And` C)) 
>                                               {------------} `AndEL` 
>                                                     A)) 
>              {--------------------------------------}`OrE`  
>                      A)
>              {-------------}`OrIL` 
>              ( A  `Or` B))
>          ,
>            ((
>              (
>                Assume( A  `Or` ( B `And` C) ), Assume A,(( (Assume A,( (Assume( B `And` C)) 
>                                                                       {----------}`AndER`
>                                                                           C)) 
>                                                        {---------------------------}`AndI` 
>                                                       ( A `And` C))
>                                                        {-----------} `AndEL`  
>                                                              A))
>                {-----------------------------------------}`OrE`
>                          A) 
>                 {-------------}`OrIL`
>                  ( A  `Or`  C)))
>            {------------------------------} `AndI`
>             ((A `Or` B)  `And`  (A `Or` C))


>cp38 = check_proof e38 p38