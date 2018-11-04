isogram(Str) :-
  string_lower(Str, Lower),
  string_chars(Lower, Lst),
  include(is_alpha, Lst, Chars),
  sort(Chars, Sorted),

  length(Chars, L1),
  length(Sorted, L2),
  L1 == L2.
