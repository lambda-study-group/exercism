to_decimal([], 0).
to_decimal([B | Bin], Dec) :-
  atom_number(B, N),
  (N is 0, !; N is 1),
  to_decimal(Bin, D),
  Dec is D*2 + N.

binary("0", 0).
binary(Str, Dec) :-
  string_chars(Str, Lst),
  reverse(Lst, Rev),
  to_decimal(Rev, Dec).
