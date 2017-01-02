module FunctorLaws where

--import Prelude hiding (Functor, fmap)

-- это как map только для параметризованного типа
-- Нужен kind * -> *
--class Functor f where
--   fmap :: (a -> b) -> f a -> f b

-- Такие законы
{-
(1) - fmap id = id                      - отображение id на контейнер не меняет его
(2) - fmap (f . g) = fmap f . fmap g    -
если это выполняется то fmap не меняет структуру контейнера
-}

-- (1)
ex1 = fmap id [1,2,3] == [1,2,3]

ex2 = fmap (+1) . fmap (^2) $ [1,2,3]

-- эффективнее так как не будет доп списка
ex3 = fmap ((+1) . (^2)) [1,2,3]

ex4 = ex3 == ex2

