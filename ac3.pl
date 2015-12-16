% --------------------------------------------
% :: ac3.pl
% 
% From The Art Of Prolog (1999), Sterling & Shapiro
% 
% Description
% -----------------------
% Basic framework for AC-3 Algorithm. 
%
% ---------------------------------------------

ac3(VARLIST, ARCLIST, NEWVARLIST) :- !,
	ac3_aux(VARLIST, ARCLIST, ARCLIST, NEWVARLIST).
	
ac3_aux(VARLIST, _, [], VARLIST) :- !.

ac3_aux(VARLIST, ORIGARCLIST, ARCLIST, NEWVARLIST) :-
	remove( (V1, V2, P), ARCLIST, TMPARCLIST),
	revise(V1, V2, P, VARLIST, TMPVARLIST1),
	revise(V2, V1, P, TMPVARLIST1, TMPVARLIST2), 
	( same_set(TMPVARLIST2, VARLIST) -> 
		NEXTARCLIST = TMPARCLIST
		;
		setof((V3, V1, P),
				 (member((V3, V1, P), ORIGARCLIST),
				  not(V3 = V1), not(V3 = V2)),
				  SUSPECTARCS),
		union(TMPARCLIST, SUSPECTARCS, NEXTARCLIST)),
ac3_aux(TMPVARLIST2, ORIGARCLIST, NEXTARCLIST, NEWVARLIST).

revise(V1, V2, P, VARLISTIN, [(V1, NEWD1LIST) | RESTVARS]) :-
	remove((V1, D1LIST), VARLISTIN, RESTVARS),
	member((V2, D2LIST), RESTVARS),
	( setof(D1, 
			D2^(member(D1, D1LIST), 
			member(D2, D2LIST), 
			apply(P, D1, D2)),
	NEWD1LIST)
	;
	writel(['no consistent assignment to', V1]), nl, !, fail).

same_set(X, Y) :-
	setof(Z, member(Z, X), L1),
	setof(Z, member(Z, Y), L2),
	L1 = L2.

apply(F, ARGS, TERM) :-
	F=.. LIST,
	append(LIST, ARGS, ALL),
	TERM =.. ALL.

remove(_, [], []).

% matches if current head element = remove element
remove(J, [(J, _)|TAIL], RES) :- 
	remove(J, TAIL, RES).
	
% matches if current head element is not equal to remove element
remove(J, [(K, V)|TAIL], [(K, V)|RES]) :-
	J \== K,
	remove(J, TAIL, RES).
