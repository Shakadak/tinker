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

(. repeat) . take   :: _
repeat              :: (z -> [z])
take                :: (Int -> [z] -> [z])
(.)                 :: (b -> c) -> (a -> b) -> (a -> c)

(_ .)               :: (a -> b) -> (a -> c) -- We do not know `a` as it is what relate `f` and `g` in `f . g`.
(. _)               :: (b -> c) -> (a -> c) -- But we have not applied both, and we can not relate something we know
(_ . _)             :: (a -> c)             -- with something we do not know.

(. repeat)          :: (. _)
a => z, b => [z]
(. repeat)          :: ([z] -> _) -> (z -> _)

take                :: (_)
a => Int, b => ([z] -> [z])

((. repeat) . take) :: (_ . _)
a => Int, b => ([z] -> [z]), b => ([z] -> _), c => (z -> _)
a => Int, b => ([z] -> [z]), c => (z -> [z])
((. repeat) . take) :: (Int -> (z -> [z]))
                    :: (Int -> z -> [z])
-- Still didn't read "Theorems for free!" but it looks like `replicate`.

-- Coming back to `((b -> e -> f) .) :: (a -> b) -> (a -> e -> f)`, I would think `take . repeat` is working too.
-- This assume I did not make a mistake at the begining.
-- Never mind. `Int` would be `b` on the left and `a` on the right.
-- Now, what would be the type of `((.) .)`.
(.)                 :: (_)
b => (b -> c), e => (a -> b), f => (a -> c)
((.) .)             :: (a -> b) -> (a -> e -> f)
                    :: (a -> (b' -> c')) -> (a -> (a' -> b') -> (a' -> c'))
                    :: (a -> b' -> c') -> a -> (a' -> b') -> a' -> c'
                    -- Removing all the apostrophes...
                    :: (a -> b -> c) -> a -> (e -> f) -> e -> c
-- And now I can see that `((b -> e -> f) .)` does not make sense as demonstrated with `(?)`.

(.')                :: (f -> g) -> (e -> f) -> (e -> g)
((.) .')            :: (_ .)                -- Remember, we do not know the `a`, or here `e`.
f => (b -> c), g => ((a -> b) -> (a -> c))
                    :: (e -> (b -> c)) -> (e -> ((a -> b) -> (a -> c)))
                    :: (e -> b -> c) -> e -> (a -> b) -> a -> c

-- Welp, it passes the type check on ghci. But I still can not picture a use case.

-- I think I am starting to get an idea about how it works.
-- Even if we can not define something like `(?)`, that does not mean we can not use `((.) .)` on something a bit more specialized.
(((.) .) take)      :: Int -> (a -> [z]) -> a -> [z]
-- Suddenly, it look much more *usable*. Although not specialised enough.

-- Looking back at the mention of free theorems and `replicate`, I understand it was wrong to jump to this conclusion.
-- It is replicate because I knew what was the body of the function.
-- But.
-- Without knowing the body of the function, I can only assume that I will get a list of the `z` that I passed in parameter.
-- It does not necessarily mean that the list's length is going to be equal to what I passed to the Int parameter.
