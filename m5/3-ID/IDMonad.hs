module IDMonad where

newtype Identity a = Identity { runIdentity :: a }
    deriving (Eq, Show)

instance Monad Identity where
    return x = Identity x
    Identity x >>= k = k x

-- Определим нетривиальную стрелку клейсли
wrap'n'succ :: Integer -> Identity Integer
wrap'n'succ x = Identity (succ x)

ex1 = wrap'n'succ 22
ex2 = runIdentity ex1
ex3 = runIdentity $ wrap'n'succ 1 >>= wrap'n'succ

(&) = flip ($)

ex4 = runIdentity $  return 3 >>= wrap'n'succ >>= wrap'n'succ

data SomeType a = SomeType a

-- fmap     :: Functor f => (a -> b) -> f a -> f b
-- return   :: Monad   m => a -> m a
-- >>=      :: Monad   m => m a -> (a -> m b) -> m b

instance Functor Identity where
    fmap f x = x >>= return . f


-- Законы монад - первый
-- return a >>= k = k a
-- второй
-- m >>= return = m
-- третий - ассоциативность
-- (m >>= k) >>= k' = m >>= (\x -> k x >>= k') или
-- m >>= k >>= k' = m >>= \x -> k x >>= k'

ex5 = runIdentity $  (wrap'n'succ 3 >>= wrap'n'succ) >>= wrap'n'succ
ex6 = runIdentity $  wrap'n'succ 3 >>= (\x -> wrap'n'succ x >>= wrap'n'succ)
ex7 = runIdentity $  wrap'n'succ 3 >>= (\x -> wrap'n'succ x >>= (\y -> wrap'n'succ y))


goWrap0 =
    wrap'n'succ 3 >>=
    wrap'n'succ >>=
    wrap'n'succ >>=
    return

goWrap1 =
    wrap'n'succ 3 >>= (\x ->
    wrap'n'succ x >>= (\y ->
    wrap'n'succ y >>= (\z ->
    return z)))

goWrap2 =                       -- >>= - ;
    wrap'n'succ 3 >>= (\x ->    -- x := succ 3;
    wrap'n'succ x >>= (\y ->    -- y := succ x;
    wrap'n'succ y >>= (\z ->    -- z := succ y;
    return (x,y,z))))           -- return (x,y,z)

goWrap3 =
    wrap'n'succ 3 >>= \x ->
    wrap'n'succ x >>= \y ->
    wrap'n'succ y >>
    return (x+y)
























