module Main where

import System.IO

main = do
    putStrLn "What is your name?"
    putStr "Name: "
    hFlush stdout
    name <- getLine
    if name == [] then
        main
    else
        putStrLn $ "Hi, " ++ name ++ "!"




