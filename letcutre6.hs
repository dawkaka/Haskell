module LectureSix where 

data Color = Black | White

instance Eq Color where 
     Black == Black = True
     White == White = True 
     _     == _     = False

class Size a where
    size :: a -> Int
    string :: a -> String

instance Size Int where
     size a = abs a
     string b = show b

d = -5 :: Int

data IntPair = IntPair Int Int
 deriving Show 

instance Eq IntPair where 
     (==) (IntPair a1 a2) (IntPair b1 b2) = a1 == b1 && a2 == b2

-- derive 

data Person = Dead | Alive String Int 
 deriving (Show, Eq, Ord) -- instead of using instance ...

-- Constructors are orded in ascending order

main = do 
     print $ Black == White -- false 
     print $ Black == Black -- true
     print $ size d -- 5
     print $ string d -- "-5"
     print $ IntPair 1 2 == IntPair 3 4 -- False
     print $ IntPair 1 2 == IntPair 1 2 -- True

     print $ Dead < Alive "Bob" 35 -- True
     print $ Alive "Z" 1 > Alive "Y" 100000 -- True
     print $ Alive "Z" 1 > Alive "Z" 10   -- False

