import Data.List.Split

calcDivSum :: [[Integer]] -> Integer
calcDivSum ls = sum $ map (findAndDiv) ls

findAndDiv :: [Integer] -> Integer
findAndDiv (x:xs)
  | minval == 0     = findAndDiv xs
  | otherwise       = maxval `div` minval
  where
    (maxval,minval) = findAndDiv' x xs

findAndDiv' :: Integer -> [Integer] -> (Integer,Integer)
findAndDiv' x []    = (x,0)
findAndDiv' x (y:ys)
  | x `mod` y == 0  = (x,y)
  | y `mod` x == 0  = (y,x)
  | otherwise       = findAndDiv' x ys


main = do
  inputString <- splitOn "\n" <$> init <$> readFile "./input.txt"
  let listOfLists = map (splitOn "\t") inputString

  print $ calcDivSum $ map (map (\x -> read x::Integer)) listOfLists
