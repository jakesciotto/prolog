
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%  Fun With Cuts                 %%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
a(0).
a(1).
b(0).
b(1).
c(0).
c(1).
d(0).
e(0).

%quick test of all predicates
go :- go1, go2, go4, go5, go6, go3.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% no cuts, just follow the backtracking

go1 :- cp1(X,Y,Z), fail.
go1 :- write('second go1 alternate OK'), nl.

cp1(X,Y,Z) :-
   test1(X,Y,Z),
   write(X), write(Y), write(Z), nl.

test1(X,Y,Z) :-
   a(X), b(Y), c(Z).  % alternate 1 gives 1
test1(X,X,X) :-
   d(X).              % alternate 2 give 2

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% one cut

go2 :- cp2(X,Y,Z), fail.
go2 :- write('second go2 alternate OK'), nl.

cp2(X,Y,Z) :-
   test2(X,Y,Z),
   write(X), write(Y), write(Z), nl.

test2(X,Y,Z) :-
   !, a(X), b(Y), c(Z).  % alternate 1 gives 1
test2(X,X,X) :-
   d(X).                 % fails on backtracking

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% one cut, different location
% see also cp3 below

go4 :- cp4(X,Y,Z), fail.
go4 :- write('second go4 alternate OK'), nl.

cp4(X,Y,Z) :-
   test4(X,Y,Z),
   write(X), write(Y), write(Z), nl.

test4(X,Y,Z) :-
   a(X), !, b(Y), c(Z).
test4(X,X,X) :-
   a(2), d(X),
   write(X), write(' 2nd test'), nl.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% one cut, different location

go5 :- cp5(X,Y,Z), fail.
go5 :- write('second go5 alternate OK'), nl.

cp5(X,Y,Z) :-
   test5(X,Y,Z),
   write(X), write(Y), write(Z), nl.

test5(X,Y,Z) :- a(X), b(Y), !, c(Z).  % alternate 1 gives 1
test5(X,X,X) :- d(X).                 % fails on backtracking

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% one cut, different location

go6 :- cp6(X,Y,Z), fail.
go6 :- write('second go6 alternate OK'), nl.

cp6(X,Y,Z) :-
   test6(X,Y,Z),
   write(X), write(Y), write(Z), nl.

test6(X,Y,Z) :- a(X), b(Y), c(Z), !.  % alternate 1 gives 1
test6(X,X,X) :- d(X).                 % fails on backtracking

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% one cut, follow the backtracking

go3 :- cp3(X,Y,Z), fail.
go3 :- write('second go3 alternate OK'), nl.

cp3(X,Y,Z) :-
   write(' start cp3 1st'), nl,
   test3(X,Y,Z),
   write(X), write(Y), write(Z), nl,
   write(' end 1st cp3, test3 done'), nl.
cp3(X,X,X) :-
   write(' start cp3 2nd'), nl,
   d(X),
   write('found a value for d(X): '), write(X),
   nl, write(' end 2nd cp3'), nl.

test3(X,Y,Z) :-
   a(X), !, b(Y), c(Z). % gives 1
test3(X,X,X) :-
   e(X).                % fails since a(1) is true











