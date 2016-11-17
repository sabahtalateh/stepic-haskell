module Coords where

import Data.Fixed

--data CoordD = CoordD Double Double
--
--data CoordI = CoordI Int Int

data Coord a = Coord a a deriving (Show)

c = Coord (1::Int) (2::Int)
d = Coord (1::Double) (2::Double)

distance :: Coord Double -> Coord Double -> Double
distance (Coord x1 y1) (Coord x2 y2) = sqrt $ (x2 - x1) ^ 2 + (y2 - y1) ^ 2


manhDistance :: Coord Int -> Coord Int -> Int
manhDistance (Coord x1 y1) (Coord x2 y2) = len + height where
    len     = abs $ x2 - x1
    height  = abs $ y2 - y1

d1 = distance (Coord (1::Double) (1::Double)) (Coord (3::Double) (3::Double))
m1 = manhDistance (Coord (1::Int) (1::Int)) (Coord (1::Int) (15::Int))

getCenter :: Double -> Coord Int -> Coord Double
getCenter d (Coord x y) = Coord x' y' where
    x' = (fromIntegral x * d) + d / 2
    y' = (fromIntegral y * d) + d / 2


getCell :: Double -> Coord Double -> Coord Int
getCell d (Coord x y) = let
        calc x d = x `div'` d
        x' = calc x d
        y' = calc y d
    in Coord x' y'

center   = getCenter 0.7 (Coord 1 2)
center'  = getCenter 0.7 (Coord 0 0)
center'' = getCenter 0.7 (Coord (-2) (-5))

cell = getCell 1 (Coord 2.5 (-0.6))
cell' = getCell 1 (Coord 3 (-3))
cell'' = getCell 1 (Coord (-0.1) (1))


