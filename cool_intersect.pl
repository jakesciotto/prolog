% --------------------------------------------
% :: cool_intersect.pl
% 
% CSCI 4540: Symbolic Programming
% Date: December 2, 2015
% Prof: Potter
%
% Problem description
% -----------------------
% Naive version of intersection of two lists.
% 
% Execution
% -----------------------
% ?- cool_intersect([a, b, c, d], [b, c, d, e], X).
%
% --------------------------------------------- 
cool_intersect([], _, []).

cool_intersect([HEAD|TAIL], OTHER, [HEAD|RESULT]) :-
	member(HEAD, OTHER), !,
	cool_intersect(TAIL, OTHER, RESULT).
	
cool_intersect([_|TAIL], OTHER, RESULT) :-
	cool_intersect(TAIL, OTHER, RESULT).



