import Data.List.Split

calcCheckSum :: [[Integer]] -> Integer
calcCheckSum ls = sum $ map (\l -> maximum l - minimum l) ls

main = do
  inputString <- splitOn "\n" <$> init <$> readFile "./input.txt"
  let listOfLists = map (splitOn "\t") inputString

  print $ calcCheckSum $ map (map (\x -> read x::Integer)) listOfLists
