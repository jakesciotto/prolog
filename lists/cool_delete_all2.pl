% --------------------------------------------
% :: cool_delete_all2.pl
% 
% CSCI 4540 Symbolic Programming
% Date: December 2, 2015
% Prof: Potter
%
% Problem description
% -----------------------
% RESULT is the list obtained from deleting all
% instances of element ELEMENT from a list
% at varying depths.
%
% Execution
% -----------------------
% ?- cool_delete_all2(a, [a, [a], c], X).
%
% --------------------------------------------- 

cool_delete_all2(_, [], []).

cool_delete_all2(ELEMENT, [ELEMENT|TAIL], RESULT) :-
	cool_delete_all2(ELEMENT, TAIL, RESULT). 

cool_delete_all2(ELEMENT, [HEAD|TAIL], [HEAD|TAILRESULT]) :-
	\+ is_list(HEAD),
	ELEMENT \== HEAD,
	cool_delete_all2(ELEMENT, TAIL, TAILRESULT). 

cool_delete_all2(ELEMENT, [HEAD|TAIL], RESULT) :-
	is_list(HEAD),
	ELEMENT \== HEAD,
	cool_delete_all2(ELEMENT, TAIL, TAILRESULT),
	cool_delete_all2(ELEMENT, HEAD, HEADRESULT),
	append(HEADRESULT, TAILRESULT, RESULT).