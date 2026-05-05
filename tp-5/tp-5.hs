-- 1. Cálculo de costos

-- Especificar el costo operacional de las siguientes funciones:


-- 1.1
head' :: [a] -> a
head' (x:xs) = x
-- O(1)


-- 1.2
sumar :: Int -> Int
sumar x = x + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1
-- O(1)


-- 1.3
factorial :: Int -> Int
factorial 0 = 1
factorial n = n * factorial (n-1)
-- O(n)


-- 1.4
longitud :: [a] -> Int
longitud []     = 0
longitud (x:xs) = 1 + longitud xs
-- O(n)


-- 1.5
factoriales :: [Int] -> [Int]
factoriales []     = []
factoriales (x:xs) = factorial x : factoriales xs
-- O(n)


-- 1.6
pertenece :: Eq a => a -> [a] -> Bool
pertenece n []     = False
pertenece n (x:xs) = n == x || pertenece n xs
-- O(n)


-- 1.7
sinRepetidos :: Eq a => [a] -> [a]
sinRepetidos []     = []
sinRepetidos (x:xs) = if pertenece x xs
                      then sinRepetidos xs
                      else x : sinRepetidos xs
-- O(n^2)


-- 1.8
append :: [a] -> [a] -> [a]
-- equivalente a (++)
append []     ys = ys
append (x:xs) ys = x : append xs ys
-- O(n)


-- 1.9
concatenar :: [String] -> String
concatenar []     = []
concatenar (x:xs) = x ++ concatenar xs
-- O(n)


-- 1.10
takeN :: Int -> [a] -> [a]
takeN 0 xs     = []
takeN n []     = []
takeN n (x:xs) = x : takeN (n-1) xs
-- O(n)


-- 1.11
dropN :: Int -> [a] -> [a]
dropN 0 xs     = xs
dropN n []     = []
dropN n (x:xs) = dropN (n-1) xs
-- O(n)


-- 1.12
partir :: Int -> [a] -> ([a], [a])
partir n xs = (takeN n xs, dropN n xs)
-- O(n)


-- 1.13
minimo :: Ord a => [a] -> a
minimo [x]    = x
minimo (x:xs) = min x (minimo xs)
-- O (n)


-- 1.14
sacar :: Eq a => a -> [a] -> [a]
sacar n []     = []
sacar n (x:xs) = if n == x
                 then xs
                 else x : sacar n xs
-- O(n)


-- 1.15
ordenar :: Ord a => [a] -> [a]
ordenar [] = []
orderar xs = let m = minimo xs in
             m : ordenar (sacar m xs)
-- O(n+m)


-- 2. Set (conjunto)

    -- 2.2. Como usuario del tipo abstracto Set implementar las siguientes funciones:

-- 2.2.1.
losQuePertenecen :: Eq a => [a] -> Set a -> [a]
-- Dados una lista y un conjunto, describe una lista con todos los elementos que pertenecen al conjunto.



-- 2.2.3.
sinRepetidos :: Eq a => [a] -> [a]
-- Quita todos los elementos repetidos de la lista dada utilizando un conjunto como estructura auxiliar.



-- 2.2.4.
unirTodos :: Eq a => Tree (Set a) -> Set a
-- Dado un arbol de conjuntos describe un conjunto con la union de todos los conjuntos del arbol.



    -- 2.3. Implementar la variante del tipo abstracto Set que posee una lista y admite repetidos. En otras palabras, al agregar no va a chequear que si el elemento ya se encuentra en la lista, pero
    -- sí debe comportarse como Set ante el usuario (quitando los elementos repetidos al pedirlos, por ejemplo). Contrastar la eficiencia obtenida en esta implementación con la anterior.


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


    -- 3.2. Implemente ahora la versión que agrega por delante y quita por el final de la lista. Compare la eficiencia entre ambas implementaciones.


    -- 3.3. Como usuario del tipo abstracto Queue implementar las siguientes funciones:

lengthQ :: Queue a -> Int
Cuenta la cantidad de elementos de la cola.
queueToList :: Queue a -> [a]
Dada una cola describe la lista con los mismos elementos, donde el orden de la lista es el de la cola.
Nota: chequear que los elementos queden en el orden correcto.
unionQ :: Queue a -> Queue a -> Queue a
Inserta todos los elementos de la segunda cola en la primera.


-- 4. Stack (pila)

-- Una Stack es un tipo abstracto de datos de naturaleza LIFO (last in, first out). Esto significa que los últimos elementos agregados a la estructura son los primeros en salir (como en una pila deplatos).

-- Su interfaz es la siguiente:

emptyS :: Stack a
Describe una pila vacía.
isEmptyS :: Stack a -> Bool
Dada una pila indica si está vacía.
push :: a -> Stack a -> Stack a
Dados un elemento y una pila, describe el resultado de agregar el elemento a la pila.
top :: Stack a -> a
Dada un pila describe el elemento del tope de la pila.
pop :: Stack a -> Stack a
Dada una pila describe la pila sin el primer elemento.
lenS :: Stack a -> Int
Dada una pila describe la cantidad de elementos de la misma.
Costo: constante.


    -- 4.1. Como usuario del tipo abstracto Stack implementar las siguientes funciones:

apilar :: [a] -> Stack a
Dada una lista describe una pila sin alterar el orden de los elementos.
desapilar :: Stack a -> [a]
Dada una pila describe una lista sin alterar el orden de los elementos.
insertarEnPos :: Int -> a -> Stack a -> Stack a
Dada una posicion válida en la stack y un elemento, ubica dicho elemento en dicha posición (se desapilan elementos hasta dicha posición y se inserta en ese lugar).


    -- 4.2. Implementar el tipo abstracto Stack utilizando una lista.

-- 5. Queue con dos listas

-- Implemente la interfaz de Queue pero en lugar de una lista utilice dos listas. Esto permitirá que todas las operaciones sean constantes (aunque alguna/s de forma amortizada).

-- La estructura funciona de la siguiente manera:
-- Llamemos a una de las listas fs (front list) y a la otra bs (back list). 
-- La lista del frente tendrá los primeros elementos de la cola, en el orden de salida.
-- La lista del fondo tendrá los últimos elementos de la cola, en el orden de llegada.
-- Agregaremos en bs con orden constante, y quitaremos elementos de fs.
-- Todas las operaciones deben garantizar el siguiente invariante de representación: si fs se encuentra vacía, entonces la cola se encuentra vacía.
-- ¿Qué ventaja tiene esta representación de Queue con respecto a la que usa una sola lista?