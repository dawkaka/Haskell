module Guards where

describe :: Int -> String
describe n   
          | n == 2 = "Two"
          | even n = "Even"
          | n > 100 = "BIG!!!"
          | n < 0 = "small"
          | otherwise = "Number is " ++ show n

-- Conbine guards with partten matching

guessAge :: String -> Int -> String
guessAge "Dawkaka" age 
                  | age < 10 = "Too low"
                  | age > 15 = "Too high"
                  | age == 13 = "Correct!"
                  | otherwise = "Close enougth"
guessAge name age = "Proabaly wrong, I don't know"

main = do
 print(describe 121) -- BIG!!!
 print(guessAge "Dawkaka" 5) -- Too low
 print(guessAge "Kon" 10) --Proabaly wrong, I don't know