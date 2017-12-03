calcSum :: [Integer] -> Integer
calcSum [] = 0
calcSum xs = 2 * sum [a | (a,b) <- (zip as bs), a == b]
  where
    half = length xs `div` 2
    (as,bs) = splitAt half xs

main = do
  inputString <- readFile "./input.txt"
  let nl = init inputString
  let results = calcSum (map (read . (:"")) nl :: [Integer])
  print results
