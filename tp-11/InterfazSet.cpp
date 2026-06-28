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
Set emptyS()


// Prop.: Indica si el conjunto está vacío.
bool isEmptyS(Set s)


// Prop.: Indica si el elemento pertenece al conjunto.
bool belongsS(int x, Set s)


// Prop.: Agrega un elemento al conjunto.
void AddS(int x, Set s)


// Prop.: Quita un elemento dado.
void RemoveS(int x, Set s)


// Prop.: Devuelve la cantidad de elementos.
int sizeS(Set s)


// Prop.: Devuelve una lista con los lementos del conjunto.
LinkedList setToList(Set s)


// Prop.: Libera la memoria ocupada por el conjunto.
void DestroyS(Set s)