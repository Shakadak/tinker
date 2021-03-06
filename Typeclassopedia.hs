module Foo where

foldMap :: Monoid m => (a -> m) -> t a -> m
(.) :: (b -> c) -> (a -> b) -> (a -> c)

-- foldMap . foldMap :: ((a -> m) -> (t a -> m)) . ((a -> m) -> (t a -> m))
-- foldMap . foldMap :: ((a -> m) -> (t a -> m)) -> ((a -> m) -> (t a -> m)) -> {- (t a -> m) ~= (a -> m) -} ((a -> m) -> (t a-> m))
-- foldMap . foldMap :: ((a -> m) -> (t a -> m)) -> ((a -> m) -> (t a -> m)) -> ((a -> m) -> (t (t a) -> m))

toList = foldMap (:[])

f (Just a) = Left a
f Nothing  = Right ()

rewrite :: Maybe a -> ()
