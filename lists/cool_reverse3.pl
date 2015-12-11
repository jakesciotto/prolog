% --------------------------------------------
% :: cool_reverse3.pl
% 
% CSCI 4540: Symbolic Programming
% Date: December 2, 2015
% Prof: Potter
%
% Problem description
% -----------------------
% RESULT is the list obtained from reversing
% list LIST using difference lists.
%
% Execution
% -----------------------
% ?- cool_reverse3([a, b, c], X).
%
% --------------------------------------------- 

cool_reverse3(LIST, RESULT) :-
	reverse_dl(LIST, RESULT-[]).

reverse_dl([HEAD|TAIL], HEADRESULT-TAILRESULT) :-
	reverse_dl(TAIL, HEADRESULT-[HEAD|TAILRESULT]).

reverse_dl([], RESULT-RESULT).