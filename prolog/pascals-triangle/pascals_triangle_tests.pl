pending :-
    current_prolog_flag(argv, ['--all'|_]).
pending :-
    write('\nA TEST IS PENDING!\n'),
    fail.

:- begin_tests(pascal).

    test(zero_rows, condition(true)) :-
      pascal(0, []).

    test(single_row, condition(pending)) :-
      pascal(1, [[1]]).

    test(two_rows, condition(pending)) :-
      pascal(2, [[1], [1,1]]).

    test(three_rows, condition(pending)) :-
      pascal(3, [[1], [1,1], [1,2,1]]).

    test(four_rows, condition(pending)) :-
      pascal(4, [[1], [1,1], [1,2,1], [1,3,3,1]]).

    test(five_rows, condition(pending)) :-
      pascal(5, [[1], [1,1], [1,2,1], [1,3,3,1], [1,4,6,4,1]]).

    test(six_rows, condition(pending)) :-
      pascal(6, [[1], [1,1], [1,2,1], [1,3,3,1], [1,4,6,4,1], [1,5,10,10,5,1]]).

    test(ten_rows, condition(pending)) :-
      pascal(10, [ [1],
                   [1,1],
                   [1,2,1],
                   [1,3,3,1],
                   [1,4,6,4,1],
                   [1,5,10,10,5,1],
                   [1,6,15,20,15,6,1],
                   [1,7,21,35,35,21,7,1],
                   [1,8,28,56,70,56,28,8,1],
                   [1,9,36,84,126,126,84,36,9,1]
                 ]).

:- end_tests(pascal).
