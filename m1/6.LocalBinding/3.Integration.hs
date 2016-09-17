module Integration where

integration :: (Double -> Double) -> Double -> Double -> Double
integration f a b   | a > b     = (-1) * integration f b a
                    | a == b    = f a
                    | otherwise = helper f a ((b - a) / 1000) 0 1000 0


helper :: (Double -> Double) -> Double -> Double -> Integer -> Integer -> Double -> Double
helper f point interval count maxCount areas
                | count == (maxCount + 1) = areas
                | otherwise         = let
                    p1 = point
                    p2 = point + interval
                    area = trapeziaArea (f p1) (f p2) interval
                    nextPoint = (point + interval)
                    areasSum = (areas + area)
                    nextCount = count + 1

                    trapeziaArea :: Double -> Double -> Double -> Double
                    trapeziaArea a b h = (a + b) / 2 * h

                in helper f nextPoint interval nextCount maxCount areasSum





