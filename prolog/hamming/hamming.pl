hamming_distance(Str1, Str2, Dist) :-
  string_chars(Str1, L1),
  string_chars(Str2, L2),
  distance(L1, L2, D),
  Dist is D.

distance([], [], 0).
distance([X|XS], [Y|YS], D) :-
  length(XS, L1),
  length(YS, L2),
  L1 == L2,
  X \== Y -> (
    distance(XS,YS, NewD),
    D is NewD+1
  ) ; distance(XS, YS, D).
