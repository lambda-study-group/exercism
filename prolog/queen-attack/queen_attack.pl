% Please visit https://exercism.io/tracks/prolog/installation
% for instructions on setting up prolog.
% Visit https://exercism.io/tracks/prolog/tests
% for help running the tests for prolog exercises.

% Replace the goal below with
% your implementation.

create((X,Y)) :-
  X >= 0,
  7 >= X,
  Y >= 0,
  7 >= Y.

cross((X,Y), (Z,W)) :-
  X  == Z, Y \== W, !;
  X \== Z, Y  == W.

diagonal((X,Y), (Z,W)) :-
  (X-Y) \== (Z-W), !;
  (X+Y) \== (Z+W).

attack(XY, ZW) :-
  create(XY), create(ZW),
  (cross(XY, ZW), !;
   diagonal(XY, ZW)
  ).
