module Bits where

data Bit    = Zero | One    deriving Show
data Sign   = Minus | Plus  deriving Show
data Z      = Z Sign [Bit]  deriving Show

xx = Z Minus [One, Zero, Zero]

--zToInteger :: Sign -> Integer
--zToInteger a = case a of
--    Minus -> (+1)
--    Plus ->  (+2)

zToInteger :: Z -> Integer
zToInteger (Z sign bits) =
    let
        getSign s = case s of
           Minus -> (* (-1))
           Plus -> (* 1)
    in
    (getSign sign) (bin2dec . map bitToInteger $ bits)

bitToInteger :: Bit -> Integer
bitToInteger Zero   = 0
bitToInteger One    = 1

integerToBit :: Integer -> Bit
integerToBit 0      = Zero
integerToBit 1      = One

bin2dec :: [Integer] -> Integer
bin2dec [] = 0
bin2dec xs = foldl1 ((+) . (* 2)) xs

from10to2 :: Integer -> [Integer]
from10to2 n =
    if n < 2 then [n]
    else (from10to2 (div n 2)) ++ [(mod n 2)]

add :: Z -> Z -> Z
add a b = Z sign num
    where
        sign    = if (sum < 0) then Minus else Plus
        num     = map integerToBit (from10to2 (abs (sum)))
        sum     = zToInteger a + zToInteger b

mul :: Z -> Z -> Z
mul a b = Z sign num
    where
        sign    = if (sum < 0) then Minus else Plus
        num     = map integerToBit (from10to2 (abs (sum)))
        sum     = zToInteger a * zToInteger b



--zToInteger a + zToInteger b

--add :: Z -> Z -> Z




--getSign :: Z -> Sign
--getSign a =

--add :: Z -> Z -> Z
--add a b = r where r = Z s n where (s, n) = ()
