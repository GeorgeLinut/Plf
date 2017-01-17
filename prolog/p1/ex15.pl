add_last(E,[],[E]).
add_last(E,[H|T],[H|R]):-
	add_last(E,T,R).
reverse([],[]).
reverse([H|T],R):-
	reverse(T,R1),
	add_last(H,R1,R).
member([E|_],E):-!.
member([_|T],E):-
	member(T,E).
set([],[]).
set([H|T],[H|R]):-
	not(member(T,H)),
	set(T,R).
set([_|T],R):-
	set(T,R).
mainA(L,R):-
	reverse(L,L1),
	set(L1,R1),
	reverse(R1,R).

appendlist([],L2,L2).
appendlist([H|T],L2,[H|T1]):-
	appendlist(T,L2,T1).

parimp([],[],[],0,0).
parimp([H|T],[H|L1],L2,N1,N2):-
	H mod 2=:=0,
	parimp(T,L1,L2,N11,N2),
	N1 is N11 + 1.
parimp([H|T],L1,[H|L2],N1,N2):-
	H mod 2\==0,
	parimp(T,L1,L2,N1,N22),
	N2 is N22 + 1.
mainpar(L,R,N1,N2):-
	parimp(L,L1,L2,N1,N2),
	appendlist(L1,L2,R).





