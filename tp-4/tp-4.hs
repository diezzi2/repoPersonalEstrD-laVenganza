-- 1. Pizzas

-- Tenemos los siguientes tipos de datos:

data Pizza = Prepizza
| Capa Ingrediente Pizza
    deriving Show

data Ingrediente = Salsa
| Queso
| Jamon
| Aceitunas Int
    deriving Show

-- Definir las siguientes funciones:


-- 1.1
cantidadDeCapas :: Pizza -> Int
-- Dada una pizza devuelve la cantidad de ingredientes



-- 1.2
armarPizza :: [Ingrediente] -> Pizza
-- Dada una lista de ingredientes construye una pizza



-- 1.3
sacarJamon :: Pizza -> Pizza
-- Le saca los ingredientes que sean jamón a la pizza



-- 1.4
tieneSoloSalsaYQueso :: Pizza -> Bool
-- Dice si una pizza tiene solamente salsa y queso (o sea, no tiene de otros ingredientes. En particular, la prepizza, al no tener ningún ingrediente, debería dar verdadero.)



-- 1.5
duplicarAceitunas :: Pizza -> Pizza
-- Recorre cada ingrediente y si es aceitunas duplica su cantidad



-- 1.6
cantCapasPorPizza :: [Pizza] -> [(Int, Pizza)]
-- Dada una lista de pizzas devuelve un par donde la primera componente es la cantidad de ingredientes de la pizza, y la respectiva pizza como segunda componente.



-- 2. Mapa de tesoros (con bifurcaciones)

-- Un mapa de tesoros es un árbol con bifurcaciones que terminan en cofres. Cada bifurcación y cada cofre tiene un objeto, que puede ser chatarra o un tesoro.

data Dir = Izq | Der
    deriving Show

data Objeto = Tesoro | Chatarra
    deriving Show

data Cofre = Cofre [Objeto]
    deriving Show

data Mapa = Fin Cofre
| Bifurcacion Cofre Mapa Mapa
    deriving Show

-- Definir las siguientes operaciones:


-- 2.1
hayTesoro :: Mapa -> Bool
-- Indica si hay un tesoro en alguna parte del mapa.



-- 2.2
hayTesoroEn :: [Dir] -> Mapa -> Bool
-- Indica si al final del camino hay un tesoro.
-- Nota: el final de un camino se representa con una lista vacía de direcciones.



-- 2.3
caminoAlTesoro :: Mapa -> [Dir]
-- Indica el camino al tesoro. Precondición: existe un tesoro y es único.



-- 2.4
caminoDeLaRamaMasLarga :: Mapa -> [Dir]
-- Indica el camino de la rama más larga.



-- 2.5
tesorosPorNivel :: Mapa -> [[Objeto]]
-- Devuelve los tesoros separados por nivel en el árbol.



-- 2.6
todosLosCaminos :: Mapa -> [[Dir]]
-- Devuelve todos lo caminos en el mapa.



-- 3. Nave Espacial

-- Modelaremos una Nave como un tipo algebraico, el cual nos permite construir una nave espacial, dividida en sectores, a los cuales podemos asignar tripulantes y componentes. 

-- La representación es la siguiente:

data Componente = LanzaTorpedos | Motor Int | Almacen [Barril]
    deriving Show

data Barril = Comida | Oxigeno | Torpedo | Combustible
    deriving Show

data Sector = S SectorId [Componente] [Tripulante]
    deriving Show

type SectorId = String
    deriving Show

type Tripulante = String
    deriving Show

data Tree a = EmptyT | NodeT a (Tree a) (Tree a)
    deriving Show

data Nave = N (Tree Sector)
    deriving Show

-- Implementar las siguientes funciones utilizando recursión estructural:


-- 3.1
sectores :: Nave -> [SectorId]
-- Propósito: Devuelve todos los sectores de la nave.



-- 3.2
poderDePropulsion :: Nave -> Int
-- Propósito: Devuelve la suma de poder de propulsión de todos los motores de la nave.
-- Nota: el poder de propulsión es el número que acompaña al constructor de motores.



-- 3.3
barriles :: Nave -> [Barril]
-- Propósito: Devuelve todos los barriles de la nave.



-- 3.4
agregarASector :: [Componente] -> SectorId -> Nave -> Nave
-- Propósito: Añade una lista de componentes a un sector de la nave.
-- Nota: ese sector puede no existir, en cuyo caso no añade componentes.



-- 3.5
asignarTripulanteA :: Tripulante -> [SectorId] -> Nave -> Nave
-- Propósito: Incorpora un tripulante a una lista de sectores de la nave.
-- Precondición: Todos los id de la lista existen en la nave.



-- 3.6
sectoresAsignados :: Tripulante -> Nave -> [SectorId]
-- Propósito: Devuelve los sectores en donde aparece un tripulante dado.



-- 3.7
tripulantes :: Nave -> [Tripulante]
-- Propósito: Devuelve la lista de tripulantes, sin elementos repetidos.



-- 4. Manada de lobos

-- Modelaremos una manada de lobos, como un tipo Manada, que es un simple registro compuesto de una estructura llamada Lobo, que representa una jerarquía entre estos animales.
-- Los diferentes casos de lobos que forman la jerarquía son los siguientes:

-- Los cazadores poseen nombre, una lista de especies de presas cazadas y 3 lobos a cargo.
-- Los exploradores poseen nombre, una lista de nombres de territorio explorado (nombres de bosques, ríos, etc.), y poseen 2 lobos a cargo.
-- Las crías poseen sólo un nombre y no poseen lobos a cargo.

-- La estructura es la siguiente:

type Presa = String -- nombre de presa
    deriving Show

type Territorio = String -- nombre de territorio
    deriving Show

type Nombre = String -- nombre de lobo
    deriving Show

data Lobo = Cazador Nombre [Presa] Lobo Lobo Lobo
| Explorador Nombre [Territorio] Lobo Lobo
| Cría Nombre
    deriving Show

data Manada = M Lobo
    deriving Show

    -- 4.1. Construir un valor de tipo Manada que posea 1 cazador, 2 exploradores y que el resto sean crías.

    -- Resolver las siguientes funciones utilizando recursión estructural sobre la estructura que corresponda en cada caso:


-- 4.1.2
-- buenaCaza :: Manada -> Bool
-- Propósito: dada una manada, indica si la cantidad de alimento cazado es mayor a la cantidad de crías.



-- 4.1.3
-- elAlfa :: Manada -> (Nombre, Int)
-- Propósito: dada una manada, devuelve el nombre del lobo con más presas cazadas, junto con su cantidad de presas.
-- Nota: se considera que los exploradores y crías tienen cero presas cazadas, y que podrían formar parte del resultado si es que no existen cazadores con más de cero presas.



-- 4.1.4
-- losQueExploraron :: Territorio -> Manada -> [Nombre]
-- Propósito: dado un territorio y una manada, devuelve los nombres de los exploradores que pasaron por dicho territorio.



-- 4.1.5
-- exploradoresPorTerritorio :: Manada -> [(Territorio, [Nombre])]
-- Propósito: dada una manada, denota la lista de los pares cuyo primer elemento es un territorio y cuyo segundo elemento es la lista de los nombres de los exploradores que exploraron dicho territorio. Los territorios no deben repetirse.



-- 4.1.6
-- cazadoresSuperioresDe :: Nombre -> Manada -> [Nombre]
-- Propósito: dado el nombre de un lobo y una manada, indica el nombre de todos los cazadores que tienen como subordinado al lobo dado (puede ser un subordinado directo, o el subordinado de un subordinado).
-- Precondición: hay un lobo con dicho nombre y es único.



-- Suponiendo la siguiente manada de ejemplo:

manadaEj =
Cazador "DienteFiloso" ["Búfalos", "Antílopes"]
(Cría "Hopito")
(Explorador "Incansable" ["Oeste hasta el río"]
(Cría "MechónGris")
(Cría "Rabito")
)
(Cazador "Garras" ["Antílopes", "Ciervos"]
(Explorador "Zarpado" ["Bosque este"]
(Cría "Osado")
(Cazador "Mandíbulas" ["Cerdos", "Pavos"]
(Cría "Desgreñado")
(Cría "Malcriado")
(Cazador "TrituraHuesos" ["Conejos"]
(Cría "Peludo")
(Cría "Largo")
(Cría "Menudo")
)
)
)
(Cría "Garrita")
(Cría "Manchas")
)

-- la función cazadoresSuperioresDe debería dar lo siguiente:

{-
cazadoresSuperioresDe "Mandíbulas" manadaEj = ["DienteFiloso", "Garras"]
cazadoresSuperioresDe "Rabito" manadaEj = ["DienteFiloso"]
cazadoresSuperioresDe "DienteFiloso" manadaEj = []
cazadoresSuperioresDe "Peludo" manadaEj =
["DienteFiloso", "Garras", "Mandíbulas", "TrituraHuesos"]
-}