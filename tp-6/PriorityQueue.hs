module PriorityQueue
    (PriorityQueue, emptyPQ, isEmptyPQ, insertPQ, findMinPQ, deleteMinPQ)
    where
data PriorityQueue a = PQ [a]
    {-
    INV. REP.: 
        En (PQ es):
        * Los elementos de es están ordenados de menor (primero) a mayor (último)
    -}

-- 1. Priority Queue (cola de prioridad)

    -- Ejercicio 1.1

-- La siguiente interfaz representa colas de prioridad, llamadas priority queue, en inglés.
-- La misma posee operaciones para insertar elementos, y obtener y borrar el mínimo elemento de la estructura.
-- Implementarla usando listas, e indicando el costo de cada operación.

emptyPQ :: PriorityQueue a
-- Propósito: devuelve una priority queue vacía.
isEmptyPQ :: PriorityQueue a -> Bool
-- Propósito: indica si la priority queue está vacía.
insertPQ :: Ord a => a -> PriorityQueue a -> PriorityQueue a
-- Propósito: inserta un elemento en la priority queue.
findMinPQ :: Ord a => PriorityQueue a -> a
-- Propósito: devuelve el elemento más prioriotario (el mínimo) de la priority queue.
-- Precondición: parcial en caso de priority queue vacía.
deleteMinPQ :: Ord a => PriorityQueue a -> PriorityQueue a
-- Propósito: devuelve una priority queue sin el elemento más prioritario (el mínimo).
-- Precondición: parcial en caso de priority queue vacía.


emptyPQ = PQ []
-- O(1)


isEmptyPQ (PQ []) = True
isEmptyPQ (PQ xs) = False
-- O(1)


insertPQ x (PQ xs) = PQ (insertarEnListaOrdenada x xs)
-- O(n)

insertarEnListaOrdenada :: Ord a => a -> [a] -> [a]
insertarEnListaOrdenada x []     = [x]
insertarEnListaOrdenada x (y:ys) = if x < y
                                   then x : y : ys
                                   else y : insertarEnListaOrdenada x ys
-- O(n)


findMinPQ (PQ [])     = error "La priority queue esta vacia"
findMinPQ (PQ (x:xs)) = x
-- O(1)


deleteMinPQ (PQ [])     = error "La priority queue esta vacia"
deleteMinPQ (PQ (x:xs)) = PQ xs
-- O(1)