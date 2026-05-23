module MapV1
    (Map, emptyM, assocM, lookupM, deleteM, keys)
    where
data Map k v = M [(k, v)]
    {-
    INV. REP.: 
        En (M kvs):
        * No se repite ninguna k en kvs
    -}

-- 2. Map (diccionario)

    -- Ejercicio 2.3

-- Implemente las siguientes variantes del tipo Map, indicando los costos obtenidos para cada operación, justificando las respuestas:
-- 1. Como una lista de pares-clave valor sin claves repetidas

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


emptyM = M []
-- O(1)


assocM k v (M kvs) = M (assocMImplementador k v kvs)
-- O(kv)

assocMImplementador :: Eq k => k -> v -> [(k, v)] -> [(k, v)]
assocMImplementador k v []  = [(k, v)]
assocMImplementador k v kvs = if elem k (keysImplementador kvs)
                              then kvs
                              else (k, v):kvs
-- O(kv)

keysImplementador :: [(k, v)] -> [k]
keysImplementador []       = []
keysImplementador (kv:kvs) = primeroDePar kv : keysImplementador kvs
-- O(kv)

primeroDePar :: (k, v) -> k
primeroDePar (k, v) = k
-- O(1)


lookupM k (M kvs) = M (lookupMImplementador k kvs)
-- O(kv)

lookupMImplementador :: Eq k => k -> [(k, v)] -> Maybe v
lookupMImplementador k []       = Nothing
lookupMImplementador k (kv:kvs) = if k == (primeroDePar kv)
                                  then Just (segundoDePar kv)
                                  else lookupMImplementador k kvs
-- O(kv)

segundoDePar :: (k, v) -> v
segundoDePar (k, v) = v
-- O(1)


deleteM k (M kvs) = M (deleteMImplementador k kvs)
-- O(kv)

deleteMImplementador :: Eq k => k -> [(k, v)] -> [(k, v)]
deleteMImplementador k []       = []
deleteMImplementador k (kv:kvs) = if k == (primeroDePar kv)
                                  then kvs
                                  else kv : deleteMImplementador k kvs
-- O(kv)


keys (M kvs) = keysImplementador kvs
-- O(kv)