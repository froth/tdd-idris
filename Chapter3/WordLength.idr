allLengths : List String -> List Nat
allLengths [] = []
allLengths (x :: xs) = (length x) :: allLengths xs

maybeLength : Maybe String -> Nat
maybeLength Nothing = 0
maybeLength (Just x) = length x
