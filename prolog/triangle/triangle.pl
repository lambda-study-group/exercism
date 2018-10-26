triangle(Side, Side, Side, "equilateral") :-
  valid_triangle(Side, Side, Side), !.

triangle(Side1, Side1, Side2, "isoceles") :-
  valid_triangle(Side1, Side1, Side2), !.

triangle(Side1, Side2, Side1, "isoceles") :-
  valid_triangle(Side1, Side1, Side2), !.

triangle(Side2, Side1, Side1, "isoceles") :-
  valid_triangle(Side1, Side1, Side2), !.

triangle(Side1, Side2, Side3, "scalene") :-
  valid_triangle(Side1, Side2, Side3).

valid_triangle(A, B, C) :-
  AB is A + B,
  AC is A + C,
  BC is B + C,
  not(A > BC),
  not(B > AC),
  not(C > AB),
  A \== 0,
  B \== 0,
  C \== 0.
