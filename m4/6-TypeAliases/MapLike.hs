module MapLike where

import Prelude hiding (lookup)
import qualified Data.List as L

class MapLike m where
    empty :: m k v
    lookup :: Ord k => k -> m k v -> Maybe v
    insert :: Ord k => k -> v -> m k v -> m k v
    delete :: Ord k => k -> m k v -> m k v
    fromList :: Ord k => [(k,v)] -> m k v
    fromList [] = empty
    fromList ((k,v):xs) = insert k v (fromList xs)

newtype ListMap k v = ListMap { getListMap :: [(k,v)] }
    deriving (Eq,Show)

instance MapLike ListMap where
    empty                       = ListMap []

    lookup key (ListMap((k, v):xs))
        | k == key              = Just v
        | otherwise             = lookup key (ListMap xs)
    lookup _ (ListMap[])        = Nothing

    insert k v xs'@(ListMap xs) =
        case finded of
            Nothing -> ListMap $ (k,v):xs
            Just _  -> ListMap $ (k,v):(getListMap $ delete k xs')
        where
            finded = lookup k xs'

    delete key (ListMap ((k, v):xs))
        | k == key = ListMap xs
        | otherwise = let
            (ListMap t) = delete key (ListMap xs)
        in ListMap ((k, v):t)
    delete key xs@(ListMap []) = xs


list = [(3,"a"),(1,"x"),(8,"q"),(6,"qwerty"),(7,"bar")]
ggg = ListMap list

emptyListMap = empty :: ListMap Int [Char]

