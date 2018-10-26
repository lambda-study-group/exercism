pending :-
    current_prolog_flag(argv, ['--all'|_]).
pending :-
    write('\nA TEST IS PENDING!\n'),
    fail.

:- begin_tests(triangle).

    test(equilateral_triangle_has_all_sides_equal, condition(true)) :-
        triangle(2, 2, 2, Result),
            Result == "equilateral".

    test(larger_equilateral_triangle, condition(pending)) :-
        triangle(10, 10, 10, "equilateral").

    test(isosceles_triangle_with_last_two_sides_equal, condition(pending)) :-
        triangle(3, 4, 4, "isosceles").

    test(isosceles_triangle_with_first_two_sides_equal, condition(pending)) :-
        triangle(4, 4, 3, "isosceles").

    test(isosceles_triangle_with_first_and_last_sides_equal, condition(pending)) :-
        triangle(4, 3, 4, "isosceles").

    test(isosceles_triangle_with_unequal_side_larger_than_equal_sides, condition(pending)) :-
        triangle(4, 7, 4, "isosceles").

    test(scalene_triangle_has_no_equal_sides, condition(pending)) :-
        triangle(3, 4, 5, "scalene").

    test(a2_equals_b_plus_c_isnt_always_equilateral, condition(pending)) :-
        triangle(5, 4, 6, "scalene").

    test(larger_scalene_triangle, condition(pending)) :-
        triangle(10, 11, 12, "scalene").

    test(scalene_triangle_with_sides_in_descending_order, condition(pending)) :-
        triangle(5, 4, 2, "scalene").

    test(small_scalene_triangle_with_floating_point_values, condition(pending)) :-
        triangle((0.4), (0.6), (0.3), "scalene").

    test(a_triangle_violating_the_triangle_inequality_is_illegal, [fail, condition(pending)]) :-
        triangle(7, 3, 2, _).

    test(two_sides_equal_but_violates_triangle_inequality, [fail, condition(pending)]) :-
        triangle(1, 1, 3, _).

    test(triangles_with_all_sides_zero_are_illegal, [fail, condition(pending)]) :-
        triangle(0, 0, 0, _).

:- end_tests(triangle).
