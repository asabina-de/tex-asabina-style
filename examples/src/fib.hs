{-
%
\(
  F^{(n)}_k := \begin{cases}
    0 & \mbox{if } 0 \leq k < n-1 \\
    1 & \mbox{if } k = n-1 \\
    \sum\limits_{i=k-n}^{(k-1)} F^{(n)}_i & \mbox{otherwise} \\
  \end{cases}
\)
%
 - Source: https://wiki.haskell.org/The_Fibonacci_sequence
 -}

fib 0 = 0
fib 1 = 1
fib n = fib (n-1) + fib (n-2)

something $ arg1 arg2
