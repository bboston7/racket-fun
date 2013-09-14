#!/usr/bin/racket
#lang racket

(require rackunit
         rackunit/text-ui
         "anagram.rkt")

(define-test-suite anagram-tests
  (check-true (anagram? "abc" "abc") "Equal strings")
  (check-true (anagram? "" "") "Empty strings")
  (check-true (anagram? "acb" "abc") "anagram strings")
  (check-true (anagram? "abc" "cba") "reversed strings")
  (check-true (anagram? "a" "a") "Single character")
  (check-false (anagram? "abc" "acc") "Not anagrams")
  (check-false (anagram? "totally" "different") "totally different"))

(define (all-pass? suite)
  (= 0 (run-tests suite)))

(if (all-pass? anagram-tests)
  (exit)
  (exit 1))
