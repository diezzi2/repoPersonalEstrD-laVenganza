#include <iostream>
using namespace std;
#include "HeaderBinaryTree.h"
#include "HeaderLinkedList.h"
#include "HeaderQueue.h"
#include "HeaderSet.h"



// 1. Linked List

    // Ejercicio 1.1

    // Dada la representación de listas LinkedList definir la interfaz de este tipo de listas, indicando el costo obtenido (intentar que sea lo más eficiente posible).


    // Ejercicio 1.2

    // Definir las siguientes funciones utilizando la interfaz de LinkedList, indicando costos:


// 1.2.1
// Prop.: Devuelve la suma de todos los elementos.
int sumatoria(LinkedList xs) {
    int total = 0;
    ListIterator ixs = getIterator(xs);
    while (!atEnd(ixs)) {
        total += current(ixs);
        Next(ixs);
    }
    DisposeIterator(ixs);
    return total;
}


// 1.2.2
// Prop.: Incrementa en uno todos los elementos.
void Sucesores(LinkedList xs) {
    ListIterator ixs = getIterator(xs);
    while (!atEnd(ixs)) {
        SetCurrent(current(ixs) + 1, ixs);
        Next(ixs);
    }
    DisposeIterator(ixs);
}


// 1.2.3
// Prop.: Indica si el elemento pertenece a la lista.
bool pertenece(int x, LinkedList xs)


// 1.2.4
// Prop.: Indica la cantidad de elementos iguales a x.
int apariciones(int x, LinkedList xs)


// 1.2.5
// Prop.: Devuelve el elemento más chico de la lista.
int minimo(LinkedList xs)


// 1.2.6
// Prop.: Dada una lista genera otra con los mismos elementos, en el mismo orden.
// Nota: notar que el costo mejoraría si Snoc fuese O(1), cómo podría serlo?
LinkedList copy(LinkedList xs)


// 1.2.7
// Prop.: Agrega todos los elementos de la segunda lista al final de los de la primera. La segunda lista se destruye.
// Nota: notar que el costo mejoraría si Snoc fuese O(1), cómo podría serlo?
void Append(LinkedList xs, LinkedList ys)


    // Ejercicio 1.3

    // Agregar la operación de Append a la interfaz de LinkedList, e implementarla como implementador en O(1).


// 2. Set

    // Ejercicio 2.1

    // Dada la representación de conjuntos Set definir la interfaz de este tipo de conjuntos, indicando el costo obtenido (intentar que sea lo más eficiente posible).


// 3. Queue

    // Ejercicio 3.1

    // Dada la representación de colas Queue definir la interfaz de este tipo de colas, respetando el costo de las operaciones.


// 4. Árboles binarios

    // Ejercicio 4.1

    // Dada la definición para árboles binarios BinaryTree definir su interfaz.


    // Ejercicio 4.2

    // Definir las siguientes funciones utilizando la interfaz de árbol y recursión:


// 4.2.1
// Prop.: Dado un árbol binario de enteros devuelve la suma entre sus elementos.
int sumarT(Tree t)


// 4.2.2
// Prop.: Dado un árbol binario devuelve su cantidad de elementos, es decir, el tamaño del árbol (size en inglés).
int sizeT(Tree t)


// 4.2.3
// Prop.: Dados un elemento y un árbol binario devuelve True si existe un elemento igual a ese en el árbol.
bool perteneceT(int e, Tree t)


// 4.2.4
// Prop.: Dados un elemento e y un árbol binario devuelve la cantidad de elementos del árbol que son iguales a e.
int aparicionesT(int e, Tree t)


// 4.2.5
// Prop.: Dado un árbol devuelve su altura.
int heightT(Tree t)


// 4.2.6
// Prop.: Dado un árbol devuelve una lista con todos sus elementos.
ArrayList toList(Tree t)


// 4.2.7
// Prop.: Dado un árbol devuelve los elementos que se encuentran en sus hojas.
ArrayList leaves(Tree t)


// 4.2.8
// Prop.: Dados un número n y un árbol devuelve una lista con los nodos de nivel n.
ArrayList levelN(int n, Tree t)


    // Ejercicio 4.3

    // Definir las funciones del punto anterior utilizando BFS (recorrido iterativo a lo ancho), a excepción de heightT, leaves y levelN. Para esto, utilizar una Queue de Tree


// 5. Heaps

    // Ejercicio 5.1

    // Implementar heaps binarias según el código de la teórica, y probarlas con ejemplos