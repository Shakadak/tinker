(.) :: (b -> c) -> (a -> b) -> a -> c

(. (a -> b)) :: (b -> c) -> (a -> c)
type b = (e -> f)
(. (a -> (e -> f))) :: ((e -> f) -> c) -> (a -> c)

(. (a -> e -> f)) :: ((e -> f) -> c) -> a -> c
-- doesn't look much useful

((b -> c) .) :: (a -> b) -> (a -> c)
type c = (e -> f)
((b -> (e -> f)) .) :: (a -> b) -> (a -> (e -> f))

((b -> e -> f) .) :: (a -> b) -> a -> e -> f
-- maybe could get some use
