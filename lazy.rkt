#lang lazy

(provide get-nth)

; Would be an infinite loop if this were not lazy!
(define (nat-lst x)
  (cons x (nat-lst (add1 x))))

(define (get-nth n)
  (define lst (nat-lst 0))
  (define (fn nats)
    (if (= n (car nats))
      (car nats)
      (fn (cdr nats))))
  (fn lst))
