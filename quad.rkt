#!/usr/bin/racket
#lang racket

(provide (all-defined-out))

(define (eval-quad a b c)
  (let* ([root (sqrt (- (sqr b) (* 4 a c)))]
         [denom (* 2 a)]
         [num (lambda (pom) (pom (- b) root))])
    (cons (/ (num +) denom) (/ (num -) denom))))

(define (get-coefs)
  (define (prompt text)
    (begin
      (display (string-append text "? "))
      (string->number (read-line))))
  (cons (prompt "a") (cons (prompt "b") (prompt "c"))))
