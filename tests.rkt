#!/usr/bin/racket
#lang racket

(require rackunit/text-ui
         "anagram-test.rkt"
         "functional-classics-test.rkt")

(define suites (list
                 anagram-tests
                 my-map-tests
                 my-map-tail-tests
                 my-filter-tests))

(define (all-pass? suite)
  (= 0 (run-tests suite)))

(define passed (foldl
                 (lambda (v l) (and v l))
                 #t
                 (map all-pass? suites)))

(if passed
  (exit)
  (exit 1))
