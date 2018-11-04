nucleotide_count(Str, Count) :-
  string_chars(Str, Chars),
  count(Chars, [('A', 0), ('C', 0), ('G', 0), ('T', 0)], Count), !.

count([], Counts, Counts).
count([X | XS], Current, Counts) :-
  count_single(X, Current, NewCounts),
  count(XS, NewCounts, Counts).

count_single(A, [(B, Count) | Tail], NewCounts) :-
  count_single(A, Tail, TailCount),
  append([(B, Count)], TailCount, NewCounts).
count_single(A, [(A, Count) | Tail], NewCounts) :-
  NewCount is Count + 1,
  append([(A, NewCount)], Tail, NewCounts).
