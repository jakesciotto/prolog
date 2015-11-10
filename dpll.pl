% ----------------------------------------
% :: dpll.pl
% 
% ----------------------------------------

dpll(M) :- member([], M), !.
dpll(M) :- M = [[L|_]|_], (-N=L ; -L=N)
			   ->
			   reduce(M, L, N, M1), dpll(M1),
			   reduce(M, N, L, M2), dpll(M2).
			   
reduce([], _, _, []).
reduce([C|M], L, N, M1) :-
	(member(N, C) -> M1 = M2 ; del(L, C, D), M1 = [D|M2]),
reduce(M, L, N, M2).

del(_, [], []).
del(A, [B|C], D) :- 
	(A=B -> D=E ; D=[B|E], del(A, C, E)).
