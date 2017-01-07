module Writer where

import Data.Monoid

{-
При вычислениях пишет что то в лог
реализуетс с помощью пары в одном из элементов которой
хранится лог а в другом хранится
Лог - любой моноид
-}


newtype Writer w a = Writer { runWriter :: (a, w) }

writer :: (a, w) -> Writer w a
writer = Writer

execWriter :: Writer w a -> w
execWriter m = snd (runWriter m)

ex1 = execWriter $ Writer ((1 + 2), "1 + 2")

instance (Monoid w) => Monad (Writer w) where
    return x = Writer (x, mempty)
    m >>= k =
        let (x, u) = runWriter m
            (y, v) = runWriter $ k x
        in Writer (y, u `mappend` v)

ex2 = runWriter (return 1 :: Writer String Int)

evalWriter :: Writer w a -> a
evalWriter m = fst (runWriter m)

tell :: (Monoid w) => w -> Writer w ()
tell w = writer ((), w)

calc :: (Int -> Int -> Int) -> Int -> Int -> Writer String Int
calc op arg1 arg2 = do
    let res = arg1 `op` arg2
    tell "start, "
    if abs res < 128 then do
        tell "no overflow"
        return res
    else do
        tell "overflow"
        return res

res1 = runWriter $ calc (+) 1 2
res2 = runWriter $ calc (*) 1000 9999
log1 = execWriter $ calc (*) 1000 9999

type Shopping = Writer (Sum Integer, [String]) ()

purchase :: String -> Integer -> Shopping
purchase item cost = Writer ((), (Sum cost, [item]))

total :: Shopping -> Integer
total m = getSum . fst . snd . runWriter $ m

items :: Shopping -> [String]
items m = snd . snd . runWriter $ m

shopping1 :: Shopping
shopping1 = do
  purchase "Jeans"   19200
  purchase "Water"     180
  purchase "Lettuce"   328


































