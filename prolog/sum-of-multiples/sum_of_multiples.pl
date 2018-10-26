sum_of_multiples(_, 0, 0) :- !.
sum_of_multiples(Factors, Limit, 0) :-
  Until is Limit-1,
  sum_of_multiples(Factors, Until, NewSum),
  ( factored(Factors, Limit),
    Sum is Limit + NewSum, !;
    Sum is NewSum
  ).

factored([F|FS], Num) :-
  is_multiple(F, Num), !;
  factored(FS, Num).

is_multiple(A, B) :-
  0 is mod(A, B).
