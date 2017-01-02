module DONotation where

-- Чтоб в хаскеле писать как в императивном языке есть DO натоция
-- она там через монады работает

-- do { e1; e2 } = e1 >> e2

-- do {p <- e1; e2 } = e1 >>= \p -> e2 --  если p - образец и сопоставления с ним неудачно то вызывается fsil

-- {let v = e1; e2 } = let v = e1 in do e2

newtype Identity a = Identity { runIdentity :: a }
    deriving (Eq, Show)

instance Monad Identity where
    return x = Identity x
    Identity x >>= k = k x

-- Определим нетривиальную стрелку клейсли
wrap'n'succ :: Integer -> Identity Integer
wrap'n'succ x = Identity (succ x)

goWrap4 =
    let i = 3 in
    wrap'n'succ i >>= \x ->
    wrap'n'succ x >>= \y ->
    wrap'n'succ y >>
    return (i, x+y)

-- типы всех строк это монады Identity
-- вычисления происходят в одной монаде
goWrap5 = do
    let i = 3
    x <- wrap'n'succ i
    y <- wrap'n'succ x
    wrap'n'succ y
    return (i, x+y)



