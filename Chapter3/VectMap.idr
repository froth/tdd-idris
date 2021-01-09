import Data.Vect

vectMap : (input -> output) -> Vect size input -> Vect size output
vectMap f [] = []
vectMap f (x :: xs) = f x :: vectMap f xs
