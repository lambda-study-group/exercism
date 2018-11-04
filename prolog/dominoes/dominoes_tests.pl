pending :-
    current_prolog_flag(argv, ['--all'|_]).
pending :-
    write('\nA TEST IS PENDING!\n'),
    fail.

:- begin_tests(can_chain).

    test(empty_input_empty_output, condition(true)) :-
        can_chain([]).

    test(singleton_input_singleton_output, condition(pending)) :-
        can_chain([(1,1)]).

    test(singleton_that_cant_be_chained, [fail, condition(pending)]) :-
        can_chain([(1,2)]).

    test(three_elements, condition(pending)) :-
        can_chain([(1,2),(3,1),(2,3)]).

    test(can_reverse_dominoes, condition(pending)) :-
        can_chain([(1,2),(1,3),(2,3)]).

    test(cant_be_chained, [fail, condition(pending)]) :-
        can_chain([(1,2), (4,1), (2,3)]).

    test(disconnected_simple, [fail, condition(pending)]) :-
        can_chain([(1,1), (2,2)]).

    test(disconnected_double_loop, [fail, condition(pending)]) :-
        can_chain([(1,1), (2,1), (3,4), (4,3)]).

    test(disconnected_single_isolated, [fail, condition(pending)]) :-
        can_chain([(1,2), (2,3), (3,1), (4,4)]).

    test(need_backtrack, condition(pending)) :-
        can_chain([(1,2),(2,3),(3,1),(2,4),(2,4)]).

    test(separate_loops, condition(pending)) :-
        can_chain([(1,2),(2,3),(3,1),(1,1),(2,2),(3,3)]).

    test(nine_elements, condition(pending)) :-
        can_chain([(1,2),(5,3),(3,1),(1,2),(2,4),(1,6),(2,3),(3,4),(5,6)]).

:- end_tests(can_chain).
