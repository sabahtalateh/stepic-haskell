module NotLazy where

{--
    seq - форсирует вычисление первого аргумента да WHNF
    seq :: a -> b -> b
    seq _\_ b = _\_ b       - _\_ - основания (расхоящееся вычисление)
    seq a b = b

    seq (undefined, undefined) 2 выполнится нормально
    seq (\x -> undefined) 2 тоже выполнится и вернёт 2
--}

foo 0 x = x
foo n x = let x' = foo (n - 1) (x + 1)
          in x' `seq` x'

bar 0 f = f
bar x f = let f' = \a -> f (x + a)
              x' = x - 1
          in f' `seq` x' `seq` bar x' f'

baz 0 (x, y) = x + y
baz n (x, y) = let x' = x + 1
                   y' = y - 1
                   p  = (x', y')
                   n' = n - 1
               in p `seq` n' `seq` baz n' p

quux 0 (x, y) = x + y
quux n (x, y) = let x' = x + 1
                    y' = y - 1
                    p  = (x', y')
                    n' = n - 1
                in x' `seq` y' `seq` n' `seq` quux n' p