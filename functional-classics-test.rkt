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
