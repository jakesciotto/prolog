% --------------------------------------------
% :: cool_delete_all1.pl
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
% NOTE: Fails at depth > 1.
%
% Execution
% -----------------------
% ?- cool_delete_all1(a, [a, v, c], X).
%
% --------------------------------------------- 

cool_delete_all1(_, [], []).

cool_delete_all1(ELEMENT, [ELEMENT|TAIL], RESULT) :- !,
	cool_delete_all1(ELEMENT, TAIL, RESULT).
	
cool_delete_all1(ELEMENT, [HEAD|OGTAIL], [HEAD|NEWTAIL]) :-
	cool_delete_all1(ELEMENT, OGTAIL, NEWTAIL).