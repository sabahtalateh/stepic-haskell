module Monads where


data Log a = Log [String] a deriving Show

toLogger :: (a -> b) -> String -> (a -> Log b)
toLogger f s x = Log [s] (f x)

addone = toLogger (+1) "add one"

add1Log = toLogger (+1) "added one"
mult2Log = toLogger (* 2) "multiplied by 2"

execLoggers x f g = Log [fmsg, smsg] sres where
    Log [fmsg] fres = f x
    Log [smsg] sres = g fres



{-
class Monad m where
    return  :: a -> m a
    (>>=)   :: m a -> (a -> m b) -> m b -- bind

infixl 1 >>=
-}

ex1 = return True :: [] Bool
ex2 = return True :: Maybe Bool

-- стрелка Клейсли - упаковка функции в контейнер
toKleisli :: Monad m => (a -> b) -> (a -> m b)
toKleisli f = \x -> return (f x)

cc = toKleisli cos 0 :: [] Double
ccc = toKleisli cos 0 :: Maybe Double
cccc = toKleisli cos 0 :: IO Double

-- bind аналогичен операторам $ и & - & это $ с переставленными аргументами
-- f $ x = x & f

infixl 1 &
(&) :: a -> (a -> b) -> b
x & f = f x

exx1 = (+1) $ (*3) $ (+2) $ 5
exx2 = 5 & (+2) & (*3) & (+1)
-- exx1 == exx2 = True

-- bind это как & только с монадическим контейнером

bindLog :: Log a -> (a -> Log b) -> Log b
bindLog (Log msg x) f = Log (msg ++ [fmsg]) res where
    Log [fmsg] res = f x

returnLog :: a -> Log a
returnLog = (\x -> Log [] x)

ex10 = Log ["nothing done yet"] 3 `bindLog` add1Log `bindLog` mult2Log

instance Monad Log where
    return = returnLog
    (>>=) = bindLog

execLoggersList :: a -> [a -> Log a] -> Log a
execLoggersList x fs = foldl (>>=) (return x) fs

ex11 = execLoggersList 3 [add1Log, mult2Log, \x -> Log ["multiplied by 100"] (x * 100)]

{-
Ещё про монады

class Monad m where
    return  :: a -> m a
    (>>=)   :: m a -> (a -> m b) -> m b -- bind

    (>>)    :: m a -> m b -> m b -- облегченный связыватель
    x >> y = x >>= \_ -> y

    fail :: String -> m a
    fail s = error s
-}


(=<<) :: Monad m => (a -> m b) -> m a -> m b
(=<<) = flip (>>=)

-- композиция
(<=<) :: Monad m => (b -> m c) -> (a -> m b) -> a -> m c
(<=<) f g x = g x >>= f
















