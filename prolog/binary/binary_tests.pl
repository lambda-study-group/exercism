pending :-
    current_prolog_flag(argv, ['--all'|_]).
pending :-
    write('\nA TEST IS PENDING!\n'),
    fail.

:- begin_tests(binary).

    test(binary_0_is_decimal_0, condition(true)) :-
        binary("0", Result),
            Result == 0.

    test(binary_0_is_decimal_0, condition(pending)) :-
        binary("0", 0).

    test(binary_1_is_decimal_1, condition(pending)) :-
        binary("1", 1).

    test(binary_10_is_decimal_2, condition(pending)) :-
        binary("10", 2).

    test(binary_11_is_decimal_3, condition(pending)) :-
        binary("11", 3).

    test(binary_100_is_decimal_4, condition(pending)) :-
        binary("100", 4).

    test(binary_1001_is_decimal_9, condition(pending)) :-
        binary("1001", 9).

    test(binary_11010_is_decimal_26, condition(pending)) :-
        binary("11010", 26).

    test(binary_10001101000_is_decimal_1128, condition(pending)) :-
        binary("10001101000", 1128).

    test(binary_ignores_leading_zeros, condition(pending)) :-
        binary("000011111", 31).

    test(two_is_not_a_valid_binary_digit, [fail, condition(pending)]) :-
        binary("2", _).

    test(nonbinary_digit_is_invalid, [fail, condition(pending)]) :-
        binary("01201", _).

    test(trailing_nonbinary_characters_is_invalid, [fail, condition(pending)]) :-
        binary("10nope", _).

    test(nonbinary_characters_is_invalid, [fail, condition(pending)]) :-
        binary("nope10", _).

    test(internal_nonbinary_characters_is_invalid, [fail, condition(pending)]) :-
        binary("10nope10", _).

    test(whitespace_separated_is_invalid, [fail, condition(pending)]) :-
        binary("001 nope", _).

:- end_tests(binary).
