module QueueV1
    (Queue, emptyQ, isEmptyQ, enqueue, firstQ, dequeue)
    where
data Queue a = Q [a]
    {-
    INV. REP.: 
        En (Q es):
        * eeeeeeeeeeeeequisdeeeeeeeeeeeeeee
    -}

-- 3. Queue (cola)

-- Una Queue es un tipo abstracto de datos de naturaleza FIFO (first in, first out). Esto significa que los elementos salen en el orden con el que entraron, es decir, el que se agrega primero es el
-- primero en salir (como la cola de un banco). 

-- Su interfaz es la siguiente:

emptyQ :: Queue a
Crea una cola vacía.
isEmptyQ :: Queue a -> Bool
Dada una cola indica si la cola está vacía.
enqueue :: a -> Queue a -> Queue a
Dados un elemento y una cola, agrega ese elemento a la cola.
firstQ :: Queue a -> a
Dada una cola describe el primer elemento de la cola.
dequeue :: Queue a -> Queue a
Dada una cola la describe sin su primer elemento.

    -- 3.1. Implemente el tipo abstracto Queue utilizando listas. Los elementos deben encolarse por el final de la lista y desencolarse por delante.


emptyQ = Q []
-- O(1)

isEmptyQ (Q []) = True
isEmptyQ (Q xs) = False
-- O(1)

enqueue x (Q xs) = Q (xs ++ x)
-- O(n)

firstQ (Q xs) = head xs
-- O(1)

dequeue (Q xs) = Q (tail xs)
-- O(n)