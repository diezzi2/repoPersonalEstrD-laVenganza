#include <iostream>
#include "HeaderPokemon.h"
using namespace std;


// 1. Registros

    // Ejercicio 1.2

    // Modelaremos los tipos de datos Pokemon, como un TipoDePokemon (agua, fuego o planta, sinónimo de string) y un porcentaje de energía (que inicia en 100); y Entrenador, como un
    // nombre, una cantidad de pokémon y un array de pokémon.

struct PokeSt {
    TipoDePokemon tipo;
    int vida;
};

    // Dicho esto, implementar la siguiente interfaz de Pokemon:


// Próp.: Dado un tipo devuelve un pokémon con 100 % de energía.
Pokemon consPokemon(TipoDePokemon tipo) {
    PokeSt* pk = new PokeSt;
    pk -> tipo = tipo;
    pk -> vida = 100;
}


// Próp.: Devuelve el tipo de un pokémon.
TipoDePokemon tipoDePokemon(Pokemon p) {
    return p -> tipo;
}


// Próp.: Devuelve el porcentaje de energía.
int energia(Pokemon p) {
    return p -> vida;
}


// Próp.: Le resta energía al pokémon.
void perderEnergia(int energia, Pokemon p) {
    p -> vida = p -> vida - energia;
}


// Nota: Agua supera a fuego, fuego a planta y planta a agua. Y cualquier otro caso es falso.
// Próp.: Dados dos pokémon indica si el primero, en base al tipo, es superior al segundo.
bool superaA(Pokemon p1, Pokemon p2) {
    TipoDePokemon p1tipo = p1 -> tipo;
    TipoDePokemon p2tipo = p2 -> tipo;
    if (p1tipo == "Agua" && p2tipo == "Fuego") {
        return true;
    } else if (p1tipo == "Fuego" && p2tipo == "Planta") {
        return true;
    } else if (p1tipo == "Planta" && p2tipo == "Agua") {
        return true;
    } else {
        return false;
    }
}