#!/usr/bin/racket

#lang racket/base

(define MANY 1000000)

(define (shift-vec vec index)


(define (list-insert-front)
  (define lst (list))
  (define (fn itr)
    (if (= 0 itr)
      null
      (cons itr (fn (sub1 itr)))))
  (fn MANY))

(define (vector-insert-front)
  (define vec (make-vector MANY))
  (define (fn itr)



(displayln "list-insert-front")
(time (void (list-insert-front)))
