module TypeClasses where

import Data.List


comparing :: (Ord a) => (b -> a) -> b -> b -> Ordering
comparing f x y = compare (f x) (f y)

sortByLength = sortBy (comparing length)
xx = sortByLength [[1,2,3],[4,5],[4,5,6,7]] 

main = do
    print xx