member([E|_],E).
member([_|T],E):-
	member(T,E).

gen(_,C,0,C).
gen(L,[H|C],0,R):-
	member(L,E),
	not(member([H|C],E)),
	E>H,
	gen(L,[E,H|C],0,R).
gen(L,[H|C],1,R):-
	member(L,P),
	not(member([H|C],P)),
	P<H,
	gen(L,[P,H|C],1,R).
gen(L,[H|C],1,R):-
	member(L,M),
	not(member([H|C],M)),
	M>H,
	gen(L,[M,H|C],0,R).
start(L,R):-
	member(L,E1),
	member(L,E2),
	E1<E2,
	gen(L,[E1,E2],1,R).
startAll(L,P):-
	findall(R,start(L,R),P).

