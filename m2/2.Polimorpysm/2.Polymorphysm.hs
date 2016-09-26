module Polymorphysm where

--  Миксфиксный стиль
tuple1 = (True, 3)
-- Префиксный стиль
tuple2 = (,) True 3

tuple3 = (1, True, 'c')
tuple4 = (,,) 1 True 'c'

dupl x = (x, x)

ff1 :: a -> (a,b) -> a -> (b,a,a)
ff1 el1 tuple el2 = (snd tuple, el1, el1)

ff2 :: a -> (a,b) -> a -> (b,a,a)
ff2 el1 tuple el2 = (snd tuple, el1, el2)