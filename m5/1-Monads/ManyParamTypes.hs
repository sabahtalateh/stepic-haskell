module ManyParamTypes where

import Prelude hiding (Functor, fmap)

class Functor f where
   fmap :: (a -> b) -> f a -> f b


-- функтор влияет на 1 тип, один из типов связываем и можно использовать функторы
instance Functor ((,) s) where
    fmap g (x, y) = (x, g y)
-- (a -> b) -> (s, a) -> (s, b)

instance Functor (Either e) where
    fmap _ (Left x)     = Left x
    fmap g (Right x)    = Right . g $ x


instance Functor ((->) e) where
    fmap = (.)
-- (a -> b) -> (e -> a) -> e -> b
t1 = fmap length tail "ABC"


data Entry  k1 k2 v  = Entry (k1, k2) v      deriving Show
data Map    k1 k2 v  = Map [Entry k1 k2 v]   deriving Show

e1 = Entry (1,2) 3
m1 = Map [Entry (1,1) 1, Entry (2,2) 2]

instance Functor (Map k1 k2) where
    fmap g (Map [])     = Map []
    fmap g (Map xs) = Map list where
        list = map (fmap g) xs

instance Functor (Entry k1 k2) where
    fmap g (Entry k v) = Entry k (g v)

f (Map (x:xs)) = Map xs

