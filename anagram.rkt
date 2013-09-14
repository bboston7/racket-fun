#!/usr/bin/racket
#lang racket

(provide (all-defined-out))

#|
Takes two strings and determines whether or not they are anagrams of eachother

(anagram? s1 s2) -> bool?
  s1 : string?
  s2 : string?
|#
(define (anagram? s1 s2)
  (define (fix-string str)
    (sort (remove* (list #\space) (string->list str)) char>?))
  (equal? (fix-string s1) (fix-string s2)))
