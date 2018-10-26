anagram(Word, Options, Matching) :-
  include(pred(Word), Options, Filtered),
  Matching = Filtered.

pred(Word, XS) :-
  string_lower(Word, LowerWord),
  string_lower(XS, LowerXS),
  string_chars(LowerWord, LstWord),
  string_chars(LowerXS, LstXS),
  msort(LstWord, SortedLWord),
  msort(LstXS, SortedLXS),
  LowerWord \== LowerXS,
  SortedLWord == SortedLXS.
