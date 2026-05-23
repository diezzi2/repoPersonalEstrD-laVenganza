module StackV1
    (Stack, emptyS, isEmptyS, push, top, pop, lenS)
    where
data Stack a = Sk []
    {-
    INV. REP.: 
        En ():
        * eeeeeeeeeeeeequisdeeeeeeeeeeeeeee
    -}

-- 4. Stack (pila)

-- Una Stack es un tipo abstracto de datos de naturaleza LIFO (last in, first out). Esto significa que los últimos elementos agregados a la estructura son los primeros en salir (como en una pila deplatos).

-- Su interfaz es la siguiente:

emptyS :: Stack a
-- Describe una pila vacía.
isEmptyS :: Stack a -> Bool
-- Dada una pila indica si está vacía.
push :: a -> Stack a -> Stack a
-- Dados un elemento y una pila, describe el resultado de agregar el elemento a la pila.
top :: Stack a -> a
-- Dada un pila describe el elemento del tope de la pila.
pop :: Stack a -> Stack a
-- Dada una pila describe la pila sin el primer elemento.
lenS :: Stack a -> Int
-- Dada una pila describe la cantidad de elementos de la misma.
-- Costo: constante.

    -- 4.2. Implementar el tipo abstracto Stack utilizando una lista.


emptyS = Sk []
-- O(1)

isEmptyS (Sk []) = True
isEmptyS (Sk xs) = False
-- O(1)

push x (Sk xs) = Sk (x:xs)
-- O(1)

top (Sk (x:xs)) = x
-- O(1)

pop (Sk (x:xs)) = Sk xs
-- O(1)

lenS (Sk xs) = length xs
-- O(n)