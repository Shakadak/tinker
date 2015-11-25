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
-- I am also curious if a more general function than `(.)` could do the same work.
type e = (a -> b)
type f = (b -> c)
type g = (a -> c)
(?) :: f -> e -> g
type i = (e -> g)
(?) :: f -> i
-- I guess it may have something to do with some free theorem and proves impossible.
-- As in `(?)` does not know what `f` is, neither what `i` is. And so can not operate on them.

-- It seems for a function to be definable we need to have a way to relate between the type.
-- `f` and `i` being anything, we would need something that relate from anything to any other (or same) thing.
-- In other word, to define `(?)` we need to define `(?)`.
-- I need to read that Paul Wadler paper.
