module Infinity where

-- Так как аргумент не используется то мы можем передать в const42 бесконечную функцию или например undefined

const42 :: a -> Int
const42 = const 42


-- Нестрогая ф-я: если передано расходящееся выр-е а результат сходящийся то ф-я нестрогая

foo a = a

bar = const foo

baz x = const True

quux = let x = x in x

corge = "Sorry, my value was changed"

grault x 0 = x
grault x y = x

garply = grault 'q'

waldo = foo





