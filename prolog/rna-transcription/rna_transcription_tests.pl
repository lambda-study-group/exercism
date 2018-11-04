pending :-
    current_prolog_flag(argv, ['--all'|_]).
pending :-
    write('\nA TEST IS PENDING!\n'),
    fail.

:- begin_tests(rna_transcription).

    test(rna_complement_of_cytosine_is_guanine, condition(true)) :-
        rna_transcription("C", Result),
            Result == "G".

    test(rna_complement_of_guanine_is_cytosine, condition(pending)) :-
        rna_transcription("G", "C").

    test(rna_complement_of_thymine_is_adenine, condition(pending)) :-
        rna_transcription("T", "A").

    test(rna_complement_of_adenine_is_uracil, condition(pending)) :-
        rna_transcription("A", "U").

    test(rna_complement, condition(pending)) :-
        rna_transcription("ACGTGGTCTTAA", "UGCACCAGAAUU").

    test(dna_correctly_handles_invalid_input, [fail, condition(pending)]) :-
        rna_transcription("U", _).

    test(dna_correctly_handles_completely_invalid_input, [fail, condition(pending)]) :-
        rna_transcription("XXX", _).

    test(dna_correctly_handles_partially_invalid_input, [fail, condition(pending)]) :-
        rna_transcription("ACGTXXXCTTAA", _).

:- end_tests(rna_transcription).
