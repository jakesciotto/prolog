% --------------------------------------------
% :: cool_flatten.pl
% 
% CSCI 4540: Symbolic Programming
% Date: December 2, 2015
% Prof: Potter
%
% Problem description
% -----------------------
% RESULT is the list obtained from LIST containing
% the flattened elements of LIST using tail recursion.
% 
% Execution
% -----------------------
% ?- cool_flatten([a,c,[b,[s]],a], X).
%
% --------------------------------------------- 

cool_flatten(LIST, RESULT) :-
	cool_flatten(LIST, [], FLATRESULT),
	reverse(FLATRESULT, RESULT).

cool_flatten([], RESULT, RESULT).

cool_flatten([HEAD|TAIL], ACC, RESULT) :-
	is_list(HEAD), !,
	cool_flatten(HEAD, ACC, TAILRESULT),
	cool_flatten(TAIL, TAILRESULT, RESULT).

cool_flatten([HEAD|TAIL], ACC, RESULT) :-
	cool_flatten(TAIL, [HEAD|ACC], RESULT).

