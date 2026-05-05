module SetV1
    (Set, emptyS, addS, belongs, sizeS, removeS, unionS, setToList)
    where
data Set a = S [a] Int
    {-
    INV. REP.: 
        En (S es n):
        * No pueden repetirse elementos dentro de es
        * La cantidad de elementos de es es igual a n
    -}


-- 2. Set (conjunto)

-- Un Set es un tipo abstracto de datos que consta de las siguientes operaciones:

emptyS :: Set a
-- Crea un conjunto vacío.
addS :: Eq a => a -> Set a -> Set a
-- Dados un elemento y un conjunto, agrega el elemento al conjunto.
belongs :: Eq a => a -> Set a -> Bool
-- Dados un elemento y un conjunto indica si el elemento pertenece al conjunto.
sizeS :: Eq a => Set a -> Int
-- Describe la cantidad de elementos distintos de un conjunto.
removeS :: Eq a => a -> Set a -> Set a
-- Borra un elemento del conjunto.
unionS :: Eq a => Set a -> Set a -> Set a
-- Dados dos conjuntos describe un conjunto con todos los elementos de ambos. conjuntos.
setToList :: Eq a => Set a -> [a]
-- Dado un conjunto describe una lista con todos los elementos distintos del conjunto.

    -- 2.1. Implementar la variante del tipo abstracto Set con una lista que no tiene repetidos y guarda la cantidad de elementos en la estructura.

    -- Nota: la restricción Eq aparece en toda la interfaz se utilice o no en todas las operaciones de esta implementación, pero para mantener una interfaz común entre distintas posibles implementaciones
    -- estamos obligados a escribir así los tipos.


emptyS = S [] 0
-- O(1)

addS x (S xs n) = if elem x xs
                  then S xs n
                  else S (x:xs) (n + 1)
-- O(n)

belongs x (S xs n) = n /= 0 && elem x xs
-- O(n)

sizeS (S _ n) = n
-- O(1)

removeS x (S xs n) = S (remove x xs) (n - unoSiCeroSiNo (elem x xs))
-- O(n)

unionS (S xs _) set = unionListaSet xs set
-- O(n^2)

setToList (S xs n) = xs
-- O(1)

remove :: Eq a => a -> [a] -> [a]
remove x []     = []
remove x (y:ys) = if x == y
                  then ys
                  else x : remove x ys
-- O(n)

unoSiCeroSiNo :: Bool -> Int
unoSiCeroSiNo True  = 1
unoSiCeroSiNo False = 0
-- O(1)

unionListaSet :: Eq a => [a] -> Set a -> Set a
unionListaSet []     set = set
unionListaSet (x:xs) set = unionListaSet xs (addNonS x set)
-- O(n^2)

addNonS :: Eq a => a -> Set a -> Set a
addNonS x (S xs n) = if elem x xs
                     then S xs n
                     else S (x:xs) (n + 1)
-- O(n)