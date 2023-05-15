module Main where

describe :: Int -> IO String
describe v = getLine

printList :: Show a => [a] -> IO ()
printList [] = return ()
printList (x : xs) = do
    print x
    printList xs

readAndSum :: Int -> IO Int
readAndSum 0 = return 0
readAndSum n = do
    i <- readLn
    s <- readAndSum $ n - 1
    return (i + s)

questionaire :: [String] -> IO [String]
questionaire [] = return []
questionaire (q : qs) = do
    putStrLn q
    res <- getLine
    sb <- questionaire qs
    return (res : sb)

main :: IO ()
main = do
    putStrLn "Enter something"
    v <- describe 2
    print $ "you wrote " <> v
    printList [2, 1, 2, 3, 1, 3]
    v <- readAndSum 4
    print v
    v <- questionaire ["How are you ?", "What is your name?", "How old are you?"]
    print v
    return ()