% --------------------------------------------
% :: cool_intersect3.pl
% 
% CSCI 4540: Symbolic Programming
% Date: December 2, 2015
% Prof: Potter
%
% Problem description
% -----------------------
% INTERSECT is the list of intersecting elements
% in LIST1 and LIST2 and LENGTH is the number of
% elements in the INTERSECT.
% 
% Execution
% -----------------------
% ?- cool_intersect3([a, b, c, d], [b, c, d, e], X, Y).
%
% --------------------------------------------- 

cool_intersect3([], _, [], 0).

cool_intersect3(_, [], [], 0).

cool_intersect3(LIST1, LIST2, INTERSECT, LENGTH) :-
	cool_intersect3_aux(LIST1, LIST2, INTERSECT, LENGTH, [], 0).

cool_intersect3_aux([], _, RESULT, LENGTH, RESULT, LENGTH).

cool_intersect3_aux([HEAD|TAIL], LIST2, RESULT, LENGTH, TEMPRESULT, TEMPLENGTH) :-
	member(HEAD, LIST2),
	NEWLENGTH is TEMPLENGTH + 1,
	cool_intersect3_aux(TAIL, LIST2, RESULT, LENGTH, [HEAD|TEMPRESULT], NEWLENGTH).

cool_intersect3_aux([HEAD|TAIL], LIST2, RESULT, LENGTH, TEMPRESULT, TEMPLENGTH) :-
	\+ member(HEAD, LIST2),
	cool_intersect3_aux(TAIL, LIST2, RESULT, LENGTH, TEMPRESULT, TEMPLENGTH).