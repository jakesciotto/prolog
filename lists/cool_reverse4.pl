% --------------------------------------------
% :: cool_reverse4.pl
% 
% CSCI 4540: Symbolic Programming
% Date: December 2, 2015
% Prof: Potter
%
% Problem description
% -----------------------
% RESULT is the list obtained from reversing
% list LIST, and eliminates duplicates that can either 
% be consecutive or somewhere in the list.
%
% Execution
% -----------------------
% ?- cool_reverse4([a, a, c, b, x, c], X).
%
% --------------------------------------------- 

cool_reverse4([], []).

cool_reverse4(LIST, RESULT) :-
	cool_reverse4(LIST, [], RESULT).

cool_reverse4([], RESULT, RESULT).

cool_reverse4([HEAD, HEAD2|TAIL], ACC, RESULT) :-
	HEAD == HEAD2,
	cool_reverse4(TAIL, [HEAD|ACC], RESULT).

cool_reverse4([HEAD|TAIL], ACC, RESULT) :-
	cool_reverse4(TAIL, [HEAD|ACC], RESULT).
