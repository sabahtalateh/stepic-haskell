module FirstClassFunctions where

functions = [(*2), (+5), (^2)]
-- functions :: [Integer -> Integer] - массив функций из Integer в Integer

-- $ - применение ф-ии - применить ф-ии к эл-там списка
values = zipWith ($) [(*2), (+5), (^2)] [1,2,3]


class Monoid a where
    mempty  :: a            -- нейтральный
    mappend :: a -> a -> a  -- операция

    mconcat :: [a] -> a
    mconcat = foldr mappend mempty

-- Эндоморизмы - ф-ии принимающие и возвращающие один и тот же тип
-- Можно делать композицию функций
newtype Endo a = Endo { appEndo :: a -> a }

instance Monoid (Endo a) where
    mempty = Endo id
    (Endo f) `mappend` (Endo g) = Endo (f . g)


plus5 = Endo (+2) `mappend` Endo (+3)

x1 = appEndo plus5 4


tralala = mconcat $ map Endo [(*2), (+5), (^2)]
x2 = appEndo tralala $ 4
