module ArrowMap where

import Prelude hiding (lookup)

class MapLike m where
    empty :: m k v
    lookup :: Ord k => k -> m k v -> Maybe v
    insert :: Ord k => k -> v -> m k v -> m k v
    delete :: Ord k => k -> m k v -> m k v
    fromList :: Ord k => [(k,v)] -> m k v
    fromList [] = empty
    fromList ((k,v):xs) = insert k v (fromList xs)

newtype ArrowMap k v = ArrowMap { getArrowMap :: k -> Maybe v }

instance MapLike ArrowMap where
    empty = ArrowMap $ const Nothing
    lookup k (ArrowMap f) = f k
    insert k v (ArrowMap f) = ArrowMap (\k' -> if k == k' then Just v else f k')
    delete k (ArrowMap f) = ArrowMap (\k' -> if k == k' then Nothing else f k')


if1 = ArrowMap (\n -> if n == 1 then Just 1 else Nothing)

f1 = ArrowMap(\n -> Nothing)

empt = getArrowMap (empty) 3
lkp = lookup 2 if1

kv :: ArrowMap Int String
kv = insert 2 "Hello" empty
kv1 = insert 3 "Hello!!" kv
