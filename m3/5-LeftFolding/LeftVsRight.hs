module LeftVsRight where

any' :: (a -> Bool) -> [a] -> Bool
any' p = foldr (\x s -> p x || s) False

-- сумма и произведение элементов списка
sum_n_prod = foldr (\x s@(sum, prod) -> (sum + x, prod * x)) (0,1) [1,2,3,4]


meanList :: [Double] -> Double
meanList = (\(sum, count) -> sum / count) . foldr (\x (sum, count) -> (sum + x, count + 1)) (0,0)



numberEl :: [a] -> [(Integer, a)]
numberEl = numberEl' 1
numberEl' _     [] = []
numberEl' n (x:xs) = (n, x) : numberEl' (n + 1) xs

evenOnly :: [a] -> [a]
evenOnly xs = foldr (\(i, x) s -> if i `mod` 2 == 0 then x : s else s) [] (numberEl xs)
