module LazyPatterns where

fromMaybe (Just x) = x
fromMaybe Nothing = error "!!!"

-- Всегда это
fromMaybe' ~(Just x) = x
--fromMaybe' Nothing = error "!!!" -- Сжда никогда не придём

(***) :: (a -> b) -> (c -> d) -> (a, c) -> (b, d)
(***) f g p = (f $ fst p, g $ snd p)

x0 = succ *** pred $ (5,  5)
x1 = const 1 *** const 2 $ (5, 5)
x2 = const 1 *** const 2 $ (undefined, undefined)
x3 = const 1 *** const 2 $ undefined

(****) :: (a -> b) -> (c -> d) -> (a, c) -> (b, d)
(****) f g (x, y) = (f x, g y)
xx0 = const 1 **** const 2 $ (5, 5)                 -- Работает
xx1 = const 1 **** const 2 $ (undefined, undefined) -- Работает
xx2 = const 1 **** const 2 $ undefined              -- Не работает


(*****) :: (a -> b) -> (c -> d) -> (a, c) -> (b, d)
(*****) f g ~(x, y) = (f x, g y)                        -- Ленивый образец, он не вычисляется, сопоставление с ним всегда удачно
xxx0 = const 1 ***** const 2 $ (5, 5)                   -- Работает
xxx1 = const 1 ***** const 2 $ (undefined, undefined)   -- Работает
xxx2 = const 1 ***** const 2 $ undefined                -- Теперь работает
