(define (rle s)
  'YOUR-CODE-HERE
  (define (helper x num s)
    (if (null? s) (cons-stream `(,x ,num) nil)
      (if (= x (car s))
        (helper x (+ 1 num) (cdr-stream s))
        (cons-stream `(,x ,num) (helper (car s) '1 (cdr-stream s)))
      )
    )
  )

  (if (null? s) nil
    (helper (car s) '1 (cdr-stream s))
  )
)

'The solution below is not quite right. It can only handle the condition when s is finite.
'You may refer to this: https://github.com/PKUFlyingPig/CS61A/blob/master/hws/hw08/hw08.scm
(define (group-by-nondecreasing s)
    'YOUR-CODE-HERE
  (define (helper lst last s)
    (if (null? s) (cons-stream lst nil)
      (if (< (car s) last)
        (cons-stream lst (helper (cons-stream (car s) nil) (car s) (cdr-stream s)))
        (helper (append lst (cons-stream (car s) nil)) (car s) (cdr-stream s))
      )
    )
  )

  (if (null? s) nil
    (helper (cons-stream (car s) nil) (car s) (cdr-stream s))
  )
)


(define finite-test-stream
    (cons-stream 1
        (cons-stream 2
            (cons-stream 3
                (cons-stream 1
                    (cons-stream 2
                        (cons-stream 2
                            (cons-stream 1 nil))))))))

(define infinite-test-stream
    (cons-stream 1
        (cons-stream 2
            (cons-stream 2
                infinite-test-stream))))

