% var 1
% gr 151
% Voaideș Negustor Robert Ionuț

% exercitiul 1, expand_intervals/2
expand_intervals([], []).
expand_intervals([(N,M)|T], [X|Y]) :- N =< M, expand_intervals(T, Y), interval(N, M, X).
expand_intervals([(N,M)|T], [[]| Y]) :- N > M, expand_intervals(T, Y).

% interval/2
% functie ajutatoare care creeaza intervalul (N, M) de numere intregi si il stocheaza intr-o lsita
interval(M, M, [M]).
interval(N, M, [H|T]) :- N =< M, H = N, N1 is N + 1, interval(N1, M, T).

% ex 2
div_concat(L, R) :- append(L2, L1, L), append(L1, L2, R),
                    length(L1, Len1), length(L2, Len2),
                    Len1 =\= 0, Len2 =\= 0, % asta previne si impartirea cu zero, si e si suficient ca L sa fie distinct de R
                    length(L, Len), 0 is Len mod Len1.
% aici rescriem pentru sau
div_concat(L, R) :- append(L2, L1, L), append(L1, L2, R),
                    length(L1, Len1), length(L2, Len2),
                    Len1 =\= 0, Len2 =\= 0,
                    length(L, Len), 0 is Len mod Len2.

% ex 3

% (a)
% Conjunctia este asociativa, deci atâta timp cât două formule Phi și Psi conțin doar conjuncții și au
% variabilele propoziționale în aceeași ordine, atunci Psi se poate opține din Phi prin reasocierea parantezelor ei.

% vedem dacă variabilele obținute sunt în aceeași ordine și dacă conțin doar si-uri

% functie ajutatoare care ne da variabilele in ordine doar dintr-o formula care contine variabile si conjunctii
check_vars(V, [V]) :- atom(V).
check_vars(si(A,B), V) :- check_vars(A, V1), check_vars(B, V2), append(V1, V2, V).

% assoc_and/2
assoc_and(X, Y) :-  check_vars(X, V),
                    check_vars(Y, V).

% (b)
% ideeea este să reasociem la dreapta
% conjunctia e asociativa, deci putem merge pe ideea anterioară, obținem variabilele in ordine cu check_vars
% construim asocierea la dreapta
% stim că trebuie să adăugăm siruri intre 2 variabile, pentru că, pentur a fi formulă,
% trebuie să respecte definitia recursivă a formulelor
% daca ar contine doar variabile, inseamna ca formula ar putea contine doar o variabila (fiecare variabila e formula)
% deci, la mai multe variabile, si avand singurul conector logic conjunctia, stim ca
% trebuie sa adaugam si intre orice doua variabile
assoc_r([V], V).
assoc_r([H|T], si(H,R)) :- assoc_r(T, R).

% assoc_and_right/2
assoc_and_right(X, Y) :-  check_vars(X, V),
                    assoc_r(V, Y).