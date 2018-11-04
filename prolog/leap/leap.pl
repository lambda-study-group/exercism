divisible(X, Y) :-
  R is X mod Y,
  R == 0.

leap(Year) :-
  divisible(Year, 4),
  \+divisible(Year, 100);
  divisible(Year, 100),
  divisible(Year, 400).
