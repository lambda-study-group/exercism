transcript([], []) :- !.
transcript([R | Rna], [D | Dna]) :-
  (R = 'A' -> D = 'U';
   R = 'T' -> D = 'A';
   R = 'C' -> D = 'G';
   R = 'G' -> D = 'C'
  ),
  transcript(Rna, Dna).

rna_transcription(Rna, Dna) :-
  string_chars(Rna, RnaList),
  transcript(RnaList, DnaList),
  string_chars(Dna, DnaList).
