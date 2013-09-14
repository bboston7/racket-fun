#!/usr/bin/racket
#lang racket

#|
A slow implementation of map

(my-map fn lst) -> list?
  fn  : Function to apply to each element of lst
  lst : list to apply fn to each element of
|#
(define (my-map fn lst)
  (if (null? lst)
    null
    (cons (fn (car lst)) (my-map (cdr lst)))))

#|
Tail recursive map

(my-map-tail fn lst preserve-order) -> list?
  fn : Function to apply to each element of lst
  lst : list to apply fn to each element of
  preserve-order : Whether or not to maintain relative ordering
|#
(define (my-map-tail fn lst [preserve-order #f])
  (define (mepper acc lst)
    (if (null? lst)
      acc
      (mepper (cons (fn (car lst)) acc) (cdr lst))))
  (define mapped (mepper null lst))
  (if preserve-order (reverse mapped) mapped))
