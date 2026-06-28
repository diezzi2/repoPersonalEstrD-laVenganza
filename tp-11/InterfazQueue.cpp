#include <iostream>
using namespace std;
#include "HeaderQueue.h"



// 3. Queue

    // Ejercicio 3.1

    // Dada la siguiente representación de colas:

struct NodoQ {
    int elem; // valor del nodo
    NodoQ* siguiente; // puntero al siguiente nodo
};

struct QueueSt {
    int cantidad; // cantidad de elementos
    NodoQ* primero; // puntero al primer nodo
    NodoQ* ultimo; // puntero al ultimo nodo
};

// typedef QueueSt* Queue;

    // Definir la siguiente interfaz de este tipo de colas, respetando el costo de las operaciones:


// Prop.: Crea una cola vacía.
// Costo: O(1).
Queue emptyQ()


// Prop.: Indica si la cola está vacía.
// Costo: O(1).
bool isEmptyQ(Queue q)


// Prop.: Devuelve el primer elemento.
// Costo: O(1).
int firstQ(Queue q)


// Prop.: Agrega un elemento al final de la cola.
// Costo: O(1).
void Enqueue(int x, Queue q)


// Prop.: Quita el primer elemento de la cola.
// Costo: O(1).
void Dequeue(Queue q)


// Prop.: Devuelve la cantidad de elementos de la cola.
// Costo: O(1).
int lengthQ(Queue q)


// Prop.: Anexa q2 al final de q1, liberando la memoria inservible de q2 en el proceso.
// Nota: Si bien se libera memoria de q2, no necesariamente la de sus nodos.
// Costo: O(1).
void MergeQ(Queue q1, Queue q2)


// Prop.: Libera la memoria ocupada por la cola.
// Costo: O(n).
void DestroyQ(Queue q)