pending :-
    current_prolog_flag(argv, ['--all'|_]).
pending :-
    write('\nA TEST IS PENDING!\n'),
    fail.

:- begin_tests(leap_tests).

    test(leap_year, condition(true)) :-
        leap(1996).

    test(standard_and_odd_year, condition(pending)) :-
        not(leap(1997)).

    test(standard_even_year, condition(pending)) :-
        not(leap(1998)).

    test(standard_nineteeth_century, condition(pending)) :-
        not(leap(1900)).

    test(standard_eighteenth_century, condition(pending)) :-
        not(leap(1800)).

    test(leap_twenty_fourth_century, condition(pending)) :-
        leap(2400).

    test(leap_y2k, condition(pending)) :-
        leap(2000).

:- end_tests(leap_tests).
