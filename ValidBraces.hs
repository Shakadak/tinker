module Braces where
import Data.List

validBraces :: String -> Bool
validBraces = null . foldl' go []
        where pairs = ["()", "[]", "{}"]
              go [] x = [x]
              go ac x = if [head ac, x] `elem` pairs then tail ac else x:ac
