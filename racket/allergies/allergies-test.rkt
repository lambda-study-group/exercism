#lang racket

; Tests adapted from `problem-specifications/canonical-data.json v2.0.0
(require "allergies.rkt")

(module+ test
  (require rackunit rackunit/text-ui)

  (define-check (lists-equiv? description actual expected)
    (check-equal? (sort actual string<?)
                  (sort expected string<?)
                  description))

  (define-check (test-allergic? description allergen score)
    (check-true (allergic-to? allergen score))
                  #t
                  description)

  (define-check (test-not-allergic? description allergen score)
    (check-false (allergic-to? allergen score))
                  #f
                  description)

  (define egg-suite
    (test-suite
     "testing for eggs allergy"

     (test-not-allergic? "not allergic to anything" "eggs" 0)
     (test-allergic?     "allergic only to eggs" "eggs" 1)
     (test-allergic?     "allergic to eggs and something else" "eggs" 3)
     (test-not-allergic? "allergic to something, but not eggs" "eggs" 2)
     (test-allergic?     "allergic to everything" "eggs" 255)))

  (define peanuts-suite
    (test-suite
     "testing for peanuts allergy"

     (test-not-allergic? "not allergic to anything" "peanuts" 0)
     (test-allergic?     "allergic only to peanuts" "peanuts" 2)
     (test-allergic?     "allergic to peanuts and something else" "peanuts" 7)
     (test-not-allergic? "allergic to something, but not peanuts" "peanuts" 5)
     (test-allergic?     "allergic to everything" "peanuts" 255)))

  (define shellfish-suite
    (test-suite
     "testing for shellfish allergy"

     (test-not-allergic? "not allergic to anything" "shellfish" 0)
     (test-allergic?     "allergic only to shellfish" "shellfish" 4)
     (test-allergic?     "allergic to shellfish and something else" "shellfish" 14)
     (test-not-allergic? "allergic to something, but not shellfish" "shellfish" 10)
     (test-allergic?     "allergic to everything" "shellfish" 255)))

  (define strawberries-suite
    (test-suite
     "testing for strawberries allergy"

     (test-not-allergic? "not allergic to anything" "strawberries" 0)
     (test-allergic?     "allergic only to strawberries" "strawberries" 8)
     (test-allergic?     "allergic to strawberries and something else" "strawberries" 28)
     (test-not-allergic? "allergic to something, but not strawberries" "strawberries" 20)
     (test-allergic?     "allergic to everything" "strawberries" 255)))

  (define tomatoes-suite
    (test-suite
     "testing for tomatoes allergy"

     (test-not-allergic? "not allergic to anything" "tomatoes" 0)
     (test-allergic?     "allergic only to tomatoes" "tomatoes" 16)
     (test-allergic?     "allergic to tomatoes and something else" "tomatoes" 56)
     (test-not-allergic? "allergic to something, but not tomatoes" "tomatoes" 40)
     (test-allergic?     "allergic to everything" "tomatoes" 255)))

  (define chocolate-suite
    (test-suite
     "testing for chocolate allergy"

     (test-not-allergic? "not allergic to anything" "chocolate" 0)
     (test-allergic?     "allergic only to chocolate" "chocolate" 32)
     (test-allergic?     "allergic to chocolate and something else" "chocolate" 112)
     (test-not-allergic? "allergic to something, but not chocolate" "chocolate" 80)
     (test-allergic?     "allergic to everything" "chocolate" 255)))

  (define pollen-suite
    (test-suite
     "testing for pollen allergy"

     (test-not-allergic? "not allergic to anything" "pollen" 0)
     (test-allergic?     "allergic only to pollen" "pollen" 64)
     (test-allergic?     "allergic to pollen and something else" "pollen" 224)
     (test-not-allergic? "allergic to something, but not pollen" "pollen" 160)
     (test-allergic?     "allergic to everything" "pollen" 255)))

  (define cats-suite
    (test-suite
     "testing for cats allergy"

     (test-not-allergic? "not allergic to anything" "cats" 0)
     (test-allergic?     "allergic only to cats" "cats" 128)
     (test-allergic?     "allergic to cats and something else" "cats" 192)
     (test-not-allergic? "allergic to something, but not cats" "cats" 64)
     (test-allergic?     "allergic to everything" "cats" 255)))

  (define lists-suite
    (test-suite
      "list when:"

      (lists-equiv? "no allergies"
                    (list-allergies 0)
                    '())

     (lists-equiv? "just eggs"
                   (list-allergies 1)
                   '("eggs"))

     (lists-equiv? "just peanuts"
                   (list-allergies 2)
                   '("peanuts"))

     (lists-equiv? "just strawberries"
                   (list-allergies 8)
                   '("strawberries"))

     (lists-equiv? "eggs and peanuts"
                   (list-allergies 3)
                   '("eggs" "peanuts"))

     (lists-equiv? "more than eggs but not peanuts"
                   (list-allergies 5)
                   '("eggs" "shellfish"))

     (lists-equiv? "lots of stuff"
                   (list-allergies 248)
                   '("strawberries" "tomatoes" "chocolate" "pollen" "cats"))

     (lists-equiv? "everything"
                   (list-allergies 255)
                   '("eggs" "peanuts" "shellfish" "strawberries" "tomatoes"
                     "chocolate" "pollen" "cats"))

     (lists-equiv? "non allergen score parts"
                   (list-allergies 509)
                   '("eggs" "shellfish" "strawberries" "tomatoes"
                     "chocolate" "pollen" "cats"))

     (test-case "no allergies means not allergic"
       (check-false (allergic-to? "peanuts" 0))
       (check-false (allergic-to? "cats" 0))
       (check-false (allergic-to? "strawberries" 0)))

     (test-true "is allergic to eggs"
                (allergic-to? "eggs" 1))

     (test-case "allergic to eggs in addition to other stuff"
       (check-true  (allergic-to? "eggs" 5))
       (check-true  (allergic-to? "shellfish" 5))
       (check-false (allergic-to? "strawberries" 5)))))

  (run-tests egg-suite)
  (run-tests peanuts-suite)
  (run-tests shellfish-suite)
  (run-tests strawberries-suite)
  (run-tests tomatoes-suite)
  (run-tests chocolate-suite)
  (run-tests pollen-suite)
  (run-tests cats-suite)
  (run-tests lists-suite))
