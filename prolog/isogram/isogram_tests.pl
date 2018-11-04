pending :-
    current_prolog_flag(argv, ['--all'|_]).
pending :-
    write('\nA TEST IS PENDING!\n'),
    fail.

:- begin_tests(isogram).

    test(empty_string, condition(true)) :-
      isogram("").

    test(only_lower_case_characters, condition(pending)) :-
      isogram("isogram").

    test(one_duplicated_character, [fail, condition(pending)]) :-
      isogram("eleven").

    test(longest_reported_english_isogram, condition(pending)) :-
      isogram("subdermatoglyphic").

    test(duplicated_character_in_mixed_case, [fail, condition(pending)]) :-
      isogram("Alphabet").

    test(hypothetical_isogrammic_word_with_hyphen, condition(pending)) :-
      isogram("thumbscrew-japingly").

    test(duplicated_non_letter_character, condition(pending)) :-
      isogram("Hjelmqvist-Gryb-Zock-Pfund-Wax").

    test(name_that_is_an_isogram, condition(pending)) :-
      isogram("Emily Jung Schwartzkopf").

    test(duplicated_character_in_the_middle, [fail, condition(pending)]) :-
      isogram("accentor").

    test(largest_pure_letter_characters_isogram, condition(pending)) :-
      isogram("AbcdEfghIjkLMNopQrStUvWxyZ.").

:- end_tests(isogram).
