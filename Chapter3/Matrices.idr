import Data.Vect

createEmpties : Vect n (Vect 0 elem)
createEmpties = replicate _ []

transposeHelper : (x : Vect n elem) -> (xsTrans : Vect n (Vect len elem)) -> Vect n (Vect (S len) elem)
transposeHelper [] [] = []
transposeHelper (x :: xs) (y :: ys) = (x :: y) :: transposeHelper xs ys

transposeMat : Vect m (Vect n elem) -> Vect n (Vect m elem)
transposeMat [] = createEmpties
transposeMat (x :: xs) = let xsTrans = transposeMat xs in
--                          transposeHelper x xsTrans
                         zipWith (::) x xsTrans

addVect : Num elem => (x : Vect n elem) -> (y : Vect n elem) -> Vect n elem
addVect [] [] = []
addVect (x :: xs) (y :: ys) = y + x :: addVect xs ys


addMat : Num elem => Vect m (Vect n elem) -> Vect m (Vect n elem) -> Vect m (Vect n elem)
addMat [] [] = []
addMat (x :: xs) (y :: ys) = let addVect = addVect x y in
                             addVect :: addMat xs ys

addMatSimple : Num elem => Vect m (Vect n elem) -> Vect m (Vect n elem) -> Vect m (Vect n elem)
addMatSimple xs ys = zipWith (zipWith (+)) xs ys
