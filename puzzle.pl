/* 
% --------------------------------------------
% :: puzzle.pl
% 
% CSCI 4540: Symbolic Programming
% Date: September 1, 2015
% Prof: Potter
% Assignment: Homework #1
%
% ---------------------------------------------

% Problem description
% -----------------------
% 
% A farmer bought a fox, goose, and grain from the market and
% must cross a stream in his boat. He only has space for one other belonging.
% The goose can not be left with the grain, and the fox cannot be left 
% with the goose. How can he get all of his belongings across the stream?
% --------------------------------------------- 

% --------------------------------------------- 
% state(A, B, C, D, E, F)
% 		A = Farmer
%		B = Fox
% 		C = Goose
% 		D = Grain
% 		E = Opposite shore of stream
% 		F = What the farmer just brought
% --------------------------------------------- */

% farmer brings nothing
move(state(X,Fox,Goose,Grain,Y,_), 
     state(Y,Fox,Goose,Grain,X,nothing), 
     crossed(farmer,Y)).

% farmer brings goose
move(state(X,Fox,X,Grain,Y,_), 
	 state(Y,Fox,Y,Grain,X,goose),
	 crossed(goose,Y)).
	 
% farmer brings grain
move(state(X,Fox,Goose,X,Y,_), 
	 state(Y,Fox,Goose,Y,X,grain),
	 crossed(grain,Y)).

% farmer brings fox
move(state(X,X,Goose,Grain,Y,_), 
	 state(Y,Y,Goose,Grain,X,fox),
	 crossed(fox,Y)).

% makes sure the move is not redundant
check_move(state(_,_,_,_,_,Previous), 
			  state(_,_,_,_,_,Current)) :- Current \== Previous.

% states that are not allowed
not_allowed(state(Farmer,S1,S1,Grain,_,_)) :- S1 \== Farmer.
not_allowed(state(Farmer,Fox,S1,S1,_,_)) :- S1 \== Farmer.

cross(state(west,west,west,west,east,_)).

cross(St1) :-
	move(St1,St2,Move),
	check_move(St1,St2),
	\+(not_allowed(St2)),
	write(St1), 
	nl,
	cross(St2).
	
go :- cross(state(east,east,east,east,west,nothing)).

