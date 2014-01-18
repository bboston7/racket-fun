#lang racket

(define (get-evens file)
  (let ([fn (lambda (x) (even? (string->number x)))])
    (sequence->list
      (sequence-filter
        fn
        (in-lines (open-input-file (string->path file)))))))

(get-evens "nums.txt")
