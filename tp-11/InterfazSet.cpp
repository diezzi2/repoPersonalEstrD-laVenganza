#include <iostream>
using namespace std;
#include "HeaderSet.h"



// 2. Set

    // Ejercicio 2.1

    // Dada la siguiente representación de conjuntos:

struct NodoS {
    int elem; // valor del nodo
    NodoS* siguiente; // puntero al siguiente nodo
};

struct SetSt {
    int cantidad; // cantidad de elementos diferentes
    NodoS* primero; // puntero al primer nodo
};

// typedef SetSt* Set;

    // Definir la siguiente interfaz de este tipo de conjuntos, indicando el costo obtenido (intentar que sea lo más eficiente posible):


// Prop.: Crea un conjunto vacío.
Set emptyS() {
    SetSt* s = new SetSt;
    s -> cantidad = 0;
    s -> primero = NULL;
}


// Prop.: Indica si el conjunto está vacío.
bool isEmptyS(Set s) {
    return s -> cantidad == 0;
}


// Prop.: Indica si el elemento pertenece al conjunto.
bool belongsS(int x, Set s) {
    NodoS* nodoActual = s -> primero;
    while (nodoActual != NULL && nodoActual -> elem != x) {
        nodoActual = nodoActual -> siguiente;
    }
    return nodoActual -> elem == x;
}


// Prop.: Agrega un elemento al conjunto.
void AddS(int x, Set s) {
    if (!belongsImplementador(x, s)) {
        NodoS* nuevoNodo = new NodoS;
        nuevoNodo -> elem = x;
        nuevoNodo -> siguiente = s -> primero;
        s -> primero = nuevoNodo;
        s -> cantidad++;
    }
}

bool belongsImplementador(int x, Set s) {
    NodoS* nodoActual = s -> primero;
    while (nodoActual != NULL && nodoActual -> elem != x) {
        nodoActual = nodoActual -> siguiente;
    }
    return nodoActual -> elem == x;
}


// Prop.: Quita un elemento dado.
void RemoveS(int x, Set s) {
    NodoS* nodoActual = s -> primero;
    while (nodoActual != NULL && nodoActual -> elem != x) {
        nodoActual = nodoActual -> siguiente;
    }
    if (nodoActual -> elem == x) {
        delete nodoActual;
    }
}


// Prop.: Devuelve la cantidad de elementos.
int sizeS(Set s) {
    return s -> cantidad;
}


// Prop.: Devuelve una lista con los elementos del conjunto.
LinkedList setToList(Set s) {
    LinkedList nuevaLista = nil();
    NodoS* nodoActual = s -> primero;
    while (nodoActual != NULL) {
        Snoc(nodoActual -> elem, nuevaLista);
        nodoActual = nodoActual -> siguiente;
    }
    return nuevaLista;
}


// Prop.: Libera la memoria ocupada por el conjunto.
void DestroyS(Set s) {
    NodoS* nodoABorrar = s -> primero;
    // no entiendo por qué no debo cambiar nunca esta variable, como sabe que tiene que apuntar al siguiente nodo si no le digo?
    while (s -> primero != NULL) {
        s -> primero = s -> primero -> siguiente;
        delete nodoABorrar;
    }
    delete s;
}