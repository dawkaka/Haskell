module Recursion where

fibonacci :: Int -> Int
fibonacci n = fibonacci' n 

fibonacci':: Int -> Int
fibonacci' 1  = 1
fibonacci' 2  = 1
fibonacci' n = fibonacci' (n - 1) + fibonacci' (n - 2)


repeatString :: String -> Int -> String
repeatString str n = repeatString' str "" n

repeatString' :: String -> String -> Int -> String
repeatString' _ accum 0 =  accum
repeatString' str accum n = repeatString' str (accum ++ str) (n - 1)


main = do 
  print(fibonacci 6)
  print(repeatString "A" 10)