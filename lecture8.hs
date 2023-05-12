module Lecture8 where

greet :: IO ()
greet = do 
    putStrLn "What's your name"
    name <- getLine
    putStrLn ("Hello " ++ name)


main = do 
    greet