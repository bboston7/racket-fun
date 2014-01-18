#lang racket

(require "lazy.rkt")

(define n (get-nth 10000))

(time (force n))
(time (force n))
