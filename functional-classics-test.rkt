#!/usr/bin/racket
#lang racket

(require rackunit
         rackunit/text-ui
         "functional-classics.rkt")

(define (map-tests impl)
  (define (incr x) (+ x 1))
  (check-equal? (impl incr (list 1 2 3 4)) (list 2 3 4 5) "Basic map test")
  (check-equal? (impl incr null) null "Empty list")
  (check-equal? (impl incr (list 1)) (list 2) "Single element list"))

(define/provide-test-suite my-map-tests (map-tests my-map))
(define/provide-test-suite my-map-tail-tests (map-tests (lambda (fn lst)
                                                  (my-map-tail fn lst #t))))

(define (filter-tests impl)
  (check-equal? (impl even? (list 1 2 3 4)) (list 2 4) "Basic filter test")
  (check-equal? (impl even? null) null "Empty list")
  (check-equal? (impl even? (list 1 3 5)) null "No matches")
  (check-equal? (impl even? (list 2)) (list 2) "Single element match")
  (check-equal? (impl even? (list 3)) null "Single element no match"))

(define/provide-test-suite my-filter-tests (filter-tests my-filter))
(define/provide-test-suite my-filter-tail-tests (filter-tests
                                                  (lambda (fn lst)
                                                    (my-filter-tail fn
                                                                    lst
                                                                    #t))))

(define/provide-test-suite
  remove-dupes-tests
  (check-equal? (remove-dupes (list 1 1 2 2 3 3 4 4)) (list 1 2 3 4) "Basic")
  (check-equal? (remove-dupes null) null "Empty list")
  (check-equal? (remove-dupes (list 1 1 1 1 1 1)) (list 1) "All equal")
  (check-equal? (remove-dupes (list 1 1 2 3 4)) (list 1 2 3 4)
                "First two equal")
  (check-equal? (remove-dupes (list 1 2 3 4 4)) (list 1 2 3 4)
                "Last two equal")
  (check-equal? (remove-dupes (list 1 2 3 4)) (list 1 2 3 4) "No dupes"))

(define/provide-test-suite
  my-foldr-tests
  (check-equal? (my-foldr cons null '(1 2 3 4)) '(1 2 3 4) "Basic")
  (check-equal? (my-foldr cons null null) null "Empty list test")
  (check-equal? (my-foldr cons '(1) '(1 2 3)) '(1 1 2 3) "Existing list test"))
