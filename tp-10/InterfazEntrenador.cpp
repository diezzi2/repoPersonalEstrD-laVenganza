#include <iostream>
#include "Entrenador.h"
#include "Pokemon.h"
using namespace std;



// 1. Registros

    // Ejercicio 1.2

    // Modelaremos los tipos de datos Pokemon, como un TipoDePokemon (agua, fuego o planta, sinónimo de string) y un porcentaje de energía (que inicia en 100); y Entrenador, como un
    // nombre, una cantidad de pokémon y un array de pokémon.

    // Implementar la siguiente interfaz de Entrenador:

struct EntrenadorSt {
    string nombre;
    Pokemon* pokemon;
    int cantPokemon;
};

// Próp.: Dado un nombre, una cantidad de pokémon, y un array de pokémon de ese tamaño, devuelve un entrenador.
Entrenador consEntrenador(string nombre, int cantidad, Pokemon* pokemon) {
    EntrenadorSt* e = new EntrenadorSt;
    e -> nombre = nombre;
    e -> cantPokemon = cantidad;
    e -> pokemon = pokemon;
}


// Próp.: Devuelve el nombre del entrenador.
string nombreDeEntrenador(Entrenador e) {
    return e -> nombre;
}


// Próp.: Devuelve la cantidad de pokémon que posee el entrenador.
int cantidadDePokemon(Entrenador e) {
    return e -> cantPokemon;
}


// Próp.: Devuelve la cantidad de pokémon de determinado tipo que posee el entrenador.
int cantidadDePokemonDe(TipoDePokemon tipo, Entrenador e) {
    int cpx = 0;
    int cp = e -> cantPokemon;
    Pokemon* ps = e -> pokemon;
    for (int i = 0; i != cp; i++) {
        cpx = cpx + unoSiCeroSiNo(ps[i] -> tipo == tipo);
    }
    return cpx;
}

int unoSiCeroSiNo(bool b) {
    return (b) ? 1 : 0;
}


// Próp.: Devuelve el pokémon número i de los pokémon del entrenador.
// Precondición: existen al menos i − 1 pokémon.
Pokemon pokemonNro(int i, Entrenador e) {
    int j = 0;
    Pokemon* ps = e -> pokemon;
    while (j != i) {
        j++;
    }
    return ps[j];
}


// Próp.: Dados dos entrenadores, indica si, para cada pokémon del segundo entrenador, el primero posee al menos un pokémon que le gane.
bool leGanaATodos(Entrenador e1, Entrenador e2) {
    int cp2 = e2 -> cantPokemon;
    Pokemon* ps1 = e1 -> pokemon;
    Pokemon* ps2 = e2 -> pokemon;
    bool respuesta = true;
    for (int i = 0; i != cp2; i++) {
        respuesta = respuesta && pierde_ContraAlgunoDe_(ps2[i], e1);
    }
    return respuesta;
}

bool pierde_ContraAlgunoDe_(Pokemon p , Entrenador e) {
    bool respuesta = false;
    int cp = e -> cantPokemon;
    Pokemon* ps = e -> pokemon;
    for (int i = 0; i != cp; i++) {
        respuesta = respuesta || superaA(ps[i], p);
    }
    return respuesta;
}