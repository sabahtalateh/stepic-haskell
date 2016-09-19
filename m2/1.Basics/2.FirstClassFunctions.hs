module FirstClassFunctions where

import Data.Function

-- $ - функция высшего порядка


apply2 f x = f (f x)

-- flip f x y = f y x

sumSq a b = on (+) (^2) a b


--ms = (*) `on` snd

multSecond :: (a, Integer) -> (a, Integer) -> Integer
multSecond = on g h

g = (*)

h = snd