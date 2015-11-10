% -----------------------------
% INSERTION SORT
% -----------------------------

insert_sort(LIST, SORTED) :-
	i_sort(LIST, [], SORTED).

i_sort([], ACC, ACC).
i_sort([HEAD|TAIL], ACC, SORTED) :-
	insert(HEAD, ACC, NEWACC),
	i_sort(TAIL, NEWACC, SORTED).

insert(X, [Y|T], [Y|NT]) :-
	insert(X, T, NT).

insert(X, [Y|T], [X,Y|T]) :- 
	X =< Y.

insert(X, [], [X]).

% -----------------------------
% QUICK SORT
% -----------------------------

quicksort([], []).
quicksort([HEAD|TAIL], SORTED) :-
	split(HEAD, TAIL, FRONT, BACK),
	quicksort(FRONT, FRESULT), 
	quicksort(BACK, BRESULT),
	append(FRESULT, [HEAD|BRESULT], SORTED).
	
split(_, [], [], []).
split(H, [A|X], [A|Y], Z) :-
	A =< H, !,
	split(H, X, Y, Z).

split(H, [A|X], Y, [A|Z]) :-
	A > H, !,
	split(H, X, Y, Z).

% -----------------------------
% BUBBLE SORT
% -----------------------------

bubblesort(L, S):-
	swap(L, LS), !, 
	bubblesort(LS, S).
	
bubblesort(S, S).

swap([X,Y|T], [Y,X|T]):- 
	X > Y.
swap([Z|T], [Z|TT]):- 
	swap(T, TT).

% -----------------------------
% SORTING WITH MAX/MIN
% -----------------------------

min([X],X):- !.

min([P|R],P):- 
	min(R,X),X > P,!.
min([P|R],X):-
	min(R,X),X =< P.

max([X],X):-!.
max([P|R],P):- 
	max(R,X),X =< P, !.
	
max([P|R],X):- 
	max(R,X),X > P.

minsort([],[]):- !.
minsort(L,[M|LS]):-
	min(L,M),
	select(M,L,LM),
minsort(LM,LS).

minsort_iter(L,LS):-
	msi(L,[],LS).
	
msi([],LS,LS):- !.

msi(L,LA,LS):-
	max(L,M),
	select(M,L,LM),!,
	msi(LM,[M|LA],LS).

% -----------------------------
% QUICK SORT
% -----------------------------

% -----------------------------
% MERGE SORT
% -----------------------------
/*
merge([], LIST, LIST).
merge([H1|T1], [], [H1|T1]).

merge([H1|T1], [H2|T2], [H1|T3]) :-
	X =< Y,
	merge(T1, [H2|T2], T3).
	
merge([H1|T1], [H2|T2], [H2|T3]) :-
	X > Y,
	merge([H1|T1], T2, T3).
*/

% -----------------------------
% ROTATE LIST
% -----------------------------

% -----------------------------------
% NAIVE REVERSE
% -----------------------------------

naivereverse([], []).
naivereverse([HEAD|TAIL], RESULT) :- 
	naivereverse(TAIL, NEWRESULT),
	append(NEWRESULT, [HEAD], RESULT).
