% Modified From the book
% PROLOG PROGRAMMING IN DEPTH
% by Michael A. Covington, Donald Nute, and Andre Vellino
% (Prentice Hall, 1997).
% Copyright 1997 Prentice-Hall, Inc.
% For educational use only

% Modified version of File LEARNER.PL
% Program that modifies its own knowledge base
%  This program requires file KB.PL, to consult
%  or KB_ALT.PL to read

:- dynamic capital_of/2.   % what does this do?

% pretty procedural oriented don't you think
start :-  get_the_caps,
          nl,
          write('Type names in lower case, end with period.'),
          nl, write('Type "stop." to quit.'), nl, nl,
          process_a_query.

process_a_query :- write('State? '),
                   read(State),
                   answer(State).

get_the_caps :-
         write('Reading the states and capitals ...'), nl,
         kill_caps,
         see('kb_alt.pl'),
         read(FirstDataItem),
         read_in_data(FirstDataItem).

read_in_data(end_of_file) :-
         seen,
         write('Done, states and capitals loaded.'), nl.

read_in_data(State) :-
         read(Capital),
         assert(capital_of(State, Capital)),
         read(NextDataItem),
         read_in_data(NextDataItem).

% If user typed "stop." then save the knowledge base and quit.

answer(stop) :-    write('Saving the knowledge base...'),nl,
                   tell('kb_alt.pl'),
                   write_out_data.

% If the state is in the knowledge base, display it, then
% loop back to process_a_query

answer(State) :-   capital_of(State,City),
                   write('The capital of '),
                   write(State),
                   write(' is '),
                   write(City), nl, nl,
                   process_a_query.

% If the state is not in the knowledge base, ask the
% user for information, add it to the knowledge base, and
% loop back to process_a_query

answer(State) :-   \+ capital_of(State,_),
                   write('I do not know the capital of that state.'),nl,
                   write('Please tell me.'), nl,
                   write('Capital? '),
                   read(City),
                   write('Thank you.'), nl, nl,
                   assertz(capital_of(State,City)),
                   process_a_query.

write_out_data :-
     capital_of(State, City),
     write(State), write('.'), nl,
     write(City),  write('.'), nl,
     fail.

write_out_data :-
     told,
     write('Done.'), nl.

kill_caps :-
  capital_of(S,C),
  retract(capital_of(S,C)),
  fail.

kill_caps.
