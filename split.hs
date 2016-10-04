import Data.List

split :: Eq a => a -> [a] -> [[a]]
split sep xs = case dropWhile (==sep) xs of
                 []  -> []
                 xs' -> x : split sep xs''
                     where (x, xs'') = break (==sep) xs'

main :: IO ()
main = putStr =<< (unlines . split ',' . intercalate "," . lines) <$> readFile "numbers.txt"
