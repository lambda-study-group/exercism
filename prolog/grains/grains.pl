square(SquareNumber, Value) :-
  SquareNumber > 0,
  SquareNumber < 65,
  Value is 2**(SquareNumber - 1).

total(Value) :-
  numlist(1, 64, Range),
  maplist(square, Range, List),
  sumlist(List, Sum),
  Value is Sum.
