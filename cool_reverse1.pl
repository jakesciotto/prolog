% --------------------------------------------
% :: cool_reverse1.pl
% 
% CSCI 4540: Symbolic Programming
% Date: December 2, 2015
% Prof: Potter
%
% Problem description
% -----------------------
% Naive version of reverse.
%
% Execution
% -----------------------
% ?- cool_reverse1([a, b, c], X).
%
% --------------------------------------------- 

cool_reverse1(LIST, RESULT) :-
	cool_reverse1(LIST, RESULT, []).

cool_reverse([], RESULT, RESULT).

cool_reverse1([HEAD|TAIL], RESULT, REST) :-
	cool_reverse1(TAIL, RESULT, [HEAD|REST]).