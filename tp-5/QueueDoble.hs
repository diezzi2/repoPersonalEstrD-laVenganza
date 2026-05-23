module QueueV1
    (Queue, emptyQ, isEmptyQ, enqueue, firstQ, dequeue)
    where
data Queue a = Q [a]
    {-
    INV. REP.: 
        En (Q es):
        * eeeeeeeeeeeeequisdeeeeeeeeeeeeeee
    -}

-- 5. Queue con dos listas

-- Implemente la interfaz de Queue pero en lugar de una lista utilice dos listas. Esto permitirá que todas las operaciones sean constantes (aunque alguna/s de forma amortizada).

-- La estructura funciona de la siguiente manera:
-- Llamemos a una de las listas fs (front list) y a la otra bs (back list). 
-- La lista del frente tendrá los primeros elementos de la cola, en el orden de salida.
-- La lista del fondo tendrá los últimos elementos de la cola, en el orden de llegada.
-- Agregaremos en bs con orden constante, y quitaremos elementos de fs.
-- Todas las operaciones deben garantizar el siguiente invariante de representación: si fs se encuentra vacía, entonces la cola se encuentra vacía.
-- ¿Qué ventaja tiene esta representación de Queue con respecto a la que usa una sola lista?

-- Su interfaz es la siguiente:

emptyQ :: Queue a
-- Crea una cola vacía.
isEmptyQ :: Queue a -> Bool
-- Dada una cola indica si la cola está vacía.
enqueue :: a -> Queue a -> Queue a
-- Dados un elemento y una cola, agrega ese elemento a la cola.
firstQ :: Queue a -> a
-- Dada una cola describe el primer elemento de la cola.
dequeue :: Queue a -> Queue a
-- Dada una cola la describe sin su primer elemento.

    -- 3.2. Implemente ahora la versión que agrega por delante y quita por el final de la lista. Compare la eficiencia entre ambas implementaciones.
