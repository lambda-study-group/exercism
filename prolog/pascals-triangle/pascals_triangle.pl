pascal(0, []) :- !.
pascal(N, XS) :-
  numlist(1, N, Lst),
  maplist(pascal, Lst, XS).

calc([X], [X]).
calc([X,Y|YS], [H|T]) :-
  H is X+Y,
  calc([Y|YS], T).

row(1, [1]) :- !.
row(N, [X|XS]) :-
  N1 is N + 1,
  row(N1, [X|XSS]),
  calc([X|XSS], XS), !.
