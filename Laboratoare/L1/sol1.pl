ex2:

father_of(F,C):- male(F), parent(F,C).
mother_of(M,C):- female(M),parent(M,C).
grandmother_of(G,C):- mother_of(G,P), parent(P,C).
grandfather_of(G,C):- father_of(G,P), parent(P,C).
sister_of(S,P) :- parent(Q,S), parent(Q,P), female(S), S \= P.
brother_of(B,P):- parent(Q,B), parent(Q,P), male(B), B \= P.
aunt_of(A,P) :- sister_of(A,B), parent(B,P).
uncle_of(A,B) :- brother_of(A,C), parent(C,B).

ex3:

% not_parent(X,Y) :- not(parent(X,Y)).
person(X) :- male(X).
person(X) :- female(X).
not_parent(X,Y) :- person(X), person(Y), X\=Y, not(parent(X,Y)).