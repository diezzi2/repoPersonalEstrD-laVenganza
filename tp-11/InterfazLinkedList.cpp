#include <iostream>
using namespace std;
#include "HeaderLinkedList.h"



// 1. Linked List

    // Ejercicio 1.1

    // Dada la siguiente representación de listas, llamada LinkedList:

struct NodoL {
    int elem; // valor del nodo
    NodoL* siguiente; // puntero al siguiente nodo
};


// INV.REP.: cantidad indica la cantidad de nodos que se pueden recorrer desde primero por siguiente hasta alcanzar a NULL
struct LinkedListSt {
    int cantidad; // cantidad de elementos
    NodoL* primero; // puntero al primer nodo
};

// typedef LinkedListSt* LinkedList; // INV.REP.: el puntero NO es NULL

struct IteratorSt {
    NodoL* current;
};

// typedef IteratorSt* ListIterator; // INV.REP.: el puntero NO es NULL

    // Definir la siguiente interfaz de este tipo de listas, indicando el costo obtenido (intentar que sea lo más eficiente posible):


// Prop.: Crea una lista vacía.
LinkedList nil() {
    LinkedListSt* xs = new LinkedListSt;
    xs -> cantidad = 0;
    xs -> primero = NULL;
    return xs;
}


// Prop.: Indica si la lista está vacía.
bool isEmpty(LinkedList xs) {
    return xs -> cantidad == 0;
}


// Prop.: Devuelve el primer elemento.
int head(LinkedList xs) {
    return xs -> primero -> elem;
}


// Prop.: Agrega un elemento al principio de la lista.
void Cons(int x, LinkedList xs) {
    NodoL* nuevoNodo = new NodoL;
    nuevoNodo -> elem = x;
    nuevoNodo -> siguiente = xs -> primero;
    xs -> primero = nuevoNodo;
    xs -> cantidad++;
}


// Prop.: Quita el primer elemento.
void Tail(LinkedList xs) {
    if (xs -> cantidad > 0) {
        NodoL* nodoABorrar = xs -> primero;
        xs -> primero = xs -> primero -> siguiente;
        xs -> cantidad--;
        delete nodoABorrar;
    }
}


// Prop.: Devuelve la cantidad de elementos.
int length(LinkedList xs) {
    return xs -> cantidad;
}


// Prop.: Agrega un elemento al final de la lista.
void Snoc(int x, LinkedList xs) {
    NodoL* nuevoNodo = new NodoL;
    nuevoNodo -> elem = x;
    nuevoNodo -> siguiente = NULL;
    NodoL* nodoActual = xs -> primero;
    while (nodoActual != NULL) {
        nodoActual = nodoActual -> siguiente;
    }
    nodoActual -> siguiente = nuevoNodo;
}


// Prop.: Apunta el recorrido al primer elemento.
ListIterator getIterator(LinkedList xs) {
    IteratorSt* it = new IteratorSt;
    it -> current = xs -> primero;
    return it;
}


// Prop.: Devuelve el elemento actual en el recorrido.
int current(ListIterator ixs) {
    return ixs -> current -> elem;
}


// Prop.: Reemplaza el elemento actual por otro elemento.
void SetCurrent(int x, ListIterator ixs) {
    ixs -> current -> elem = x;
}


// Prop.: Pasa al siguiente elemento.
void Next(ListIterator ixs) {
    ixs -> current = ixs -> current -> siguiente;
}


// Prop.: Indica si el recorrido ha terminado.
bool atEnd(ListIterator ixs) {
    // return ixs -> current -> siguiente == NULL;
    // imagino que tendría que hacer esto si current no puede ser null, pasa que es muy down que current no pueda ser null!!! sobre todo cuando en los ejemplos que dan lo es!!!!! son todos downs!!!
    return ixs -> current == NULL;
}


// Prop.: Libera la memoria ocupada por el iterador.
void DisposeIterator(ListIterator ixs) {
    delete ixs -> current;
}


// Prop.: Libera la memoria ocupada por la lista.
void DestroyL(LinkedList xs) {
    // NodoL* nodoABorrar = xs -> primero -> siguiente;
    // while (xs -> primero != NULL) {
    //     delete xs -> primero;
    //     xs -> primero = nodoABorrar;
    //     nodoABorrar = xs -> primero -> siguiente;
    // }
    // delete xs;
    NodoL* nodoABorrar = xs -> primero;
    // no entiendo por qué no debo cambiar nunca esta variable, como sabe que tiene que apuntar al siguiente nodo si no le digo?
    while (xs -> primero != NULL) {
        xs -> primero = xs -> primero -> siguiente;
        delete nodoABorrar;
    }
    delete xs;
}


    // Ejercicio 1.3

    // Agregar la operación de Append a la interfaz de LinkedList, e implementarla como implementador en O(1).


// Prop.: Agrega todos los elementos de la segunda lista al final de los de la primera. La segunda lista se destruye.
void Append(LinkedList xs, LinkedList ys) {
    NodoL* nodoActual = xs -> primero;
    while (nodoActual != NULL) {
        nodoActual = nodoActual -> siguiente;
    }
    nodoActual -> siguiente = ys -> primero;
    delete ys;
}