(.) :: (b -> c) -> (a -> b) -> a -> c

(. (a -> b)) :: (b -> c) -> (a -> c)
type b = (e -> f)
(. (a -> (e -> f))) :: ((e -> f) -> c) -> (a -> c)

(. (a -> e -> f)) :: ((e -> f) -> c) -> a -> c
-- Doesn't look much useful.

((b -> c) .) :: (a -> b) -> (a -> c)
type c = (e -> f)
((b -> (e -> f)) .) :: (a -> b) -> (a -> (e -> f))

((b -> e -> f) .) :: (a -> b) -> a -> e -> f
-- Maybe could get some use.

-- Why practice these type signature expansion and reduction ?
-- I still have not properly integrated higher order function and currying.
-- I am also curious if a more general function than (.) could do the same work.
type e = (a -> b)
type f = (b -> c)
type g = (a -> c)
(?) :: f -> e -> g
type i = (e -> g)
(?) :: f -> i
