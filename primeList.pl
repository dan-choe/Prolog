% Dan Choe
% 12/19/2017
% https://github.com/dan-choe/Prolog

is_prime(2).
is_prime(3).
is_prime(N) :-
    N > 3,
    is_prime(N, 2).
is_prime(N, X):-
    N =:= X.
is_prime(N, X):-
    R is N mod X,
    R \= 0,
    X1 is X + 1,
    is_prime(N, X1).

make_NprimeList(N, L):-
	make_NprimeList(N, 0, 2, [], L).

make_NprimeList(N, N, _, Temp, Temp).
make_NprimeList(N, CurrNth, P, Temp, L):-
    N > CurrNth,
    P1 is P + 1,
    ( 
    	is_prime(P)
    	->  CurrNth1 is CurrNth + 1,
        make_NprimeList(N, CurrNth1, P1, [P|Temp], L)
    	; make_NprimeList(N, CurrNth, P1, Temp, L)
    ).