% --------------------------------------------
% :: ac1.pl
% 
% From The Art of Prolog (1999), Sterling & Shapiro
% 
% Description
% -----------------------
% Basic framework for AC-1 Algorithm.
%
% Execution
% -----------------------
% ?-
%
% ---------------------------------------------
		   	
ac1(VARLIST, ARCLIST, NEWVARLIST) :- !,
	ac1sub(VARLIST, ARCLIST, ARCLIST, 0, NEWVARLIST).

ac1sub(VARLIST, ORIGARCLIST, ARCLIST, BIT, NEWVARLIST) :-
	remove((V1, V2, P), ARCLIST, NEWARCLIST), 
	revise(V1, V2, P, VARLIST, TMPVARLIST1),
	revise(V2, V1, P, TMPVARLIST1, TMPVARLIST2),
	(BIT = 0, same_set(VARLIST, TMPVARLIST2) -> NEWBIT = 0 ; NEWBIT = 1),
	(NEWARCLIST = [], NEWBIT = 0 -> NEWVARLIST = TMPVARLIST2
		; (NEWARCLIST = []
			-> ac1sub(TMPVARLIST2, ORIGARCLIST, ORIGARCLIST, 0, NEWVARLIST)
			;  ac1sub(TMPVARLIST2, ORIGARCLIST, NEWARCLIST, NEWBIT, NEWVARLIST))).

revise(V1, V2, P, VARLISTIN, [(V1, NEWD1LIST)|RESTVARS]) :-
	remove((V1, D1LIST), VARLISTIN, RESTVARS),
	member((V2, D2LIST), RESTVARS),
	(setof(D1,
		   D2^(member(D1, D1LIST), member(D2, D2LIST), apply(P, D1, D2)),
		   NEWD1LIST)
		; writel(['no consistent assignment to ', V1]), nl, !, fail).

same_set(X, Y) :-
	setof(Z, member(Z, X), L1),
	setof(Z, member(Z, Y), L2),
	L1 = L2.
	

remove(_, [], []).

% matches if current head element = remove element
remove(J, [(J, _)|TAIL], RES) :- 
	remove(J, TAIL, RES).
	
% matches if current head element is not equal to remove element
remove(J, [(K, V)|TAIL], [(K, V)|RES]) :-
	J \== K,
	remove(J, TAIL, RES).

apply(F, ARGS, TERM) :-
	F=.. LIST,
	append(LIST, ARGS, ALL),
	TERM =.. ALL.