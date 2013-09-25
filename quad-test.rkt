#!/usr/bin/racket
#lang racket

(require rackunit
         rackunit/text-ui
         "quad.rkt")

(define-test-suite
  eval-quad-tests
  (check-equal? (eval-quad 1 3 -4) '(1 . -4) "basic eval-quad test")
  (let ([res (eval-quad 2 -4 -3)])
    (check-= (car res) 2.58 0.01 "irrational x1")
    (check-= (cdr res) -0.58 0.01 "irrational x2")))

(run-tests eval-quad-tests)
