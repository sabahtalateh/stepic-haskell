module Main where

import System.Directory
import Data.List
import System.IO

removeFilesList :: [FilePath] -> IO ()
removeFilesList (x:xs) = do
    removeFile x
    putStrLn $ "Removing file: " ++ x
    removeFilesList xs
removeFilesList [] = return ()

main :: IO ()
main = do
    putStr "Substring: "
    hFlush stdout
    x <- getLine
    if x == [] then
        putStrLn "Canceled"
    else do
        all <- getDirectoryContents "."
        let files = filter (isInfixOf x) all
        removeFilesList files

