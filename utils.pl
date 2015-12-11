write_list([]).

write_list([HEAD|TAIL]) :-
	is_list(HEAD) ->
		write_line(HEAD), write_list(TAIL)
		;
	write(HEAD), write_list(TAIL).

write_line([]) :- nl.

write_line([HEAD1|TAIL1]) :-
	write(HEAD1),
	nl,
	write_line(TAIL1).