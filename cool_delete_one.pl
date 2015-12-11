% --------------------------------------------
% :: cool_delete_one.pl
% 
% CSCI 4540: Symbolic Programming
% Date: December 2, 2015
% Prof: Potter
%
% Problem description
% -----------------------
% RESULT is the list obtained from deleting 
% element ELEMENT from a list.
%
% Execution
% -----------------------
% ?- cool_delete_one(a, [a, b, c], X).
%
% --------------------------------------------- 

cool_delete_one(ELEMENT, [ELEMENT|RESULT], RESULT).

cool_delete_one(ELEMENT, [HEAD|HEADRESULT], [HEAD|RESULT]) :- 
	ELEMENT \== HEAD, 
	cool_delete_one(ELEMENT, HEADRESULT, RESULT).