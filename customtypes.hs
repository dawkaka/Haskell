module CustomTypes where 

data Color = X | S | V

rgb :: Color -> [Int]
rgb X = [1, 0, 0]
rgb S = [0,1,0]
rgb V = [0,0,1]


data Describe a = Describe a String

getValue :: Describe a -> a 
getValue (Describe x _) = x 

getDescription :: Describe a -> String 
getDescription (Describe _ disc) = disc


-- recursive types
data Tree a = Node a (Tree a) (Tree a) | Empty 
        deriving Show
        
tree :: Tree Int
tree = (Node 5 (Node 2 (Node 1 Empty Empty) (Node 3 Empty (Node 4 Empty Empty)))
       (Node 7 (Node 6 Empty Empty) (Node 10 (Node 9 (Node 8 Empty Empty) Empty) Empty)))

lookUP :: Tree Int -> Int -> Tree Int
lookUP Empty _ = (Node (-10) Empty Empty)
lookUP (Node v left right) key
                            | v > key = lookUP left key
                            | v < key = lookUP right key
                            | otherwise = Node v left right


data ListInt = Emp | Item Int ListInt
               deriving Show

lis :: ListInt
lis = Item 1 (Item 2 (Item 3 (Item 4 (Item 5 Emp))))

sumListInt :: ListInt -> Int
sumListInt Emp = 0
sumListInt (Item v t) = v + sumListInt t
dk (x:xs)  = (x:xs) ++ [5,6]

-- record types nice!!
data Person = MakePerson {name :: String, state :: String, town :: String, age :: Int, profession :: String}
       deriving Show 

person = MakePerson {name = "Dawkaka", state = "Savannah", town = "Salaga", age = 24, profession = "Software Engineer"}

people :: [Person]
people = [MakePerson {name = "Dawkaka", state = "Savannah", town = "Salaga", age = 24, profession = "Software Engineer"}
          ,MakePerson {name = "Dawkaka", state = "Savannah", town = "Salaga", age = 26, profession = "Footballer"}
          ,MakePerson {name = "Dawkaka", state = "Savannah", town = "Salaga", age = 28, profession = "Teacher"}
          ,MakePerson {name = "Dawkaka", state = "Savannah", town = "Salaga", age = 30, profession = "Software Engineer"}]

filterByProfession :: String -> [Person] -> [Person]
filterByProfession p lis = filter (\x -> profession x == p) lis
 
main = do 
    print $ rgb V
    print $ getDescription (Describe 4 "an even number")
    print $ getDescription (Describe "Yellow" "A color")
    print tree
    print $ lookUP tree 10
    print $ sumListInt lis
    print $ filterByProfession "Software Engineer" people 
    print $ dk [1,2,3,4]jhyu
