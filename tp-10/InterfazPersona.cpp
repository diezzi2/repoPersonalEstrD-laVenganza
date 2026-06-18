#include <iostream>
#include "HeaderPersona.h"
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