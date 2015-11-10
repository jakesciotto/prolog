% 	-----------------------------------------
%	PROBLEM 1
%	Finds the last element in a list. 
% 	-----------------------------------------
my_last([HEAD], HEAD).
my_last([_|TAIL], RESULT) :-
	my_last(TAIL, RESULT).


% 	-----------------------------------------
%	PROBLEM 2
%	Finds the last BUT ONE element in a list. 
% 	-----------------------------------------
last_but_one([HEAD, _], HEAD).
last_but_one([_|TAIL], RESULT) :-
	last_but_one(TAIL, RESULT).

	
% 	-----------------------------------------
%	PROBLEM 3
%	Finds the K'th element in a list. 
% 	-----------------------------------------
some_element(HEAD, [HEAD|_], 1).

some_element(HEAD, [_|TAIL], X) :-
	X > 1,
	X1 is X - 1,
	some_element(HEAD, TAIL, X1).

% 	-----------------------------------------
%	PROBLEM 4
%	Counts the number of elements in a list. 
% 	-----------------------------------------
count_up([], 0).

count_up([_|TAIL], X) :-
	count_up(TAIL, X1),
	X is X1 + 1.
	


% 	-----------------------------------------
%	PROBLEM 5
%	Reverses a list.
% 	-----------------------------------------
/*
reverse_list([], []).

reverse_list(LIST, RESULT) :-
	reverse_help(LIST, RESULT, []).
	
reverse_help([], LIST, RESULT) :- !.

reverse_help([HEAD|TAIL], RESULT, REST) :- 
	display(RESULT),
	reverse_help(TAIL, RESULT, [HEAD|REST]).*/

% 	-----------------------------------------
%	PROBLEM 6
%	Tests the list to see if it is a 
% 	palindrome. 
% 	-----------------------------------------
	
palindrome(LIST) :- reverse(LIST,LIST).

% 	-----------------------------------------
%	PROBLEM 7
%	Flattens a list.
% 	-----------------------------------------


flat(HEAD, [HEAD]) :- \+ is_list(HEAD).
flat([], []).

flat([HEAD|TAIL], RESULT) :-
	flat(HEAD, HEADLIST), 
	flat(TAIL, HEADRESULT),
	append(HEADLIST, HEADRESULT, RESULT).
	

% 	-----------------------------------------
%	PROBLEM 8
%	Compresses the duplicates in a list.
% 	-----------------------------------------
	
compress([], []).
compress([HEAD],[HEAD]). 
	
compress([HEAD, HEAD|TAIL], RESULT) :-
	compress([HEAD|TAIL], RESULT).

compress([HEAD, HEADRESULT|TAILRESULT], [HEAD|RESULT]) :-
	HEAD \= HEADRESULT,
	compress([HEADRESULT|TAILRESULT], RESULT).
	
% 	-----------------------------------------
%	PROBLEM 14
%	Duplicates the elements in a list.
% 	-----------------------------------------
	
dupes([], []).

/* succeeds when head of LIST unifies with head of RESULT */
dupes([HEAD], [HEAD,HEAD]). 

dupes([HEAD|TAIL], [HEAD, HEADRESULT|RESULT]) :-
	HEAD = HEADRESULT,
	dupes(TAIL, RESULT).

%   -----------------------------------------
%   PROBLEM 15
%   Duplicates the elements in a list a set 
%	number of times.
%   -----------------------------------------

dupes_x(LIST, X, RESULT) :- 
	dupes_x(LIST, X, RESULT, X).

dupes_x([], _, [], _).

dupes_x([_|TAIL], X, TAILRESULT, 0) :- 
	dupes_x(TAIL, X, TAILRESULT, X).
	
dupes_x([HEAD|TAIL], X, [HEAD|TAILRESULT], Y) :-
	Y > 0,
	Y1 is Y - 1,
	dupes_x([HEAD|TAIL], X, TAILRESULT, Y1).

%   -----------------------------------------
%   PROBLEM 17
%	Split a list into two parts. Length of
% 	first part is given.
%   -----------------------------------------

%   -----------------------------------------
%   PROBLEM 20
%	Delete an element at position k from a list.
%   -----------------------------------------

delete_at(ELEMENT, [ELEMENT|TAIL], 1, TAIL).
delete_at(ELEMENT, [HEAD|TAIL], X, [HEAD|HEADRESULT]) :-
	X > 1,
	X1 is X - 1,
	delete_at(ELEMENT, TAIL, X1, HEADRESULT).

%   -----------------------------------------
%   PROBLEM 21
%	Insert element at k.
%   -----------------------------------------

insert_at(ELEMENT, TAIL, 1, [ELEMENT|TAIL]).
insert_at(ELEMENT, [HEAD|TAIL], X, [HEAD|HEADRESULT]) :-
	display(HEAD),
	nl,
	X > 1,
	X1 is X - 1,
	insert_at(ELEMENT, TAIL, X1, HEADRESULT).

%   -----------------------------------------
%   PROBLEM 22
%	Create a an inclusive list between two 
% 	endices.
%   -----------------------------------------
range(X, X, [X]).

range(X, Y, [HEAD|TAIL]) :-
	X = HEAD,
	X1 is X + 1, 
	range(X1, Y, TAIL).

%   -----------------------------------------
%	PROBLEM 31
%	Determine whether or not a given number
%	is prime.
%   -----------------------------------------

is_prime(2).
is_prime(3).
is_prime(P) :-
	integer(P),
	P > 3,
	P mod 2 =\= 0,
	\+ has_factor(P,3).
	
has_factor(N,L) :- 
	N mod L =:= 0.
	
has_factor(N,L) :-
	L * L < N,
	L2 is L + 2,
	has_factor(N, L2).

%   -----------------------------------------
%	PROBLEM 2, TEST 1
%	Succeeds if first/only parameter is odd
%	length list.
%   -----------------------------------------

odd_length([_]).
odd_length([_,_|T]) :-
	odd_length(T).

%   -----------------------------------------
%	PROBLEM 4, TEST 1
%	Transposes an n-element matrix into an 
%	n-row, two element matrix.
%   -----------------------------------------

trans_it([[X],[Y]], [[X,Y]]).
trans_it([[H1|T1],[H2|T2]], [[H1,H2]|TRES]) :-
	trans_it([T1,T2], TRES).
	


%   -----------------------------------------
%	EXAMPLE PROBLEM - BOOK
%
% 	Define a predicate sums(X,Y,Z) such that 
%	X + Y = Z. Give it the ability to solve
%	for any third predicate given the other
%	two.
%   -----------------------------------------


%   -----------------------------------------
%	EXAMPLE PROBLEM - BOOK
%
% 	Implement a solver for Ohm's Law with 
% 	full interchangability of unknowns. That
%	is, define ohm(E,I,R) such that E = I x R
% 	and such that any of the three arguments
% 	will be found if the other two are given.
%   -----------------------------------------

% ------------------------------------------------------------------

count_em(_, [], 0).

count_em(ELE, [ELE|T], RES) :-
	count_em(ELE, T, TRES),
	RES is TRES + 1.
	
count_em(ELE, [H|T], RES) :-
	ELE \== H,
	count_em(ELE, T, RES).
	
% ------------------------------------------------------------------

count_ts(ELE, LIST, COUNT) :-
	count_aux(ELE, LIST, 0, COUNT).
	
count_aux(_, [], COUNT, COUNT) :-
	count_aux(ELE, [ELE|TAIL], I, COUNT) :-
	NEWI is I + 1, 
	count_aux(ELE, TAIL, NEWI, COUNT).
	
count_aux(ELE, [H|T], I, COUNT) :- 
	ELE \== H, 
	count_aux(ELE, T, I, COUNT).
	
% ------------------------------------------------------------------	
	
flat_delete_all(_, [], []).

flat_delete_all(ELEMENT, [ELEMENT|TAIL], RESULT) :-
	flat_delete_all(ELEMENT, TAIL, RESULT). 

flat_delete_all(ELEMENT, [HEAD|TAIL], [HEAD|TAILRESULT]) :-
	\+ is_list(HEAD),
	ELEMENT \== HEAD,
	flat_delete_all(ELEMENT, TAIL, TAILRESULT). 

flat_delete_all(ELEMENT, [HEAD|TAIL], RESULT) :-
	is_list(HEAD),
	ELEMENT \== HEAD,
	flat_delete_all(ELEMENT, TAIL, TAILRESULT),
	flat_delete_all(ELEMENT, HEAD, HEADRESULT),
	append(HEADRESULT, TAILRESULT, RESULT).

% ------------------------------------------------------------------

perms([], []).
perms([X,Y], [[Y,X], [X,Y]]).
perms([X,Y,Z], [[X,Y,Z],[Y,X,Z],[Z,Y,X],[X,Z,Y],[Y,Z,X],[Z,X,Y]]).

perms([HEAD|TAIL], RESULT) :-
	perms(TAIL, L3),
	
	append(L1, L2, L3),
	append(L1, [HEAD], L4),
	append(L4, L2, RESULT),
	insert(HEAD, L3, RESULT).

permu([], []).
permu([X,Y], [[Y,X], [X,Y]]) :- !.
permu([X,Y,Z], [[X,Y,Z],[Y,X,Z],[Z,Y,X],[X,Z,Y],[Y,Z,X],[Z,X,Y]]) :- !.

permu([HEAD|TAIL], RESULT) :-
	permu(TAIL, L3),
	
	helper(L1, L2, L3),
	helper(L1, [HEAD], L4),
	helper(L4, L2, RESULT).
	
helper([], RESULT, RESULT).

helper([HEAD|TAIL], RESULT, [HEAD|TTAIL]) :-
	helper(TAIL, RESULT, TTAIL).

% ------------------------------------------------------------------

power([], []).
power([X,Y], [[], [X], [Y], [Y,X], [X,Y]]) :- !.

power([HEAD|TAIL], [HEAD|RESULT]) :-
	power(TAIL, RESULT).
	
power([_|TAIL], RESULT) :- 
	power(TAIL, L3),
	
	power_helper(L1, L2, L3),
	power_helper(L1, [_], L4),
	power_helper(L4, L2, RESULT).
	
power_helper([], RESULT, RESULT).

power_helper([HEAD|TAIL], RESULT, [HEAD|TTAIL]) :-
	power_helper(TAIL, RESULT, TTAIL).

% ------------------------------------------------------------------

flat_reverse(HEAD, [HEAD]) :- \+ is_list(HEAD).
flat_reverse([], []).

flat_reverse([HEAD|TAIL], RESULT) :-
	flat_reverse(TAIL, TAILRESULT), 
	flat_reverse(HEAD, HEADRESULT),
	append(TAILRESULT, HEADRESULT, RESULT).
	
% ------------------------------------------------------------------

flat_delete_all(_, [], []).

flat_delete_all(ELEMENT, [ELEMENT|TAIL], RESULT) :-
	flat_delete_all(ELEMENT, TAIL, RESULT). 

flat_delete_all(ELEMENT, [HEAD|TAIL], [HEAD|TAILRESULT]) :-
	\+ is_list(HEAD),
	ELEMENT \== HEAD,
	flat_delete_all(ELEMENT, TAIL, TAILRESULT). 

flat_delete_all(ELEMENT, [HEAD|TAIL], RESULT) :-
	is_list(HEAD),
	ELEMENT \== HEAD,
	flat_delete_all(ELEMENT, TAIL, TAILRESULT),
	flat_delete_all(ELEMENT, HEAD, HEADRESULT),
	append(HEADRESULT, TAILRESULT, RESULT).
	
% ------------------------------------------------------------------
	
delete_all(_,[],[]).
delete_all(Ele,[Ele|Tail],Result) :- delete_all(Ele,Tail,Result).

delete_all(Ele,[Head|Tail],[Head|Result]) :-
	Ele \== Head,
	delete_all(Ele,List,Result).


