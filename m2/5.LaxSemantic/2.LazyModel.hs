module LazyModel where

add7 :: Int -> Int -> Int
add7 x y = x + 7

{--
    Lazy is better

    add7 1 (25 ^ 589)
    1 + 7
    8

    Not Lazy
    add7 1 (25 ^ 589)
    add7 1 2435931703855809847165...
    1 + 7
    8
--}

dup :: Int -> (Int, Int)
dup x = (x, x)

{--
    Lazy

    dup (2 + 3)
    (2 + 3, 2 + 3)
    (2 + 3, 5)
    (5, 5)

    Not Lazy is better

    dup (2 + 3)
    dup 5
    (5, 5)

    Но есть спецальный указатель

    dup (2 + 3)
    (p, p)      p = 2 + 3
    (5, 5)
--}

bar x y z = x + y
foo a b = bar a a (a + b)

value = foo (3 * 10) (5 - 2)

value = bar p1 p1 (p1 + (5 - 2))  -- p1 = 3 * 10
value = p1 + p1
value = 60 + 60
value = 120














