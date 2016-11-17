module Lists where



twice :: a -> [a]
-- то же что twice :: a -> [] a
twice x = [x,x]


thrice :: a -> (,,) a a a
thrice a = (,,) a a a

-- Мы даже можем делать вот так
id' :: (->) a a
id' x = x

k :: (->) a ((->) b a)
k x y = x


-- data Maybe' a = Just a | Nothing
-- data Either' a b = Left a | Right b

l = Left "ABC"
r = Right True

roots :: Double -> Double -> Double -> Either [Char] (Double, Double)
roots a b c
    | discr >= 0    = Right (x1, x2)
    | otherwise     = Left "Error: discr < 0"
    where
        x1 = helper (-d)
        x2 = helper d
        helper x = (-b + x) / (2 * a)
        d = sqrt discr
        discr = b ^ 2 - 4 * a * c


