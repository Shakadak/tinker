module PIN where

getPINs :: String -> [String]
getPINs = traverse adjacent

-- lol
adjacent '0' = "08"
adjacent '1' = "124"
adjacent '2' = "2351"
adjacent '3' = "362"
adjacent '4' = "4157"
adjacent '5' = "52684"
adjacent '6' = "6395"
adjacent '7' = "748"
adjacent '8' = "85907"
adjacent '9' = "968"
