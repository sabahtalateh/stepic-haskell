module Fib where

fibStream :: [Integer]
fibStream = helper [0,1]
helper [a, b] = a : helper [b, a + b]

fibStream = 0 : 1 : zipWith (+) fibStream (tail fibStream)
{-
    take 3
    0 : 1 : zipWith (+) (0 : 1 : []) (1 : [])
    [0,1,1]

    take 4
    0 : 1 : zipWith (+) (0 : 1 : zipWith (+) (0 : 1 : [] ) (1 : [])) (1 : zipWith (+) (0 : 1 : [] ) (1 : []))
    [0,1,1,2]

    take 5
    0 : 1 : zipWith (+) (0 : 1 : zipWith (+) (0 : 1 : zipWith (+) (0 : 1 : [] ) (1 : [])) (1 : zipWith (+) (0 : 1 : [] ) (1 : []))) (1 : zipWith (+) (0 : 1 : zipWith (+) (0 : 1 : [] ) (1 : [])) (1 : zipWith (+) (0 : 1 : [] ) (1 : [])))
    [0,1,1,2,3]

    take 6
    0 : 1 : zipWith (+) (0 : 1 : zipWith (+) (0 : 1 : zipWith (+) (0 : 1 : zipWith (+) (0 : 1 : [] ) (1 : [])) (1 : zipWith (+) (0 : 1 : [] ) (1 : []))) (1 : zipWith (+) (0 : 1 : zipWith (+) (0 : 1 : [] ) (1 : [])) (1 : zipWith (+) (0 : 1 : [] ) (1 : [])))) (1 : zipWith (+) (0 : 1 : zipWith (+) (0 : 1 : zipWith (+) (0 : 1 : [] ) (1 : [])) (1 : zipWith (+) (0 : 1 : [] ) (1 : []))) (1 : zipWith (+) (0 : 1 : zipWith (+) (0 : 1 : [] ) (1 : [])) (1 : zipWith (+) (0 : 1 : [] ) (1 : []))))
    [0,1,1,2,3,5]
-}






