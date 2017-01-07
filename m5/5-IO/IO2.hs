module IO2 where

getLine' :: IO String
getLine' = do
    c <- getChar
    if c == '\n' then
        return []
    else do
        cs <- getLine'
        return (c:cs)

putStr' :: String -> IO ()
putStr' (x:xs) = putChar x >> putStr' xs
putStr' [] = return ()

