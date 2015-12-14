% --------------------------------------------
% :: hill_climbing.pl
% 
% From The Art of Prolog (1999), Sterling & Shapiro
% 
% Description
% -----------------------
% Basic framework for Hill Climbing Search.
%
% Execution
% -----------------------
% ?-
%
% ---------------------------------------------

test_hill_climb(PROBLEM, MOVES) :-
	initial_state(PROBLEM, STATE),
	solve_hill_climb(STATE, [STATE], MOVES).

solve_hill_climb(STATE, _, []) :-
	final_state(STATE).

solve_hill_climb(STATE, HISTORY, [MOVE|MOVES]) :-
	hill_climb(STATE, MOVE),
	update(STATE, MOVE, STATE1),
	legal(STATE1),
	\+ member(STATE1, HISTORY),
	solve_hill_climb(STATE1, HISTORY, MOVES).

hill_climb(STATE, MOVE) :-
	findall(M, move(STATE, M), MOVES),
	evaluate_and_order(MOVES, STATE, [], MVS),
	member((MOVE, _), MVS).

evaluate_and_order([MOVE|MOVES], STATE, MVS, ORDEREDMVS) :-
	update(STATE, MOVE, STATE1),
	value(STATE1, VALUE),
	insert((MOVE, VALUE), MVS, MVS1),
	evaluate_and_order(MOVES, STATE, MVS1, ORDEREDMVS).

evaluate_and_order([], _, MVS, MVS).

insert(MV, [], [MV]).
insert((M, V),[(M1, V1)|MVS], [(M, V), (M1, V1) |MVS]) :-
	V >= V1.

insert((M, V), [(M1, V1)|MVS], [(M1, V1)|MVS1]) :-
	V < V1, 
	insert((M, V), MVS, MVS1).

/* 
	Implementation of other predicates are problem-dependent.
*/

update(_, STATE1, STATE1).
legal(_).