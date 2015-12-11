% --------------------------------------------
% :: cool_reverse2.pl
% 
% CSCI 4540: Symbolic Programming
% Date: December 2, 2015
% Prof: Potter
%
% Problem description
% -----------------------
% RESULT is the list obtained from reversing the
% elements of LIST using tail recursion.
%
% Execution
% -----------------------
% ?- cool_reverse2([a, b, c], X).
%
% --------------------------------------------- 

cool_reverse2(LIST, RESULT) :-
	cool_reverse2(LIST, [], RESULT).
	
cool_reverse2([], RESULT, RESULT).

cool_reverse2([HEAD|TAIL], ACC, RESULT) :-
	cool_reverse2(HEAD, [], SUBRESULT),
	cool_reverse2(TAIL, [SUBRESULT|ACC], RESULT).
	
cool_reverse2([HEAD|TAIL], ACC, RESULT) :-
	cool_reverse2(TAIL, [HEAD|ACC], RESULT).