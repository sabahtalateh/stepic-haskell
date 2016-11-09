module Scan2 where

import Data.List (scanl)

facs :: (Num a, Enum a) => [a]
facs = scanl (*) 1 [1..]

partialSums :: (Num a) => [a] -> [a]
partialSums = scanl (+) 0

--revertFacs = map (**(-1)) facs
xx = partialSums . map (**(-1)) $ facs

