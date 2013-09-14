#!/usr/bin/racket
#lang racket

(require rackunit
         "anagram.rkt")

(define-test-suite anagram-tests
  (check-true (anagram? "abc" "abc") "Equal strings")
  (check-true (anagram? "" "") "Empty strings")
  (check-true (anagram? "acb" "abc") "anagram strings")
  (check-true (anagram? "abc" "cba") "reversed strings")
  (check-true (anagram? "a" "a") "Single character")
  (check-false (anagram? "abc" "acc") "Not anagrams")
  (check-false (anagram? "totally" "different") "totally different"))
  ;(fail "blah bleh"))

(define (all-pass? suite)
  (fold-test-results
    (lambda (result seed)
      (if (not (test-success? result))
        #f
        seed))
    #t
    suite))

(all-pass? anagram-tests)
