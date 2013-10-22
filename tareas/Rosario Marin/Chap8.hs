------------------------------
--  CHAPTER 8. SET THEORY   --
--    Rosario Marin P.      --
--     October,20,2013      --
------------------------------

--Quantifiers--
∀x.  	ALL		 ^ (and)  ->  ∩ (Intersection) 
∃x.    EXISTS    v (or)  ->  ∪ (Union)

--Operations on Sets--
Set Equality: A=B,  A/=B
Subsets: A⊂B, A⊆B means that possibly A=B
Union: A ∪ B
Intersection: A ∩ B
Difference: A − B
Complement: A', U−A let U be the universe
Powerset: P(A) is the set of all subsets of A: P(A)={S | S⊆A}

//////////////////////////////////////////////////////////////
Example 15.(Powersets)
•P({})={∅}={{ }}
•P({a})={∅,{a}}
•P({a, b})={∅,{a},{b},{a, b}}
•P({a, b, c})={∅,{a},{b},{c},{a, b},{a, c},{b, c},{a, b, c}}

->P(A) contains 2<elevado>n elements.
//////////////////////////////////////////////////////////////

--Definition --
A ∪B = {x |x ∈ A ∨ x∈ B}
A ∩ B = {x |x ∈ A ∧ x∈ B}
A − B = {x |x ∈ A ∧ x/∈ B}

--operators--
A+++B = A∪B (union)
A***B = A∩B (intersection)
A~~~B = A−B (difference)

--------Exercise 1.--------
Topic: 8.2 Basic Operations on Sets
--Calculate the following sets:
A={1,2,3,4,5}
B={2,4,6}

(a) A ∪(B ∩ A)
={1,2,3,4,5} ∪ {{2,4,6} ∩ {1,2,3,4,5}}
={1,2,3,4,5} ∪ {2}
={1,2,3,4,5,2}

(b) (A ∩ B) ∪ B
={{1,2,3,4,5} ∩ {2,4,6}} ∪ {2,4,6}
={2,4} ∪ {2,4,6}
={2,4,2,4,6}

(c) A−B
={1,2,3,4,5} - {2,4,6}
={1,3,5}

(d) (B−A) ∩ B
={{2,4,6} - {1,2,3,4,5}} ∩ {2,4,6}
={6} ∩ {2,4,6}
={6}

(e) A ∪(B−A)
={1,2,3,4,5} ∪ {{2,4,6} - {1,2,3,4,5}}
={1,2,3,4,5} ∪ {6}
={1,2,3,4,5,6}


--------Exercise 2.--------
(a) [1,2,3] +++ [3]
(b) [4,2] +++ [2,4]
(c) [1,2,3] *** [3]
(d) [] *** [1,3,5]
(e) [1,2,3] ˜˜˜ [3]
(f ) [2,3] ˜˜˜ [1,2,3]
(g) [1,2,3] *** [1,2]
(h) [1,2,3] +++ [4,5,6]
(i) ([4,3] ˜˜˜ [5,4]) *** [1,2]
(j) ([3,2,4] +++ [4,2]) ˜˜˜ [2,3]
(k) subset [3,4] [4,5,6]
(l) subset [1,3] [4,1,3,6]
(m) subset [] [1,2,3]
(n) setEq [1,2] [2,1]
(o) setEq [3,4,6] [2,3,5]
(p) [1,2,3] ˜˜˜ [1]
(q) [] ˜˜˜ [1,2]


--------Exercise 3.--------
--Work out the values of the following expressions:
(a) powerset [3,2,4]
(b) powerset [2]

--------Exercise 4.--------
--Evaluate these expressions:
(a) crossproduct [1,2,3] [’a’,’b’]

(b) crossproduct [1] [’a’,’b’]

--------Exercise 5.--------
u = [1,2,3,4,5,6,7,8,9,10]
a = [2,3,4]
b = [5,6,7]
c =[ 1,2]

--Give the elements of each set:

(a) a +++ b
(b) u˜˜˜a *** (b +++ c)
(c) c ˜˜˜ b
(d) (a +++ b) +++ c
(e) u˜˜˜a
(f) u˜˜˜(b *** c)

--------Exercise 6.--------
--What are the elements of the set 
{ x+y |x ∈ {1,2,3} ^ y ∈ {4,5}}


--------Exercise 7.--------
--Write and evaluate a list comprehension that expresses the set
{x|x ∈{1,2,3,4,5} ^ x<0}

--------Exercise 8.--------
--Write and evaluate a list comprehension that expresses the set
{x+y| x ∈ {1,2,3} ^ y ∈ {4,5}}

--------Exercise 9.--------
--Write and evaluate a list comprehension that expresses the set
{x| x ∈ {1,2,3,4,5,6,7,8,9,10} ^ even x}


Exercise 10.
--What is the value of each of the following expressions:
(a) subset [1,3,4] [4,3]

(b) subset [] [2,3,4]

(c) setEq [2,3] [4,5,6]

(d) setEq [1,2] [1,2,3]





