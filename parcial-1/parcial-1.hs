-- Un árbol genealógico puede representarse de alguna forma mediantes tipos algebraicos.
-- En este ejercicio se desarrolla un tipo para expresar esta idea, y se pide definir algunas funciones que manipulan árboles genealógicos.
-- Los tipos que representan esta idea son los siguientes:

type Nombre = String

data EstadoCivil = SinPareja | EnMatrimonioCon Nombre | EnMatrimonioConPeroHijosCon Nombre Nombre
    deriving Show

data Persona = P Nombre EstadoCivil
    deriving Show

data GenTree =
          Hijos0 Persona
        | Hijos1 Persona GenTree
        | Hijos2 Persona GenTree GenTree
        | Hijos3 Persona GenTree GenTree GenTree
    deriving Show

-- Las personas se representan mediante un nombre y un estado civil.
-- El árbol genealógico expresa quiénes son todos los hijos de una persona específica, que a su vez indican sus propios árboles genealógicos;
-- los diferentes constructores expresan personas con diferente cantidad de hijos (siendo Hijos0 el caso de una persona sin hijos, etc.).

-- Para la resolución de los ejercicios, puede resultar útil usar las siguientes funciones:

elegirEntre :: Maybe a -> Maybe a -> Maybe a
elegirEntre (Just x) m = Just x
elegirEntre Nothing  m = m

elegirSi :: Bool -> Maybe a -> Maybe a -> Maybe a
elegirSi True  m1 m2 = m1
elegirSi False m1 m2 = m2

agregar_A_ :: a -> Maybe [a] -> Maybe [a]
agregar_A_ y Nothing   = Nothing
agregar_A_ y (Just xs) = Just (y : xs)

-- A modo de ejemplo, se representan (parcialmente) los árboles genealógicos de las familias Malfoy y Black.

brutus     = P "Brutus Malfoy II" (EnMatrimonioCon "Cierce Vyndon")
pollux     = P "Pollux Black" (EnMatrimonioCon "Irma Crabbe")
abraxas    = P "Abraxas Malfoy" (EnMatrimonioCon "(no identificada)")
walburga   = P "Walburga Black" (EnMatrimonioCon "Orion Black")
alphard    = P "Alphard Black" SinPareja
cygnus     = P "Cygnus Black III" (EnMatrimonioCon "Druella Rossier")
regulus    = P "Regulus Black" SinPareja
sirius     = P "Sirius Black" SinPareja
bellatrix  = P "Bellatrix Black" (EnMatrimonioConPeroHijosCon "Rodolphus Lestrange" "Tom Malvoro Riddle")
andromeda  = P "Andromeda Black" (EnMatrimonioCon "Edward Tonks")
narcissa   = P "Narcissa Black" (EnMatrimonioCon "Lucius Malfoy")
lucius     = P "Lucius Malfoy" (EnMatrimonioCon "Narcissa Black")
nymphadora = P "Nymphadora Tonks" (EnMatrimonioCon "Remus Lupin")
delphini   = P "Delphini" SinPareja
edward     = P "Edward Remus Lupin" SinPareja
draco      = P "Draco Malfoy" (EnMatrimonioCon "Astoria Greengrass")
scorpius   = P "Scorpius Malfoy" (EnMatrimonioCon "Lilly Potter")

fliaBlack = Hijos3 pollux
              (Hijos2 walburga (Hijos0 regulus) (Hijos0 sirius))
              (Hijos0 alphard)
              (Hijos3 cygnus
                 (Hijos1 bellatrix (Hijos0 delphini))
                 (Hijos1 andromeda (Hijos1 nymphadora (Hijos0 edward)))
                 (Hijos1 narcissa (Hijos1 draco (Hijos0 scorpius))))
               
fliaMalfoy = Hijos1 brutus
               (Hijos1 abraxas
                  (Hijos1 lucius (Hijos1 draco (Hijos0 scorpius))))


-- Ejercicio 1 (Preparación)
cabezaDeFamiliaDe :: GenTree -> Persona
-- Describe la persona que encabeza el árbol genealógico dado
cabezaDeFamiliaDe (Hijos0 p)             = p
cabezaDeFamiliaDe (Hijos1 p gt)          = p
cabezaDeFamiliaDe (Hijos2 p gt1 gt2)     = p
cabezaDeFamiliaDe (Hijos3 p gt1 gt2 gt3) = p


{-
EJEMPLOS:

cabezaDeFamiliaDe fliaBlack = P "Pollux Black" (EnMatrimonioCon "Irma Crabbe")
cabezaDeFamiliaDe fliaMalfoy = P "Brutus Malfoy II" (EnMatrimonioCon "Cierce Vyndon")
-}


-- Ejercicio 2 (Precalentamiento)
hijosDe_En_ :: Nombre -> GenTree -> Maybe [Persona]
-- Describe los hijos de la persona con nombre dado, o Nothing si ninguna persona del árbol tiene ese nombre.
-- Puede suponerse (sin verificar) que los nombres de las personas son únicos en el árbol dado.
hijosDe_En_ n (Hijos0 p)             = elegirSi (personaTieneNombre p n) (Just []) (Nothing)
hijosDe_En_ n (Hijos1 p gt)          = elegirSi (personaTieneNombre p n) (Just [cabezaDeFamiliaDe gt]) (hijosDe_En_ n gt)
hijosDe_En_ n (Hijos2 p gt1 gt2)     = elegirSi (personaTieneNombre p n) (Just [cabezaDeFamiliaDe gt1, cabezaDeFamiliaDe gt2]) (elegirEntre (hijosDe_En_ n gt1) (hijosDe_En_ n gt2))
hijosDe_En_ n (Hijos3 p gt1 gt2 gt3) = elegirSi (personaTieneNombre p n) (Just [cabezaDeFamiliaDe gt1, cabezaDeFamiliaDe gt2, cabezaDeFamiliaDe gt3]) (elegirEntre (hijosDe_En_ n gt1) (elegirEntre (hijosDe_En_ n gt2) (hijosDe_En_ n gt3)))

personaTieneNombre :: Persona -> Nombre -> Bool
personaTieneNombre (P n _) nx = n == nx


{-
EJEMPLOS:

hijosDe_En_ "Cygnus Black III" fliaBlack
   = Just [ P "Bellatrix Black" (EnMatrimonioConPeroHijosCon "Rodolphus Lestrange" "Tom Malvoro Riddle")
          , P "Andromeda Black" (EnMatrimonioCon "Edward Tonks")
          , P "Narcissa Black" (EnMatrimonioCon "Lucius Malfoy")
          ]

hijosDe_En_ "Sirius Black" fliaBlack = Just []

hijosDe_En_ "Abraxas Malfoy" fliaMalfoy
   = Just [ P "Lucius Malfoy" (EnMatrimonioCon "Narcissa Black") ]

hijosDe_En_ "Narcissa Black" fliaBlack
   = Just [ P "Draco Malfoy" (EnMatrimonioCon "Astoria Greengrass") ]

hijosDe_En_ "Narcissa Black" fliaMalfoy = Nothing

hijosDe_En_ "Draco Malfoy" fliaBlack
   = Just [ P "Scorpius Malfoy" (EnMatrimonioCon "Lilly Potter") ]

hijosDe_En_ "Draco Malfoy" fliaMalfoy
   = Just [ P "Scorpius Malfoy" (EnMatrimonioCon "Lilly Potter") ]

hijosDe_En_ "James Potter" fliaBlack = Nothing
-}


-- Ejercicio 3 (El interesante)
ancestrosDe_En_ :: Nombre -> GenTree -> [Persona]
-- Describe los ancestros de la persona con nombre dado, o falla con error si ninguna persona del árbol tiene ese nombre.
-- Puede suponerse (sin verificar) que los nombres de las personas son únicos en el árbol dado.
ancestrosDe_En_ n gt = case buscarAncestros n gt of
                       Just lista -> lista
                       Nothing    -> error "No pertenece a la familia"

buscarAncestros :: Nombre -> GenTree -> Maybe [Persona]
buscarAncestros n (Hijos0 p)             = elegirSi (personaTieneNombre p n) (Just []) Nothing
buscarAncestros n (Hijos1 p gt)          = elegirSi (personaTieneNombre p n) (Just []) (agregar_A_ p (buscarAncestros n gt))
buscarAncestros n (Hijos2 p gt1 gt2)     = elegirSi (personaTieneNombre p n) (Just []) (agregar_A_ p (elegirEntre (buscarAncestros n gt1) (buscarAncestros n gt2)))
buscarAncestros n (Hijos3 p gt1 gt2 gt3) = elegirSi (personaTieneNombre p n) (Just []) (agregar_A_ p (elegirEntre (buscarAncestros n gt1) (elegirEntre (buscarAncestros n gt2) (buscarAncestros n gt3))))


{-
EJEMPLOS:

ancestrosDe_En_ "Draco Malfoy" fliaBlack 
  = [ 
      P "Pollux Black" (EnMatrimonioCon "Irma Crabbe")
    , P "Cygnus Black III" (EnMatrimonioCon "Druella Rossier")
    , P "Narcissa Black" (EnMatrimonioCon "Lucius Malfoy")
    ]

ancestrosDe_En_ "Draco Malfoy" fliaMalfoy
  = [ 
      P "Brutus Malfoy II" (EnMatrimonioCon "Cierce Vyndon")
    , P "Abraxas Malfoy" (EnMatrimonioCon "(no identificada)")
    , P "Lucius Malfoy" (EnMatrimonioCon "Narcissa Black")
    ]

ancestrosDe_En_ "Pollux Black" fliaBlack = []

ancestrosDe_En_ "Harry Potter" fliaBlack = error "No pertenece a la familia"

ancestrosDe_En_ "Lucius Malfoy" fliaBlack = error "No pertenece a la familia"

ancestrosDe_En_ "Lucius Malfoy" fliaMalfoy
  = [
      P "Brutus Malfoy II" (EnMatrimonioCon "Cierce Vyndon")
    , P "Abraxas Malfoy" (EnMatrimonioCon "(no identificada)")
    ]
-}