### General
- The flavor of [[Lisp (Programming Language)]] used in [[Structure and Interpretation of Computer Programs (SICP) (Book)]]
- You can run scheme programs on Dr.Racket

### Predicate
- In scheme there is a convention where predicates end in question mark `?`

```lisp
(define (good-enough? guess x)                                               │
  (< (abs (- (square guess) x)) 0.00001))
```

### Lists Operators
1. `(cons x y)`
2. `(car z)`
3. `(cdr z)`