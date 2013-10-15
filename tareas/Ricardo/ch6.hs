import Stdm


{-------------------------------------------------------------------------
Exercise 1.

Imagine that you are visiting Hitech City, where all the buses
are driverless (because they are fully automated) and at every bus stop
there is a computer that understands spoken English. The computer can
respond to yes-or-no questions and knows the routes of all buses. You are
trying to get to the airport and have arrived at a bus stop shortly before
a bus waiting there is ready to leave. You know that either this bus or
the next one is going to the airport, but not both. You only have time to
ask the computer one question before the bus leaves, and you must take
this bus or the next to avoid missing your flight.
Unfortunately, some of the computers in Hitech City have a flaw in their
design. They understand spoken English and can answer yes-or-know
questions, but something in their circuitry causes them to answer “no”
when a properly functioning computer would have answered “yes” and,
vice versa, to answer “yes” when a properly functioning computer would
have answered “no”. You do not know whether the computer at this bus
stop functions properly or contains a twisted-logic circuit.
All the computers have names, and no two of those names are the same.
The computer at your bus stop is named “Bob”. Devise a question that
you could ask Bob and, based on Bob’s yes-or-no answer, decide correctly
whether to take this bus or the next one to make your flight. Remember,
you are allowed only one question, the question must be phrased in a
way that requires a yes-or-no answer, and you will get only one answer,
which will be either “yes” or “no”. The answer will be the correct answer
to your question if Bob is a properly functioning computer, and it will
be the wrong answer to your question if Bob contains the twisted-logic
circuit, but you have no way to tell which kind of computer Bob is.
--}

{--

--}


{--------------------------------------------------------------------------
Exercise 2.
Check your understanding of or, and, and not by deciding what
value each of these expressions has and then evaluating it with the com-
puter (you will need to import the Stdm module provided on the web
page for this book):
(a) False /\ True
(b) True \/ (not True)
(c) not (False \/ True)
(d) (not (False /\ True)) \/ False
(e) (not True) ==> True
(f ) True \/ False ==> True
(g) True ==> (True /\ False)
(h) False ==> False
(i) (not False) <=> True
(j) True <=> (False ==> False)
(k) False <=> (True /\ (False ==> True))
(l) (not (True \/ False)) <=> False /\ True
--}

e2a = False /\ True
e2b = True \/ (not True)
e2c = not (False \/ True)
e2d = (not (False /\ True)) \/ False
e2e = (not True) ==> True
e2f = True \/ False ==> True
e2g = True ==> (True /\ False)
e2h = False ==> False
e2i = (not False) <=> True
e2j = True <=> (False ==> False)
e2k = False <=> (True /\ (False ==> True))
e2l = (not (True \/ False)) <=> False /\ True


{--------------------------------------------------------------------------
Exercise 3.
Use the truth table functions to determine which of the following
formulas are tautologies.
(a) (True ∧ P ) ∨ Q
(b) (P ∨ Q) → (P ∧ Q)
(c) (P ∧ Q) → (P ∨ Q)
(d) (P ∨ Q) → (Q ∨ P )
(e) ((P ∨ Q) ∧ (P ∨ R)) ↔ (P ∧ (Q ∨ R))
--}

{--
(a) (True ∧ P ) ∨ Q
+-----+-----+----------+-----+
|  P  |  Q  | True P   | ∨ Q |
+-----+-----+----------+-----+
|  T  |  T  |    T     |  T  |
+-----+-----+----------+-----+
|  T  |  F  |    T     |  T  |
+-----+-----+----------+-----+
|  F  |  T  |    F     |  T  |
+-----+-----+----------+-----+
|  F  |  F  |    F     |  F  |
+-----+-----+----------+-----+
No es una tautología

(b) (P ∨ Q) → (P ∧ Q)
+---+---+---+---+---+
| P | Q |P∨Q|P∧Q| → |
+---+---+---+---+---+
| T | T | T | T | T |
+---+---+---+---+---+
| T | F | T | F | F |
+---+---+---+---+---+
| F | T | T | F | F |
+---+---+---+---+---+
| F | F | F | F | F |
+---+---+---+---+---+
No es una tautología

(c) (P ∧ Q) → (P ∨ Q)
+---+---+---+---+---+
| P | Q |P∧Q|P∨Q| → |
+---+---+---+---+---+
| T | T | T | T | T |
+---+---+---+---+---+
| T | F | F | T | T |
+---+---+---+---+---+
| F | T | F | T | T |
+---+---+---+---+---+
| F | F | F | F | T |
+---+---+---+---+---+
Sí es una tautología

(d) (P ∨ Q) → (Q ∨ P )
+---+---+---+---+---+
| P | Q |P∨Q|Q∨P| → |
+---+---+---+---+---+
| T | T | T | T | T |
+---+---+---+---+---+
| T | F | T | T | T |
+---+---+---+---+---+
| F | T | T | T | T |
+---+---+---+---+---+
| F | F | F | F | T |
+---+---+---+---+---+

(e) ((P ∨ Q) ∧ (P ∨ R)) ↔ (P ∧ (Q ∨ R))
+---+---+---+---+---+---+---+---+---+
| P | Q | R |P∨Q|P∨R| ∧ |Q∨R|P∧ | ↔ |
+---+---+---+---+---+---+---+---+---+
| T | T | T | T | T | T | T | T | T |
+---+---+---+---+---+---+---+---+---+
| T | T | F | T | T | T | T | T | T |
+---+---+---+---+---+---+---+---+---+
| T | F | T | T | T | T | T | T | T |
+---+---+---+---+---+---+---+---+---+
| T | F | F | T | T | T | F | F | F |
+---+---+---+---+---+---+---+---+---+
| F | T | T | T | T | T | T | F | F |
+---+---+---+---+---+---+---+---+---+
| F | T | F | T | F | F | T | F | T |
+---+---+---+---+---+---+---+---+---+
| F | F | T | F | T | F | T | F | T |
+---+---+---+---+---+---+---+---+---+
| F | F | F | F | F | F | F | F | T |
+---+---+---+---+---+---+---+---+---+
No es una tautología
--}


{--------------------------------------------------------------------------
Exercise 4.
In this exercise, and several more that follow it, you are given
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
--}

{--
+---------+---------+---------+---------+
|    P    |    Q    |True ∧ P |   ∨Q    |
+---------+---------+---------+---------+
|    T    |    T    |    T    |    T    |
+---------+---------+---------+---------+
|    T    |    F    |    T    |    T    |
+---------+---------+---------+---------+
|    F    |    T    |    F    |    T    |
+---------+---------+---------+---------+
|    F    |    F    |    F    |    F    |
+---------+---------+---------+---------+
--}


{--------------------------------------------------------------------------
Exercise 5.
(P ∨ Q) ∧ (P ∨ R) ↔ P ∧ (Q ∨ R)
--}

{--
+---+---+---+---+---+---+---+---+---+
| P | Q | R |P∨Q|P∨R| ∧ |Q∨R|P∧ | ↔ |
+---+---+---+---+---+---+---+---+---+
| T | T | T | T | T | T | T | T | T |
+---+---+---+---+---+---+---+---+---+
| T | T | F | T | T | T | T | T | T |
+---+---+---+---+---+---+---+---+---+
| T | F | T | T | T | T | T | T | T |
+---+---+---+---+---+---+---+---+---+
| T | F | F | T | T | T | F | F | F |
+---+---+---+---+---+---+---+---+---+
| F | T | T | T | T | T | T | F | F |
+---+---+---+---+---+---+---+---+---+
| F | T | F | T | F | F | T | F | T |
+---+---+---+---+---+---+---+---+---+
| F | F | T | F | T | F | T | F | T |
+---+---+---+---+---+---+---+---+---+
| F | F | F | F | F | F | F | F | T |
+---+---+---+---+---+---+---+---+---+

--}


{--------------------------------------------------------------------------
Exercise 6.
((P ∧ ¬Q) ∨ (Q ∧ ¬P )) → ¬(P ↔ Q)
--}

{--
+-----+-----+-----+-----+-----+-----+-----+-----+
|  P  |  Q  |P∧¬Q |Qu∧¬P|  ∨  | P↔Q |  ¬  |  →  |
+-----+-----+-----+-----+-----+-----+-----+-----+
|  T  |  T  |  F  |  F  |  F  |  T  |  F  |  T  |
+-----+-----+-----+-----+-----+-----+-----+-----+
|  T  |  F  |  T  |  F  |  T  |  F  |  T  |  T  |
+-----+-----+-----+-----+-----+-----+-----+-----+
|  F  |  T  |  F  |  T  |  T  |  T  |  T  |  T  |
+-----+-----+-----+-----+-----+-----+-----+-----+
|  F  |  T  |  F  |  T  |  T  |  T  |  T  |  T  |
+-----+-----+-----+-----+-----+-----+-----+-----+
|  F  |  F  |  F  |  F  |  F  |  T  |  T  |  T  |
+-----+-----+-----+-----+-----+-----+-----+-----+

--}


{--------------------------------------------------------------------------
Exercise 7.
(P → Q) ∧ (P → ¬Q)
--}

{--
+-----+-----+-----+-----+-----+
|  P  |  Q  | P→Q |P→¬Q |  ∧  |
+-----+-----+-----+-----+-----+
|  T  |  T  |  T  |  F  |  F  |
+-----+-----+-----+-----+-----+
|  T  |  F  |  F  |  T  |  F  |
+-----+-----+-----+-----+-----+
|  F  |  T  |  T  |  T  |  T  |
+-----+-----+-----+-----+-----+
|  F  |  F  |  T  |  T  |  T  |
+-----+-----+-----+-----+-----+

--}


{--------------------------------------------------------------------------
Exercise 8.
(P → Q) ∧ (¬P → Q)
--}

{--
+-----+-----+-----+-----+-----+
|  P  |  Q  | P→Q |¬P→Q |  ∧  |
+-----+-----+-----+-----+-----+
|  T  |  T  |  T  |  T  |  T  |
+-----+-----+-----+-----+-----+
|  T  |  F  |  F  |  T  |  F  |
+-----+-----+-----+-----+-----+
|  F  |  T  |  T  |  T  |  T  |
+-----+-----+-----+-----+-----+
|  F  |  F  |  T  |  F  |  F  |
+-----+-----+-----+-----+-----+
--}


{--------------------------------------------------------------------------
Exercise 9.
(P → Q) ↔ (¬Q → ¬P )
--}

{--
+-----+-----+-----+-----+-----+
|  P  |  Q  | P→Q |¬Q→¬P|  ↔  |
+-----+-----+-----+-----+-----+
|  T  |  T  |  T  |  T  |  T  |
+-----+-----+-----+-----+-----+
|  T  |  F  |  F  |  T  |  F  |
+-----+-----+-----+-----+-----+
|  F  |  T  |  T  |  F  |  F  |
+-----+-----+-----+-----+-----+
|  F  |  F  |  T  |  T  |  T  |
+-----+-----+-----+-----+-----+
--}


{--------------------------------------------------------------------------
Exercise 10.
Prove P, Q, R |- P ∧ (Q ∧ R).
--}

{--
   P     Q   R
 ----   ------- {∧I}
   P     Q ∧ R
  ---------------  {∧I}
  		P ∧ (Q ∧ R)
--}


{--------------------------------------------------------------------------
Exercise 11.
Consider the following two propositions:
x = A ∧ (B ∧ (C ∧ D))
y = (A ∧ B) ∧ (C ∧ D)
Describe the shapes of the proofs for x and y, Assuming A, B, C, and
D. Suppose each proposition has 2n propositional variables. What then
would be the heights of the proof trees?
--}

{--
  (P ∧ Q) ∧ R                 (P ∧ Q) ∧ R                     (P ∧ Q) ∧ R                     
 ---------------{∧EL}         ---------------{∧EL}             ---------------{∧ER}     
         P ∧ Q                     P ∧ Q  								R
        --------{∧EL}            ----------{∧ER}
			  P                          Q                              R
		--------------------          -----------------------------------------{∧I}	
         	  P										Q ∧ R
         	-------------------------------------------------{∧I}
         					P ∧ (Q ∧ R)
--}


{--------------------------------------------------------------------------
Exercise 12.
Prove (P ∧ Q) ∧ R |- P ∧ (Q ∧ R).
--}

{--
   			P   P → Q
   		   ------------{→E}
   	  P        Q
   	---------------{I∧}   	
   			P ∧ Q	               (P ∧ Q) → (R ∧ S)
   	    --------------------------------------------------	{→E}
   	    				R ∧ S
   	    			  ---------{∧ER}
   	    			       S
--}


{--------------------------------------------------------------------------
Exercise 13.
Prove P, P → Q, (P ∧ Q) → (R ∧ S) |- S.
--}

{--
   			P   P → Q
   		   ------------{→E}
   	  P        Q
   	---------------{I∧}   	
   			P ∧ Q	               (P ∧ Q) → (R ∧ S)
   	    --------------------------------------------------	{→E}
   	    				R ∧ S
   	    			  ---------{∧ER}
   	    			       S
--}

{--------------------------------------------------------------------------
Exercise 14.
Prove P → Q, R → S, P ∧ R |- S ∧ R.
--}

{--
     P ∧ R             
    --------{∧ER}    
        R              R → S            P ∧ R
       -----------------------{→E}     --------{∧ER}
				S                         R
              -------------------------------{I∧}
              			     S ∧ R  
--}


{--------------------------------------------------------------------------
Exercise 15.
Prove P |- Q → P ∧ Q.
--}

{--
	   	   P   [Q]
	      ---------{∧I}
	 [Q]      P ∧ Q
	------------------{→I}
		Q  → P ∧ Q

--}


{--------------------------------------------------------------------------
Exercise 16.
Prove |- P ∧ Q → Q ∧ P.
--}

{--
	 P ∧ Q  |-  Q ∧ P

	P ∧ Q            P ∧ Q		 
   --------{∧ER}	---------- {∧EL}
		Q               P
	  ----------------------{∧I}
	          Q ∧ P	
--}


{--------------------------------------------------------------------------
Exercise 17.
Prove P → False ∨ P
--}

{--
	   P |- False ∨ P
       P  
   ------------{∨I}
   False ∨ P	
--}

{--------------------------------------------------------------------------
Exercise .

--}

{--

--}


{--------------------------------------------------------------------------
Exercise .

--}

{--

--}


{--------------------------------------------------------------------------
Exercise .

--}

{--

--}


{--------------------------------------------------------------------------
Exercise .

--}

{--

--}


{--------------------------------------------------------------------------
Exercise .

--}

{--

--}


{--------------------------------------------------------------------------
Exercise .

--}

{--

--}


{--------------------------------------------------------------------------
Exercise .

--}

{--

--}


{--------------------------------------------------------------------------
Exercise .

--}

{--

--}
