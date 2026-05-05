module SetV2
    (Set, emptyS, addS, belongs, sizeS, removeS, unionS, setToList)
    where
data Set a = S [a]
    {-
    INV. REP.: 
        En (S es):
        * eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
    -}


-- 2. Set (conjunto)

emptyS :: Set a
Crea un conjunto vacío.
addS :: Eq a => a -> Set a -> Set a
Dados un elemento y un conjunto, agrega el elemento al conjunto.
belongs :: Eq a => a -> Set a -> Bool
Dados un elemento y un conjunto indica si el elemento pertenece al conjunto.
sizeS :: Eq a => Set a -> Int
Describe la cantidad de elementos distintos de un conjunto.
removeS :: Eq a => a -> Set a -> Set a
Borra un elemento del conjunto.
unionS :: Eq a => Set a -> Set a -> Set a
Dados dos conjuntos describe un conjunto con todos los elementos de ambos conjuntos.
setToList :: Eq a => Set a -> [a]
Dado un conjunto describe una lista con todos los elementos distintos del conjunto.

    -- 2.3. Implementar la variante del tipo abstracto Set que posee una lista y admite repetidos. En otras palabras, al agregar no va a chequear que si el elemento ya se encuentra en la lista, pero
    -- sí debe comportarse como Set ante el usuario (quitando los elementos repetidos al pedirlos, por ejemplo). Contrastar la eficiencia obtenida en esta implementación con la anterior.


emptyS = S []
-- O(1)

addS x (S xs) = S (x:xs)
-- O(1)

belongs x (S xs) = elem x xs
-- O(n)

sizeS (S xs) = length (sinRepetidos xs)
-- O

removeS x (S xs) = S (remove x xs)
-- O(n)

unionS (S xs) (S ys) = S (xs ++ ys)
-- O(n)

setToList (S xs) = sinRepetidos xs
-- O(n²)

sinRepetidos :: Eq a => [a] -> [a]
sinRepetidos []     = []
sinRepetidos (x:xs) = if elem x xs
                      then sinRepetidos xs
                      else x : sinRepetidos xs
-- O(n²)

remove :: Eq a => a -> [a] -> [a]
remove x []     = []
remove x (y:ys) = if x == y
                  then ys
                  else x : remove x ys
-- O(n)