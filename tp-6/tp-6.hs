-- 1. Priority Queue (cola de prioridad)

    -- Ejercicio 1.2


heapSort :: Ord a => [a] -> [a]
-- Dada una lista la ordena de menor a mayor utilizando una Priority Queue como estructura auxiliar. ¿Cuál es su costo?
-- OBSERVACIÓN: el nombre heapSort se debe a una implementación particular de las Priority Queues basada en una estructura concreta llamada Heap,
-- que será trabajada en la siguiente práctica.



-- 2. Map (diccionario)

    -- Ejercicio 2.2

-- Implementar como usuario del tipo abstracto Map las siguientes funciones:


-- 2.2.1
valuesM :: Eq k => Map k v -> [Maybe v]
-- Propósito: obtiene los valores asociados a cada clave del map.



-- 2.2.2
todasAsociadas :: Eq k => [k] -> Map k v -> Bool
-- Propósito: indica si en el map se encuentran todas las claves dadas.



-- 2.2.3
listToMap :: Eq k => [(k, v)] -> Map k v
-- Propósito: convierte una lista de pares clave valor en un map.



-- 2.2.4
mapToList :: Eq k => Map k v -> [(k, v)]
-- Propósito: convierte un map en una lista de pares clave valor.



-- 2.2.5
agruparEq :: Eq k => [(k, v)] -> Map k [v]
-- Propósito: dada una lista de pares clave valor, agrupa los valores de los pares que compartan la misma clave.



-- 2.2.6
incrementar :: Eq k => [k] -> Map k Int -> Map k Int
-- Propósito: dada una lista de claves de tipo k y un map que va de k a Int, le suma uno a cada número asociado con dichas claves.


-- 2.2.7
mergeMaps:: Eq k => Map k v -> Map k v -> Map k v
-- Propósito: dado dos maps se agregan las claves y valores del primer map en el segundo. Si una clave del primero existe en el segundo, es reemplazada por la del primero.
-- Indicar los ordenes de complejidad en peor caso de cada función implementada, justificandolas respuestas.



    -- Ejercicio 2.4

-- Implemente estas otras funciones como usuario de Map:
-- Indicar los ordenes de complejidad en peor caso de cada función del usuario en base a la implementación elegida, justificando las respuestas.


-- 2.4.1
indexar :: [a] -> Map Int a
-- Propósito: dada una lista de elementos construye un map que relaciona cada elemento con su posición en la lista.



-- 2.4.2
ocurrencias :: String -> Map Char Int
-- Propósito: dado un string, devuelve un map donde las claves son los caracteres que aparecen en el string, y los valores la cantidad de veces que aparecen en el mismo.
