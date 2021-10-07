#lang racket

(require "grep.rkt")

(module+ test
  (require rackunit rackunit/text-ui)

  (define suite
    (test-suite
     "grep tests"

     (test-equal? "Test grepping a single file"
                  (grep '()              ; flags
                        "Agamemnon"      ; pattern
                        '("iliad.txt"))  ; files
                  '("Of Atreus, Agamemnon, King of men."))

     (test-equal? "One file, one match, print line numbers flag"
                  (grep '("-n")
                        "Forbidden"
                        '("paradise-lost.txt"))
                  '("2:Of that Forbidden Tree, whose mortal tast"))

     (test-equal? "One file, one match, case-insensitive flag"
                  (grep '("-i")
                        "FORBIDDEN"
                        '("paradise-lost.txt"))
                  '("Of that Forbidden Tree, whose mortal tast"))

     (test-equal? "One file, one match, print file names flag"
                  (grep '("-l")
                        "Forbidden"
                        '("paradise-lost.txt"))
                  '("paradise-lost.txt"))

     (test-equal? "One file, one match, match entire lines flag"
                  (grep '("-x")
                        "With loss of Eden, till one greater Man"
                        '("paradise-lost.txt"))
                  '("With loss of Eden, till one greater Man"))

     (test-equal? "One file, match entire lines flag, no match"
                  (grep '("-x")
                        "Eden"
                        '("paradise-lost.txt"))
                  '())

     (test-equal? "One file, one match, multiple flags"
                  (grep '("-n" "-i" "-x")
                        "OF ATREUS, Agamemnon, KIng of MEN."
                        '("iliad.txt"))
                  '("9:Of Atreus, Agamemnon, King of men."))

     (test-equal? "One file, several matches, no flags"
                  (grep '()
                        "may"
                        '("midsummer-night.txt"))
                  '("Nor how it may concern my modesty,"
                    "But I beseech your grace that I may know"
                    "The worst that may befall me in this case,"))

     (test-equal? "One file, several matches, print line numbers flag"
                  (grep '("-n")
                        "may"
                        '("midsummer-night.txt"))
                  '("3:Nor how it may concern my modesty,"
                    "5:But I beseech your grace that I may know"
                    "6:The worst that may befall me in this case,"))

     (test-equal? "One file, several matches, match entire lines flag"
                  (grep '("-x")
                        "may"
                        '("midsummer-night.txt"))
                  '())

     (test-equal? "One file, several matches, case-insensitive flag"
                  (grep '("-i")
                        "ACHILLES"
                        '("iliad.txt"))
                  '("Achilles sing, O Goddess! Peleus' son;"
                    "The noble Chief Achilles from the son"))

     (test-equal? "One file, several matches, inverted flag"
                  (grep '("-v")
                        "Of"
                        '("paradise-lost.txt"))
                  '("Brought Death into the World, and all our woe,"
                    "With loss of Eden, till one greater Man"
                    "Restore us, and regain the blissful Seat,"
                    "Sing Heav'nly Muse, that on the secret top"
                    "That Shepherd, who first taught the chosen Seed"))

     (test-equal? "One file, no matches, various flags"
                  (grep '("-n" "-l" "-x" "-i")
                        "Gandalf"
                        '("iliad.txt"))
                  '())

     (test-equal? "Test grepping multiples files at once"
                  (grep '()
                        "Agamemnon"
                        '("iliad.txt" "midsummer-night.txt" "paradise-lost.txt"))
                  '("iliad.txt:Of Atreus, Agamemnon, King of men."))

     (test-equal? "Multiple files, several matches, no flags"
                  (grep '()
                        "may"
                        '("iliad.txt" "midsummer-night.txt" "paradise-lost.txt"))
                  '("midsummer-night.txt:Nor how it may concern my modesty,"
                    "midsummer-night.txt:But I beseech your grace that I may know"
                    "midsummer-night.txt:The worst that may befall me in this case,"))

     (test-equal? "Multiple files, several matches, print line numbers flag"
                  (grep '("-n")
                        "that"
                        '("iliad.txt" "midsummer-night.txt" "paradise-lost.txt"))
                  '("midsummer-night.txt:5:But I beseech your grace that I may know"
                    "midsummer-night.txt:6:The worst that may befall me in this case,"
                    "paradise-lost.txt:2:Of that Forbidden Tree, whose mortal tast"
                    "paradise-lost.txt:6:Sing Heav'nly Muse, that on the secret top"))

     (test-equal? "Multiple files, one match, print file names flag"
                  (grep '("-l")
                        "who"
                        '("iliad.txt" "midsummer-night.txt" "paradise-lost.txt"))
                  '("iliad.txt"
                    "paradise-lost.txt"))

     (test-equal? "Multiple files, several matches, case-insensitive flag"
                  (grep '("-i")
                        "TO"
                        '("iliad.txt" "midsummer-night.txt" "paradise-lost.txt"))
                  '("iliad.txt:Caused to Achaia's host, sent many a soul"
                    "iliad.txt:Illustrious into Ades premature,"
                    "iliad.txt:And Heroes gave (so stood the will of Jove)"
                    "iliad.txt:To dogs and to all ravening fowls a prey,"
                    "midsummer-night.txt:I do entreat your grace to pardon me."
                    "midsummer-night.txt:In such a presence here to plead my thoughts;"
                    "midsummer-night.txt:If I refuse to wed Demetrius."
                    "paradise-lost.txt:Brought Death into the World, and all our woe,"
                    "paradise-lost.txt:Restore us, and regain the blissful Seat,"
                    "paradise-lost.txt:Sing Heav'nly Muse, that on the secret top"))

     (test-equal? "Multiple files, several matches, inverted flag"
                  (grep '("-v")
                        "a"
                        '("iliad.txt" "midsummer-night.txt" "paradise-lost.txt"))
                  '("iliad.txt:Achilles sing, O Goddess! Peleus' son;"
                    "iliad.txt:The noble Chief Achilles from the son"
                    "midsummer-night.txt:If I refuse to wed Demetrius."))

     (test-equal? "Multiple files, one match, match entire lines flag"
                  (grep '("-x")
                        "But I beseech your grace that I may know"
                        '("iliad.txt" "midsummer-night.txt" "paradise-lost.txt"))
                  '("midsummer-night.txt:But I beseech your grace that I may know"))

     (test-equal? "Multiple files, one match, multiple flags"
                  (grep '("-n" "-i" "-x")
                        "WITH LOSS OF EDEN, TILL ONE GREATER MAN"
                        '("iliad.txt" "midsummer-night.txt" "paradise-lost.txt"))
                  '("paradise-lost.txt:4:With loss of Eden, till one greater Man"))

     (test-equal? "Multiple files, no matches, various flags"
                  (grep '("-n" "-l" "-x" "-i")
                        "Frodo"
                        '("iliad.txt" "midsummer-night.txt" "paradise-lost.txt"))
                  '())))
  (run-tests suite))
