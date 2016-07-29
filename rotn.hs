import Data.Char

rotn :: Int -> Char -> Char
rotn n c = if nc > z then chr (a + nc - z - 1) else chr nc
    where z = ord 'z'
          a = ord 'a'
          nc = ord c + n
