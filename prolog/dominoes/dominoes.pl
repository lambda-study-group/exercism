can_chain([]) :- !.
can_chain([(X,X)]) :- !.
can_chain(Pieces) :-
  build(Pieces, Chain), !,
  cycle(Chain).

build([], []).
build([A], [A]).
build(Pieces, [(A, B), (B, C) | Rest]) :-
  select((A,B), Pieces, NewRest),
  build(NewRest, [(B,C) | Rest]).
build(Pieces, [(A, B), (B, C) | Rest]) :-
  select((B,A), Pieces, NewRest),
  build(NewRest, [(B,C) | Rest]).

cycle([(X,_) | XS]) :- last(XS, (_,X)).
