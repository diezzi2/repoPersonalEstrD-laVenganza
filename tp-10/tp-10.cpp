#include <iostream>
#include "HeaderPersona.h"
#include "HeaderPokemon.h"
#include "HeaderEntrenador.h"
using namespace std;



// 1. Registros

    // Ejercicio 1.1

    // Definir el tipo de dato Persona, como un puntero a un registro con el nombre y la edad de la persona.


    // Ejercicio 1.2

    // Modelaremos los tipos de datos Pokemon, como un TipoDePokemon (agua, fuego o planta, sinónimo de string) y un porcentaje de energía (que inicia en 100); y Entrenador, como un
    // nombre, una cantidad de pokémon y un array de pokémon.

    // Dicho esto, implementar lainterfaz de Pokemon

    // Una vez hecho eso, implementar interfaz de Entrenador


// 2. Array Lists

    // Ejercicio 2.1

    // Definir la interfaz de este tipo de listas:


    // Ejercicio 2.2

    // Definir las siguientes funciones utilizando la interfaz de ArrayList:


// 2.2.1
// Próp.: Devuelve la suma de todos los elementos.
int sumatoria(ArrayList xs)


// 2.2.2
// Próp.: Incrementa en uno todos los elementos.
void sucesores(ArrayList xs)


// 2.2.3
// Próp.: Indica si el elemento pertenece a la lista.
bool pertenece(int x, ArrayList xs)


// 2.2.4
// Próp.: Indica la cantidad de elementos iguales a x.
int apariciones(int x, ArrayList xs)


// 2.2.5
// Próp.: Crea una nueva lista a partir de la primera y la segunda (en ese orden).
ArrayList append(ArrayList xs, ArrayList ys)


// 2.2.6
// Próp.: Devuelve el elemento más chico de la lista.
int minimo(ArrayList xs)