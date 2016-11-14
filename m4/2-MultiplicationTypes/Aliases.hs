module Aliases where

import Data.Ratio

data Shape = Circle Double | Rectangle Double Double
    deriving Show


--  Такие функции нельзя сопоставлять с образцом
square :: Double -> Shape
square a = Rectangle a a

-- Рациональное цисло
xx = (2 % 3) * (3 % 2)


isSquare :: Shape -> Bool
isSquare (Rectangle a b)    = a == b
isSquare _                  = False



