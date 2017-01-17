remove([],_,[]).
remove([H|T],E,[H|R]):-
  H\==E,
  remove(T,E,R).
remove([H|T],E,R):-
  remove(T,E,R).

occ([],X,0).
occ([H|T],X,Y):-
	H=X,
	occ(T,X,Z),
	Y is Z+1.
occ([H|T],X,Y):-
	H\=X,
	occ(T,X,Y).

pairs([],[]).
pairs([H|T],[[H,X]|TT]):-
	occ([H|T],H,X),
	remove([H|T],H,Z),
	pairs(Z,TT).
