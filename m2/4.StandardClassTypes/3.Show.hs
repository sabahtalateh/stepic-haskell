module Show where

-- есть метод show он чото пишет

-- есть метод read он читает но надо тип указывать

a = read "5" :: Int

-- а есть reads... вот так - возвращает возмоные варианты синтаксич. разбора
b = reads "5 rings" :: [(Int, String)]




ip = show a ++ show b ++ show c ++ show d where
    a = 12
    b = 7.22
    c = 4.12
    d = 0.12






