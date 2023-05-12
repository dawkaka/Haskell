module Lecture7 where 
    
import Data.Semigroup
import Data.List
import Data.Ord

data Money = Money Int
  deriving Show

renderMoney :: Money -> String
renderMoney (Money cents) = show (fromIntegral cents / 100)

(+!) :: Money -> Money -> Money
(Money a) +! (Money b) = Money (a+b)

scale :: Money -> Double -> Money
scale (Money a) x = Money (round (fromIntegral a * x))

addVat :: Money -> Money
addVat m = m +! scale m 0.24

m = Money 5



--- modelingw with cases


data Person = Person {name :: String, age :: Int}
   deriving Show 

data SortField = Name | Age 

data SortType = Ascending | Descending 

sortByField :: SortField -> [Person] -> [Person]
sortByField Name ps = sortBy  (comparing name) ps
sortByField Age ps = sortBy (comparing age) ps

sortPersons :: SortField -> SortType -> [Person] -> [Person]
sortPersons field Ascending ps = sortByField field ps
sortPersons field Descending ps = reverse $ sortByField field ps

ps = [Person {name ="yusiff", age = 10}
      ,Person {name ="zusiff", age = 10}
      ,Person {name ="kusiff", age = 12}
      ,Person {name ="nusiff", age = 16}
      ,Person {name ="ausiff", age = 11}
      ] :: [Person]

main = do 
    print $ renderMoney m

    print $ sortPersons Name Descending ps
    print $ sortPersons Age Ascending ps
    print $ Sum 3 <> Sum 4 <> Sum 5 -- monoids

    print $ foldMap Product [1::Int, 2,3]



