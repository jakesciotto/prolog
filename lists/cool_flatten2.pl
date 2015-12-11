% --------------------------------------------
% :: cool_flatten2.pl
% 
% CSCI 4540: Symbolic Programming
% Date: December 2, 2015
% Prof: Potter
%
% Problem description
% -----------------------
% RESULT is the list obtained from LIST containing
% the flattened elements of LIST.
% 
% Execution
% -----------------------
% ?- cool_flatten2([a,c,[b,[s]],a], X).
%
% --------------------------------------------- 

cool_flatten2(LIST, RESULT) :-
	flatten_dl(LIST, RESULT-[]).

flatten_dl([HEAD|TAIL], HEADRESULT-TAILRESULT) :-
	flatten_dl(HEAD, HEADRESULT-LIST1),
	flatten_dl(TAIL, LIST1-TAILRESULT).

flatten_dl(HEAD, [HEAD|TAIL]-TAIL) :-
	HEAD \== [].

flatten_dl([], TAIL-TAIL).