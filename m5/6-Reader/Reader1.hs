module Reader1 where

{-
instance Functor ((->) e) where
    fmap g h = g . h

fmap    :: (a -> b) -> f a -> f b
        :: (a -> b) -> (e -> a) -> (e -> b)

Монада Reader позволяет читать из некоторого окружения всякое
((->) e) - это монада Reader мы параметрихуем её значением а e это окружение

instance Monad ((->) e) where
    return :: a -> (e -> a)
    return x = \_ -> x
             m a         a -> m b           m b
    (>>=) :: (e -> a) -> (a -> e -> b) -> (e -> b)
    m >>= k = \e -> k (m e) e

-}

ex1 = fmap (^2) length -- :t fmap (^2) length :: [a] -> Int - окружение - список

safeHead :: [a] -> Maybe a
safeHead = do
    -- функция обращена к окружению
    b <- null
    if b then
        return Nothing
    else do
        -- функция обращена к окружению
        h <- head
        return $ Just h

safeHead' = do
    -- вытащить окружение
    e <- id
    if null e then
        return Nothing
    else
        return $ Just $ head e

rrr = length >>= (\x -> return [x,x])

r = return 2 >>= (+) >>= (*) $ 4
r' = return 2 >>= (\x y -> x + y) >>= (\x y -> x * y) $ 4


-- return 2 = \_ -> 2
-- \_ -> 2 >>= (+) = (+2)
-- (+2) >>= (*)

