import Stdm

Exercise 3. Use the truth table functions to determine which of the following
formulas are tautologies.
(a) (True ∧ P) ∨ Q
(b) (P ∨ Q) → (P ∧ Q)
(c) (P ∧ Q) → (P ∨ Q)
(d) (P ∨ Q) → (Q ∨ P)
(e) ((P ∨ Q) ∧ (P ∨ R)) ↔ (P ∧ (Q ∨ R))

P     Q   (PVQ)   ->    (P ∧ Q)
False   False False   True  False
False True  True    False False   NO ES UNA TAUTOLOGIA
True  False True    False False
True  True  True    True  True

P     Q   (P ∨ Q)   ->    (P V Q)
False   False False   True  False
False True  False   False True    NO ES UNA TAUTOLOGIA
True  False False   False True
True  True  True    False True

P     Q   (PVQ)   ->    (P V Q)
False   False False   True  False
False True  True    True  True
True  False True    True  True    ES UNA TAUTOLOGIA
True  True  True    True  True


P     Q     R   ((PVQ)   ∨    (PVQ))   <->  (P  ∨   (QVR))
False False False False False False True  False False
False False True  False False True  False True  True
False True  False True  False False False True  True
False True  True  True  True  True  True  True  True  NO ES UNA TAUTOLOGIA
True  False False True  True  True  True  True  False
True  False True  True  True  True  True  True  True
True  True  False True  True  True  True  True  False
True  True  True  True  True  True  True  True  True

Exercise 5.
(P ∨ Q) ∧ (P ∨ R) ↔ P ∧ (Q ∨ R)

P     Q     R   ((PVQ)   ∨    (PVQ))   <->  (P  ∨   (QVR))
False False False False False False True  False False
False False True  False False True  False True  True
False True  False True  False False False True  True
False True  True  True  True  True  True  True  True  
True  False False True  True  True  True  True  False
True  False True  True  True  True  True  True  True
True  True  False True  True  True  True  True  False
True  True  True  True  True  True  True  True  True

SI ES WFF
SI ES SATISFACTIBLE.


Exercise 7.
(P → Q) ∧ (P →¬Q)

P     Q     (P → Q) ∧     (P →¬Q)
False False True  True  True
False True  True  True  True
True  False False False True
True  True  True  False False
SI ES WFF
SI ES SATISFACTIBLE.


Exercise 9.
(P → Q) ↔ (¬Q→¬P)

P     Q     (P → Q) ∧     (¬Q→¬P)
False False True  True  True
False True  True  False False
True  False False False True
True  True  True  True  True
SI ES WFF
SI ES SATISFACTIBLE.


Exercise 13. Prove P, P -> Q, (P ∧ Q) -> (R ∧ S) |- S.

P P -> Q      Q(P ∧ Q)    ->  (R ∧ S)

________{ _> E}  _____{∧ER}
  Q       Q   Q -> (R ∧ S)
        __________________{>E}
            (R ∧ S)
            ___________{ ∧ ER}
              S

Exercise 15. Prove P |- Q -> P ∧ Q.

P |- Q      -> P ∧ Q.
________    _________NER
Q ->P     P->Q 
________     _________
  Q->P    Q
  _____     ______E 
      P 

-- Exercise 31  P,Q,R |- P ∧ (Q ∧ R)            
e31theorem = Theorem [P,Q,R] (And P (And Q R))  
e31proof = AndI ( Assume P,(AndI (Assume Q,Assume R) (And Q R)))
          (And P (And Q R))
ex31cpt = check_proof e31theorem e31proof



--Exercise 32  A ^ ¬A |- False   
e32theorem = Theorem [And A (Not A)] (FALSE)
e32proof = ImpE( AndEL (Assume(And A (Not A))) A,
             AndER (Assume(And A (Not A))) (Not A))FALSE
e32cpt = check_proof e32theorem e32proof


--Exercise 33 A |- ¬(¬A) 
-- ¬(¬A) |- A
e33theorem = Theorem [Imp (Imp A FALSE) FALSE] (A)

e33proof =  RAA (ImpE (Assume (Imp A FALSE),
                Assume (Imp (Imp A FALSE) FALSE))
                FALSE)
                A

e33cpt = check_proof e33theorem e33proof


--Exercise 34  A, A->B, B->C, C->D |- D  
e34theorem = Theorem [A, (Imp A B), (Imp B C), (Imp C D)] (D)
e34proof = ImpE( (ImpE ((ImpE (Assume A, Assume(Imp A B)) B),
              Assume(Imp B C)) C),Assume (Imp C D))D
e34cpt = check_proof e34theorem e34proof


-- Exercise 35 A -> B, Not B |- Not A 
--e35theorem = Theorem [(Imp A B), (Not B)] (Not A)
e35theorem = Theorem [(Imp A B),(Imp B FALSE)] (Imp A FALSE)
e35proof = ImpI (ImpE ((ImpE (Assume A, Assume(Imp A B)) B),
              Assume (Imp B FALSE)) FALSE) (Imp A FALSE)
e35cpt = check_proof e35theorem e35proof


--Exercise 36  B \/ (Not B), A -> B |- (Not A) \/ B
--e36theorem = Theorem [(Or B (Not B)), (Imp A B) ] (Or (Not A) B)
e36theorem = Theorem [(Or B (Not B)), (Imp A B), A ] (Or (Not A) B)

e36proof= OrIR( OrE ( Assume(Or B (Not B)),(ID (Assume B) B), (CTR (ImpE ((ImpE(Assume A, Assume(Imp A B)) B),
                (Assume(Imp B FALSE))) FALSE) B)) B) (Or (Not A) B)
e36cpt = check_proof e36theorem e36proof


--Exercise 37 A->B |- (Not B) -> (Not A) 
--e37theorem = Theorem [(Imp A B)] (Imp (Imp B FALSE) (Imp A FALSE))
e37theorem = Theorem [(Imp A B)] (Imp (Imp B FALSE) (Imp A FALSE))
e37proof = ImpI (ImpI (ImpE ((ImpE (Assume A,Assume(Imp A B)) B),
                Assume(Imp B FALSE) )FALSE) (Imp A FALSE) ) 
            (Imp (Imp B FALSE) (Imp A FALSE))
e37cpt=check_proof e37theorem e37proof


--Exercise 38  A \/ (B /\ C) |- (A \/ B) /\ (A \/ C) 
-- a ∧ (b ∨ c) = (a ∧ b) ∨ (a ∧ c) {∧ distributes over ∨} 
--e38theorem = Theorem [Or A (And B C)] (And (Or A B) (Or A C))
e38theorem = Theorem [Or A (And B C), A] (And (Or A B) (Or A C))
e38proof = AndI((OrIL(OrE(Assume(Or A (And B C)),
                (ID (Assume A) A),(AndEL(AndI (Assume A,(AndER (Assume(And B C)) C)) (And A C)) A)) A)
                (Or A B)),(OrIL(OrE(Assume(Or A (And B C)),(ID (Assume A) A),         
                (AndEL(AndI (Assume A,(AndER (Assume(And B C)) C)) (And A C)) A)) A)
                (Or A C)))(And (Or A B) (Or A C))
e38cpt = check_proof e38theorem e38proof       
      
