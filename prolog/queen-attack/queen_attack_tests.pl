 % Please visit https://exercism.io/tracks/prolog/installation
% for instructions on setting up prolog.
% Visit https://exercism.io/tracks/prolog/tests
% for help running the tests for prolog exercises.

% The goal below allows tests to be skipped
% unless the "--all" flag is passed at
% the command line.

pending :-
    current_prolog_flag(argv, ['--all'|_]).
pending :-
    write('\nA TEST IS PENDING!\n'),
    fail.

:- begin_tests(create_tests).

    test(create_in_center, condition(true)) :-
      create((3,3)).

    test(valid_position, condition(pending)) :-
      create((2,2)).

    test(must_have_positive_row, [fail, condition(pending)]) :-
      create((-2,2)).

    test(row_smaller_than_board_size, [fail, condition(pending)]) :-
      create((8,4)).

    test(must_have_positive_column, [fail, condition(pending)]) :-
      create((2,-2)).

    test(column_smaller_than_board_size, [fail, condition(pending)]) :-
      create((4,8)).

:- end_tests(create_tests).


:- begin_tests(attack_tests).

    test(cant_attack, [fail, condition(pending)]) :-
      attack((2,4), (6,6)).

    test(attack_on_same_row, condition(pending)) :-
      attack((2,4), (2,6)).

    test(attack_same_column, condition(pending)) :-
      attack((4,5), (2,5)).

    test(attack_first_diagonal, condition(pending)) :-
      attack((2,2), (0,4)).

    test(attack_second_diagonal, condition(pending)) :-
      attack((2,2), (3,1)).

    test(attack_third_diagonal, condition(pending)) :-
      attack((2,2), (1,1)).

    test(attack_fourth_diagonal, condition(pending)) :-
      attack((2,2), (5,5)).

:- end_tests(attack_tests).
