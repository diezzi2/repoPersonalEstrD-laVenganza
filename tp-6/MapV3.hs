module MapV1
    (Map, emptyM, assocM, lookupM, deleteM, keys)
    where
data Map k v = M [k] [v]
    {-
    INV. REP.: 
        En (M ks vs):
        * Cada k de ks en una posicion i esta asociada a una v de vs en la misma posicion i
        * Cada v de vs en una posicion i esta asociada a una k de ks en la misma posicion i
        * La cantidad de elementos de ks y vs debe ser igual
    -}

-- 2. Map (diccionario)

    -- Ejercicio 2.3

-- Implemente las siguientes variantes del tipo Map, indicando los costos obtenidos para cada operación, justificando las respuestas:
-- 3. Como dos listas, una de claves y otra de valores, donde la clave ubicada en la posición i está asociada al valor en la misma posición, pero de la otra lista.

-- La interfaz del tipo abstracto Map es la siguiente:

emptyM :: Map k v
-- Propósito: devuelve un map vacío
assocM :: Eq k => k -> v -> Map k v -> Map k v
-- Propósito: agrega una asociación clave-valor al map.
lookupM :: Eq k => k -> Map k v -> Maybe v
-- Propósito: encuentra un valor dado una clave.
deleteM :: Eq k => k -> Map k v -> Map k v
-- Propósito: borra una asociación dada una clave.
keys :: Map k v -> [k]
-- Propósito: devuelve las claves del map.


emptyM = M [] []
-- O(1)


assocM k v (M ks vs) = M (k:ks) (v:vs)
-- O(1)


lookupM k (M ks vs) = lookupMImplementador k ks vs
-- O()

lookupMImplementador :: Eq k => k -> [k] -> [v] -> Maybe v
-- Con doble PM
lookupMImplementador kx []     _      = Nothing
lookupMImplementador kx (k:ks) (v:vs) = if kx == k
                                        then Just v
                                        else lookupMImplementador kx ks vs
-- O(k) -> Técnicamente ks y vs, por invariante, tienen la misma cantidad de elementos. ¿Podría escribir cualquiera de los dos?

{-
lookupMImplementador :: Eq k => k -> [k] -> [v] -> Maybe v
-- Sin doble PM
lookupMImplementador kx []     _  = Nothing
lookupMImplementador kx (k:ks) vs = if kx == k
                                    then Just (head vs)
                                    else lookupMImplementador kx ks (tail vs)
-- O(k)
-}


deleteM k (M ks vs) = 
-- O()

deleteMImplementador :: Eq k => k -> [k] -> [v] ->
deleteMImplementador kx []     _      =
deleteMImplementador kx (k:ks) (v:vs) = 