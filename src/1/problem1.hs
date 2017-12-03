calcSum :: [Integer] -> Integer
calcSum [] = 0
calcSum nlist = calcSum' n1 n2 ns
  where
    [n1,n2] = take 2 nlist
    ns = (drop 2 nlist) ++ [n1]

calcSum' :: Integer -> Integer -> [Integer] -> Integer
--- Basecases first
calcSum' n1 n2 []
  | n1 == n2          = n1
  | otherwise         = 0
calcSum' n1 n2 (n3:ns)
  | n1 == n2          = n1 + calcSum' n2 n3 ns
  | otherwise         = 0 + calcSum' n2 n3 ns

main = do
  inputString <- readFile "./input.txt"
  let nl = init inputString
  let results = calcSum (map (read . (:"")) nl :: [Integer])
  print results
