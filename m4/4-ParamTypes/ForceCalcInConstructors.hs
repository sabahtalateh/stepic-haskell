module ForceCalcInConstructors where

import Data.Complex
import Data.Ratio

data CoordLazy a = CoordLazy a a deriving (Show)

-- Теперь значения будут вычисляться при создании обьекта
data CoordStrict a = CoordStrict !a !a deriving (Show)

getXLazy :: CoordLazy a -> a
getXLazy (CoordLazy x _) = x

getXStrict :: CoordStrict a -> a
getXStrict (CoordStrict x _) = x

cl = CoordLazy 3 undefined
cs = CoordStrict 3 undefined

-- Сработает
xl = getXLazy cl

-- Не сработает
xs = getXStrict cs

-- Комплексные числа
a = 2 :+ 5

-- Типы данных можно задавать в виде операторов
-- Инфиксные констрыкторы долны начинаться с двоеточий
c = 1 `CoordStrict` 2
d = 2 :+ 5


data Coord a = Coord a !a

getX :: Coord a -> a
getX (Coord x _) = x

getY :: Coord a -> a
getY (Coord _ y) = y

