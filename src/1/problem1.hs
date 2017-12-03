calcSum :: [Integer] -> Integer
calcSum [] = 0
calcSum nlist = calcSum' n1 (ns ++ [n1])
  where
    ([n1],ns) = splitAt 1 nlist

calcSum' :: Integer -> [Integer] -> Integer
--- Basecases first
calcSum' n1 [] = 0
calcSum' n1 (n2:ns)
  | n1 == n2   = n1 + calcSum' n2 ns
  | otherwise  = 0 + calcSum' n2 ns

main = do
  inputString <- readFile "./input.txt"
  let nl = init inputString
  let results = calcSum (map (read . (:"")) nl :: [Integer])
  print results
