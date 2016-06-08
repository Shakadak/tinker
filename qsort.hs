qsort [] = []
qsort (x:xs) = qsort lesser ++ [x] ++ qsort greater
    where (lesser, greater) = partition (< x) xs
