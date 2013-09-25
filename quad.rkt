#!/usr/bin/racket
#lang racket

(provide (all-defined-out))

(struct quad (a b c) #:transparent)

(define (eval-quad coefs)
  (let* ([a (quad-a coefs)]
         [b (quad-b coefs)]
         [c (quad-c coefs)]
         [root (sqrt (- (sqr b) (* 4 a c)))]
         [denom (* 2 a)]
         [num (lambda (pom) (pom (- b) root))])
    (cons (/ (num -) denom) (/ (num +) denom))))

(define (get-coefs)
  (define (prompt text)
    (begin
      (display (string-append text "? "))
      (string->number (read-line))))
  (quad (prompt "a") (prompt "b") (prompt "c")))

(define (pretty-print roots)
  (display
    (string-append "The roots are " (number->string (car roots)) " and "
                   (number->string (cdr roots)) "\n")))

(pretty-print (eval-quad (get-coefs)))
