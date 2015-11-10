% ---------------------------------------------
% :: jakesciotto-kakuro.pl
% 
% CSCI 4540 Symbolic Programming
% September 14th, 2015
% Jake Sciotto
%
% ---------------------------------------------

go :-

write('well here we go'),
nl,
write('SOLUTIONS:'),
nl,


solve(  X22,   X23,   X26,   X28,   X210,  X211,  
		X33,   X34,   X36,   X37,   X38,   X310,  X311,  X312,  
		X42,   X43,   X44,   X45,   X48,   X49,   X411,  X412,  
		X54,   X55,   X56,   X59,   X510,  
		X62,   X63,   X64,   X65,   X66,   X68,   X69,   X610,  X612,  
		X72,   X73,   X711,  X712,  
		X82,   X83,   X84,   X85,   X86,   X88,   X89,   X810,  X811, X812,  
		X95,   X96,   X98,   X910,  
		X102,  X103,  X104,  X105,  X106,  X108,  X109,  X1010, X1011, X1012,    
		X113,  X114,  X116,  X117,  X118,  X1110, X1112, 
		X122,  X123,  X126,  X127,  X1210, X1211, X1212),

print_lists([    

		[X22,   X23,   X26,   X28,    X210,  X211],
		[X33,   X34,   X36,   X37,    X38,   X310,  X311,  X312],  
		[X42,   X43,   X44,   X45,    X48,   X49,   X411,  X412],  
		[X54,   X55,   X56,   X59,    X510],  
		[X62,   X63,   X64,   X65,    X66,   X68,   X69,   X610,  X612],  
		[X72,   X73,   X711,  X712],  
		[X82,   X83,   X84,   X85,    X86,   X88,   X89,   X810,  X811, X812], 
		[X95,   X96,   X98,   X910],  
		[X102,  X103,  X104,  X105,   X106,  X108,  X109,  X1010, X1011, X1012], 
		[X113,  X114,  X116,  X117,   X118,  X1110, X1112], 
		[X122,  X123,  X126,  X127,   X1210, X1211, X1212] 
		
		 ]).


solve(  X22,   X23,   X26,   X28,   X210,  X211,  
		X33,   X34,   X36,   X37,   X38,   X310,  X311,  X312,  
		X42,   X43,   X44,   X45,   X48,   X49,   X411,  X412,  
		X54,   X55,   X56,   X59,   X510,  
		X62,   X63,   X64,   X65,   X66,   X68,   X69,   X610,  X612,  
		X72,   X73,   X711,  X712,  
		X82,   X83,   X84,   X85,   X86,   X88,   X89,   X810,  X811, X812,  
		X95,   X96,   X98,   X910,  
		X102,  X103,  X104,  X105,  X106,  X108,  X109,  X1010, X1011, X1012,    
		X113,  X114,  X116,  X117,  X118,  X1110, X1112, 
		X122,  X123,  X126,  X127,  X1210, X1211, X1212) :-

/*
  Starting from the top left corner and moving in a snaking motion. 
  Using the fact that the puzzle is 12 by 12 and symmetric, attacking the portions
  with most easily solved variables first.
  
  [hint, [X[row][column], etc]
  
*/

kakuro( [	
				[10, [X22, X23, 7]],
				[10, [X22, 3, X42]],
				[9,  [3, X33, X34]],
				[9,  [X23, X33, X43]],
				[16, [X42, X43, X44, X45, 1]],
				[17, [7, X34, X44, X54, X64]],

				[7,  [X54, X55, X56]],
				[11, [X45, X55, X65]],
				[15, [X62, X63, X64, X65, X66]],
				[18, [X26, X36, 1, X56, X66]],

				[22, [X26, 9, X28]],
				[17, [9, X37]],
				[15, [X36, X37, X38]],
				[24, [X28, X38, X48, 5, X68]],

				[14, [X63, X73, X83]],
				[16, [X72, X73]],
				[17, [X62, X72, X82]],

				[8, [5, X59, X510]],
				[13, [X49, X59, X69]],
				[15, [X48, X49, 2, X411, X412]],
				[26, [X68, X69, X610, 2, X612]],

				[18, [6, X312, X412]],
				[16, [X210, X310, 2, X510, X610]],
				[15, [X210, X211, 6]],
				[17, [X211, X311, X411]],
				[21, [X310, X311, X312]],

				[8,  [X612, X712, X812]],
				[10, [X711, X712]],
				[19, [2, X711, X811]],

				[8,  [X122, X123, 4]],
				[10, [X102, X112, X122]],
				[7,  [X112, X113, X114]],
				[12, [X103, X113, X123]],

				[6, [X117, X127]],
				[9, [X126, X127, 3]],
				[6, [X116, X117, X118]],

				[9,  [X98, 4, X910]],
				[12, [X89, 4, X109]],
				[15, [X88, X98, X108, X118, 3]],
				[25, [X88, X89, X810, X811, X812]],

				[14, [X1110, 7, X1112]],
				[7,  [X1012, X1112, X1212]],
				[13, [X1210, X1211, X1212]],
				[21, [X1011, 7, X1211]],
				[18, [X108, X109, X1010, X1011, X1012]],
				[17, [X810, X910, X1010, X1110, X1210]],

				[18, [6, X95, X96]],
				[15, [X86, X96, X106, X116, X126]],
				[24, [X84, 6, X104, X114, 4]],
				[25, [X82, X83, X84, X85, X86]],
				[21, [X85, X95, X105]],
				[31, [X102, X103, X104, X105, X106]]

			]  
		).
		
/* begin solve definition */

kakuro([]).

kakuro([[SUM|[VARS]]|SUM_TAIL]) :-
	fill_vars(SUM, VARS, DISTINCT),
	check(SUM, DISTINCT),
	kakuro(SUM_TAIL).

fill_vars(_, [], []).
fill_vars(SUM, [NEXT|REST], [NEXT|REST_OF]) :-
	helper(NEXT),
	NEXT < SUM,
	fill_vars(SUM, REST, REST_OF),
 	not_member(NEXT, REST_OF). 
	
/* for NEXT - number of values 1 - 9 */
	
helper(1).
helper(2).
helper(3).
helper(4).
helper(5).
helper(6).
helper(7).
helper(8).
helper(9). 
	
/* checking for sums that we know we will have */
check(SUM, [N1, N2]) :- SUM is N1 + N2.
check(SUM, [N1, N2, N3]) :- SUM is N1 + N2 + N3.
check(SUM, [N1, N2, N3, N4, N5]) :- SUM is N1 + N2 + N3 + N4 + N5.

/* to make sure next variable is not a member of the tail of the rest of the sum */ 
not_member(_, []) :- !.
not_member(Y, [HEAD|TAIL]) :- Y \= HEAD, not_member(Y, TAIL).
 
/* to print the lists */
print_lists([FL|OL]) :- print_list(FL), print_lists(OL).

print_list([]) :- nl.
print_list([FE|OE]) :- write(FE), write(' '), print_list(OE).

/* prints the cputime, calculated while the kakuro procedure executes */
print_time :- 
	write('Current cpu time is '),
	write(cputime),
	write('.'),
	nl.