member([E|_],E).
member([_|T],E):-
	member(T,E).
len([],0).
len([H|T],R):-
	len(T,R1),
	R is R1 + 1.
perm(_,C,C,L1,L1).

perm(L,C,R,L1,L2):-
	member(L,T),
	not(member(C,T)),
	L11 is L1+1,
	perm(L,[T|C],R,L11,L2).


permAll(L,Rez):-
	len(L,Lung),
	perm(L,[],Rez,0,Lung).

main(L,R):-
	findall(T,permAll(L,T),R).
