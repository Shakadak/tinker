import Data.List
 
onlyOddDigPrime :: Integer -> [Integer]
onlyOddDigPrime n = [toInteger $ length precedings, preceding, head followings]
    where preceding = if last precedings == n then last $ init precedings else last precedings
          (precedings, followings) = span (<= n) . filter oPrime $ primesST
          oPrime = not . any even . map (read . return) . show

primes = [n | n<-[2..], product [1..n-1] `rem` n == n-1] -- Wilson's theorem

primesST = 2 : oddprimes
    where
        oddprimes = sieve 3 9 oddprimes (inits oddprimes)  -- [],[3],[3,5],...
        sieve x q ~(_:t) (fs:ft) =
            filter ((`all` fs) . ((/=0).) . rem) [x,x+2..q-2]
            ++ sieve (q+2) (head t^2) t ft
