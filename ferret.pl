% --------------------------------------------------------
% :: ferret.pl
%
% Jake Sciotto
%
% ---------------------------------------------------------

persons(0, []) :- !.

persons(N, [(_NATIONALITY, _COLOR, _DRINK, _GAME, _ANIMAL)|T]) :- 
	N1 is N-1, 
	persons(N1,T).

person(1, [H|_], H) :- !.

person(N, [_|T], R) :- 
	N1 is N-1, 
	person(N1, T, R).
	
/* The Englishman works in the red shop. */
hint1([(englishman, 	red, 	_, 		_,		  _)|_]).
hint1([_|T]) :- hint1(T).

/* The Spaniard has a dog. */
hint2([(spaniard, 		_, 		_, 	    _, 		dog)|_]).
hint2([_|T]) :- hint2(T).

/*They drink coffee in the green shop. */
hint3([(_, 			green, 	coffee,  	_, 	  	  _)|_]).
hint3([_|T]) :- hint3(T).

/* The Belgian drinks tea. */
hint4([(belgian, 	_, 		tea,  		_,		  _)|_]).
hint4([_|T]) :- hint4(T).

/* The green shop is next to the orange shop. */
hint5([(_, 			green, 	_, 		 	_, 	      _)|_]).	  
hint5([(_,			orange, _, 		 	_,		  _)|_]).
hint5([_|T]) :- hint5(T).	 
	 
/* The Angry Birds player has a cat. */
hint6([(_, 			_, 		_, 		 	ab,     cat)|_]).
hint6([_|T]) :- hint6(T).

/* In the yellow shop they play candy crush. */
hint7([(_, 			yellow, _, 		 	cc, 	  _)|_]).
hint7([_|T]) :- hint7(T).

/* In the middle shop they drink red bull. */
hint8(PERSONS) :- person(3, PERSONS, (_, _, redbull, _, _)).

/*The Norwegian works in the first shop from the list. */
hint9(PERSONS) :- person(1, PERSONS, (norwegian, _, _, _, _)).

/*The Jetpack Joyride player drinks Powerade. */
hint10([(_, 		_, 		powerade, 	jj, 	  _)|_]).
hint10([_|T]) :- hint10(T).

/* The Spongebob player works next to the person with the goldfish. */
hint11([(_,			_, 		_, 			sb, 	  _)|_]).
hint11([(_,			_, 		_, 			_,	  	 gf)|_]).
hint11([_|T]) :- hint11(T).
	    
/* In the shop next to the shop with the rabbit they play candy crush. */
hint12([(_,			_, 		_, 			_,   rabbit)|_]).
hint12([(_,			_, 		_, 		    cc,       _)|_]).
hint12([_|T]) :- hint12(T).

/* The French person play Words With Friends. */
hint13([(frenchman,	_, 		_, 			wwf, 	  _)|_]).
hint13([_|T]) :- hint13(T).

/* The Norwegian works next to the blue shop. */
hint14([(norwegian, 	_, 		_, 			_, 		  _), 
	    (_, 		    blue, 	_, 			_, 		  _)|_]).
hint14([(_, 			blue,	_, 			_, 		  _), 
	    (norwegian,   _,	 	_, 			_, 		  _)|_]).
hint14([_|T]) :- hint14(T).

question1([(_, _, pepsi, _, _)|_]).
question1([_|T]) :- question1(T).

question2([(_, _, _, _, ferret)|_]).
question2([_|T]) :- question2(T).

time(go) :- go.

go  :- 
	findall(PERSONS, solution(PERSONS), RESULT),
	length(RESULT, COUNT),
	print_hints(RESULT),
	write('solutions: '), write(COUNT).
	 		

solution(PERSONS) :-
	persons(5, PERSONS),
	hint1(PERSONS),
	hint2(PERSONS),
	hint3(PERSONS),
	hint4(PERSONS),
	hint5(PERSONS),
	hint6(PERSONS),
	hint7(PERSONS),
	hint8(PERSONS),
	hint9(PERSONS),
	hint10(PERSONS),
	hint11(PERSONS),
	hint12(PERSONS),
	hint13(PERSONS),
	hint14(PERSONS),
	question1(PERSONS),
	question2(PERSONS).


print_hints([]) :- nl, print_time, nl.
print_hints([HEAD|TAIL]) :-
	write(HEAD),
	nl,
	print_hints(TAIL).

print_time :- 
	statistics(cputime, CPUTIME),
	statistics(stack, STACK),
	write('cputime: '), write(CPUTIME), nl,
	write('stack memory used: '), write(STACK).
	