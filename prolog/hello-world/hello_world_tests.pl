% Please visit http://exercism.io/languages/prolog/installation
% for instructions on setting up prolog.
% Visit http://exercism.io/languages/prolog/tests
% for help running the tests for prolog exercises.

% The goal below allows tests to be skipped
% unless the "--all" flag is passed at
% the command line.

pending :-
    current_prolog_flag(argv, ['--all'|_]).
pending :-
    write('\nA TEST IS PENDING!\n'),
    fail.

:- begin_tests(hello_world).

    test(hello_world, condition(true)) :-
        hello_world('Hello World!').

    % Once the first test passes, un-skip the following test by
    % changing `pending` in `condition(pending)` to `true`.
    % Repeat for each test until they are all passing.

    test(hello_world_with_a_name, condition(pending)) :-
        hello_world('Alice', 'Hello Alice!').

    test(hello_world_another_name, condition(pending)) :-
        hello_world('Bob', 'Hello Bob!').

:- end_tests(hello_world).
