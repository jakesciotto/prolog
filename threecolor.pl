% --------------------------------------------------------
% :: threecolor.pl
% 
% CSCI 4550 Artificial Intelligence
% November 2nd, 2015
% Jake Sciotto
%
% ---------------------------------------------------------

% vertices

region(western_australia).
region(northern_territory).
region(south_australia).
region(queensland).
region(new_south_wales).
region(victoria).

% constraints

adjacent(western_australia, northern_territory).
adjacent(western_australia, south_australia).
adjacent(south_australia,   northern_territory).
adjacent(south_australia,   queensland).
adjacent(south_australia,   new_south_wales).
adjacent(south_australia,   victoria).
adjacent(victoria,          new_south_wales).
adjacent(queensland,        new_south_wales).
adjacent(queensland,        northern_territory).

% colors

color(green).
color(red).
color(blue).

map :- 
	color_map([], SOLUTION),
	/* findall(SOLUTION, color_map([], SOLUTION), RESULT), */
	reverse(SOLUTION, RESULT),
	writeln(RESULT).

color_map(SOFAR, SOLUTION) :-
	region(REGION),
	color(C),
	\+ member([REGION, _], SOFAR),
	\+ prohibited(REGION, C, SOFAR),
	
	color_map([[REGION, C]|SOFAR], SOLUTION).
color_map(SOLUTION, SOLUTION).


prohibited(REGION, C, SOFAR) :-
	connected(REGION, NEIGHBOR),
	member([NEIGHBOR, C], SOFAR).
	
connected(REGION, NEIGHBOR) :- 
	adjacent(REGION, NEIGHBOR) 
	; 
	adjacent(NEIGHBOR, REGION).


writeln([]).
writeln([HEAD|TAIL]) :-
	nl, 
	write(HEAD), 
	write('   '),
	writeln(TAIL).
	
member(X, [X|_]).
member(X, [_|Y]) :-
	member(X, Y).

% -------- 

