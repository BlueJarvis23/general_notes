
-- Exercise 1


getOnes :: Integer -> [Integer]
getOnes n 
  | n < 0      = []
  | otherwise  = (mod n 10) : []

toDigits :: Integer -> [Integer]
toDigits n
  | otherwise   = toDigits ( n `div` 10 ) ++ getOnes n

--toDigitsRev :: Integer -> [Integer]
