#!/usr/bin/racket
#lang racket

(provide (all-defined-out))

#|
A slow implementation of map

(my-map fn lst) -> list?
  fn  : Function to apply to each element of lst
  lst : list to apply fn to each element of
|#
(define (my-map fn lst)
  (if (null? lst)
    null
    (cons (fn (car lst)) (my-map fn (cdr lst)))))

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

#|
Simple implementation of filter

(my-filter fn lst) -> list?
  fn  : procedure? to apply to each element of lst
  lst : list? to filter based on fn
|#
(define (my-filter fn lst)
  (cond
    [(null? lst) null]
    [(fn (car lst)) (cons (car lst) (my-filter fn (cdr lst)))]
    [else (my-filter fn (cdr lst))]))

#|
Tail recursive implementation of filter

(my-filter-tail fn lst [preserve-order #f]) -> list?
  fn             : procedure? to apply to each element of lst
  lst            : list? to filter based on fn
  preserve-order : boolean? whether or not to preserve the order of the list
|#
(define (my-filter-tail fn lst [preserve-order #f])
  (define (felter acc lst)
    (cond [(null? lst) acc]
          [(fn (car lst)) (felter (cons (car lst) acc) (cdr lst))]
          [else (felter acc (cdr lst))]))
  (define filtered (felter null lst))
  (if preserve-order (reverse filtered) (filtered)))

(define (remove-dupes lst)
  (cond
    [(null? lst) lst]
    [(null? (cdr lst)) lst]
    [(equal? (car lst) (cadr lst)) (remove-dupes (cdr lst))]
    [else (cons (car lst) (remove-dupes (cdr lst)))]))
