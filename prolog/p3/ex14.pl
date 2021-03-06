sum([],0).
sum([H|T],R):-
	sum(T,R1),
	R is R1+H.
subsets([],[]).
subsets([_|T],R):-
	subsets(T,R).
subsets([H|T],[H|R]):-
	subsets(T,R).
pro(L,R):-
	findall(T,subsets(L,T),R).
select([],_,[]).
select([H|T],C,[H|P]):-
	sum(H,R1),
	R1=:=C,
	select(T,C,P).
select([H|T],C,P):-
	sum(H,R1),
	R1=\=C,
	select(T,C,P).
main(L,C,R):-
	pro(L,R1),
	select(R1,C,R).
