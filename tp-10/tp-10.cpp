#include <iostream>
#include "Persona.h"
#include "Pokemon.h"
#include "Entrenador.h"
using namespace std;



// 1. Registros

    // Ejercicio 1.1

    // Definir el tipo de dato Persona, como un puntero a un registro con el nombre y la edad de la persona.


struct PersonaSt {
    string nombre;
    int    edad;
};


    // Realizar las siguientes funciones:


// Próp.: Devuelve a una persona nueva, con el nombre y la edad dados
Persona consPersona(string nombre, int edad) {
    PersonaSt* punteroAPersona = new PersonaSt;
    punteroAPersona -> nombre = nombre;
    punteroAPersona -> edad = edad;
    return punteroAPersona;
}


// Próp.: Devuelve el nombre de una persona
string nombre(Persona p) {
    return p -> nombre;
}


// Próp.: Devuelve la edad de una persona
int edad(Persona p) {
    return p -> edad;
}


// Próp.: Aumenta en uno la edad de la persona.
void crecer(Persona p) {
    p -> edad = p -> edad + 1; 
}


// Próp.: Modifica el nombre una persona.
void cambioDeNombre(string nombre, Persona p) {
    p -> nombre = nombre;
}


// Próp.: Dadas dos personas indica si la primera es mayor que la segunda.
bool esMayorQueLaOtra(Persona p1, Persona p2) {
    return p1 -> edad > p2 -> edad;
}


// Próp.: Dadas dos personas devuelve a la persona que sea mayor.
Persona laQueEsMayor(Persona p1, Persona p2) {
    if (p1 -> edad > p2 -> edad) {
        return p1;
    }
    else {
        return p2;
    }
}


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

    // Una vez hecho eso, implementar la siguiente interfaz de Entrenador:

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
    
}


// 2. Array Lists

    // Ejercicio 2.1

    // Dada la siguiente representación de listas, llamada ArrayList:

struct ArrayListSt {
    int cantidad; // cantidad de elementos
    int* elementos; // array de elementos
    int capacidad; // tamaño del array
}

typedef ArrayListSt* ArrayList;

    // Definir la siguiente interfaz de este tipo de listas:


    // Próp.: Crea una lista con 0 elementos.
    // Nota: empezar el array list con capacidad 16.
ArrayList newArrayList()


// Próp.: Crea una lista con 0 elementos y una capacidad dada por parámetro.
ArrayList newArrayListWith(int capacidad)


// Próp.: Devuelve la cantidad de elementos existentes.
int lengthAL(ArrayList xs)


// Próp.: Devuelve el iésimo elemento de la lista.
int get(int i, ArrayList xs)


// Próp.: Reemplaza el iésimo elemento por otro dado.
void set(int i, int x, ArrayList xs)


// Próp.: Decrementa o aumenta la capacidad del array.
// Nota: en caso de decrementarla, se pierden los elementos del final de la lista.
void resize(int capacidad, ArrayList xs)


// Próp.: Agrega un elemento al final de la lista.
void add(int x, ArrayList xs)


// Próp.: Borra el último elemento de la lista.
void remove(ArrayList xs)


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