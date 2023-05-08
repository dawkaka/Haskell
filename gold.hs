module Gold where

phi:: Double
phi = (sqrt 5 + 1)/2
poly :: Double -> Double
poly x = x^2 - x - 1
f x = poly (poly x)
main = do
 print (poly phi)
 print (f phi)
