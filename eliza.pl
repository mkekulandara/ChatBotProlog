% the dictionary
lookup('you','i').
lookup('i','why do you').
lookup('are','am not').
lookup('do','no,').
lookup('portuguese','russian').
lookup(X,X).

% the translation procedure
translate([],[]).
translate([Word|Sentence],Response):-
	lookup(Word,RWord),
	translate(Sentence,RSentence),
	Response = [RWord|RSentence].
	
% the printing procedure
print_list([]).
print_list([H|T]) :-
	write(H),
	write(' '),
	print_list(T).

% the interaction procedure	
interact:-
	nl,
	write('Ready> '),
	read(X),
	translate(X,Y),
	write('Eliza: '),
	print_list(Y),
	nl,
	interact.