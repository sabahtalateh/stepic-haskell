module ArrowMap where

import Prelude hiding (lookup)

class MapLike m where
    empty :: m k v
    lookup :: Ord k => k -> m k v -> Maybe v
    insert :: Ord k => k -> v -> m k v -> m k v
    delete :: Ord k => k -> m k v -> m k v
    fromList :: Ord k => [(k,v)] -> m k v

newtype ArrowMap k v = ArrowMap { getArrowMap :: k -> Maybe v }

instance MapLike ArrowMap where
    empty = ArrowMap (\n -> Nothing)
    lookup = undefined
    insert = undefined
    delete = undefined
    fromList = undefined


if1 = ArrowMap (\n -> if n == 1 then Just 1 else Nothing)

f1 = ArrowMap(\n -> Nothing)


empt = getArrowMap (empty) 3
