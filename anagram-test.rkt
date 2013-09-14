#!/usr/bin/racket
#lang racket

(require rackunit
         "anagram.rkt")

(check-true (anagram? ("abc" "abc")) "Equal strings")
(check-trye (anagram? ("" "")) "Empty strings")
(check-true (anagram? ("acb" "abc")) "anagram strings")
(check-true (anagram? ("abc" "cba")) "reversed strings")
(check-true (anagram? ("a" "a")) "Single character")
(check-false (anagram? ("abc" "acc")) "Not anagrams")
