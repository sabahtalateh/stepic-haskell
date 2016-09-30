module RecursivePass where

--import Prelude hiding (length, (++), null)
--
--length :: [a] -> Integer
--length []       = 0
--length (_ : xs) = 1 + length xs
--
--(++) :: [a] -> [a] -> [a]
--[] ++ ys        = ys
--(x : xs) ++ ys  = x : xs ++ ys
--
--null :: [a] -> Bool
--null [] = True
--null _  = False

--oddsOnly :: Integral a => [a] -> [a]
--oddsOnly []         = []
--oddsOnly xs         = helper xs [] where
--    helper :: (Integral a) => [a] -> [a] -> [a]
--    helper (x : xs) acc     | odd x     = helper xs
--                            | otherwise = helper xs acc
--    helper [] acc           = acc

--

oddsOnly :: Integral a => [a] -> [a]
oddsOnly []         = []
oddsOnly (x : xs)   | odd x     = x : oddsOnly xs
                    | even x    = oddsOnly xs

-- [2,5,7,10,11]
{--
    2  ~>                   a = [5,7,10,11]
    5  ~> 5 ~>              a = [7,10,11]
    7  ~> 5 : 7 ~>          a = [10,11]
    10 ~> 5 : 7 ~>          a = [11]
    11 ~> 5 : 7 : 11 ~>     a = []
    [] ~> 5 : 7 : 11 : []
--}