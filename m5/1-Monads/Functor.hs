module Functor where

import Prelude hiding (Functor, fmap)

-- это как map только для параметризованного типа
-- Нужен kind * -> %
class Functor f where
   fmap :: (a -> b) -> f a -> f b

-- kind [] = * -> *
instance Functor [] where
    fmap = map

x1 = map succ [1,2,3]
x2 = fmap succ [1,2,3]
-- x1 = x2

instance Functor Maybe where
    fmap _ Nothing  = Nothing
    fmap f (Just a) = Just $ f a

x3 = fmap (*2) (Just 4)
x4 = fmap (*2) Nothing

data Point3D a = Point3D a a a deriving Show

instance Functor Point3D where
    fmap f (Point3D a b c) = Point3D (f a) (f b) (f c)

x5 = fmap (+3) (Point3D 1 2 3)

data GeomPrimitive a = Point (Point3D a) | LineSegment (Point3D a) (Point3D a) deriving Show

instance Functor GeomPrimitive where
    fmap f (Point p) = Point $ fmap f p
    fmap f (LineSegment a b) = LineSegment (fmap f a) (fmap f b)


