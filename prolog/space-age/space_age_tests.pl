pending :-
    current_prolog_flag(argv, ['--all'|_]).
pending :-
    write('\nA TEST IS PENDING!\n'),
    fail.

:- begin_tests(space_age).

    float_eq(Real, Expected) :-
        Expected is round(Real * 100).

    test(earth, condition(true)) :-
        space_age("Earth", 1000000000, Age),
        float_eq(Age, 3169).

    test(mercury, condition(pending)) :-
        space_age("Mercury", 2134835688, Age),
        float_eq(Age, 28088).

    test(venus, condition(pending)) :-
        space_age("Venus", 189839836, Age),
        float_eq(Age, 978).

    test(mars, condition(pending)) :-
        space_age("Mars", 2329871239, Age),
        float_eq(Age, 3925).

    test(jupiter, condition(pending)) :-
        space_age("Jupiter", 901876382, Age),
        float_eq(Age, 241).

    test(saturn, condition(pending)) :-
        space_age("Saturn", 3000000000, Age),
        float_eq(Age, 323).
    
    test(uranus, condition(pending)) :-
        space_age("Uranus", 3210123456, Age),
        float_eq(Age, 121).

    test(neptune, condition(pending)) :-
        space_age("Neptune", 8210123456, Age),
        float_eq(Age, 158).

:- end_tests(space_age).
