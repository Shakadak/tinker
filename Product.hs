data Product e a = Product e a deriving Show

class Functor w => Comonad w where
    extract :: w a -> a
    extend  :: (w a -> b) -> w a -> w b
    extend f = fmap f . duplicate
    duplicate :: w a -> w (w a)
    duplicate = extend id

instance Functor (Product e) where
    fmap f (Product e a) = Product e (f a)

instance Comonad (Product e) where
    extract (Product _ a) = a
    extend f p@(Product e a) = Product e (f p)
