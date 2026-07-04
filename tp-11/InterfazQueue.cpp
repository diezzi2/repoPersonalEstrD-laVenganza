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
Queue emptyQ() {
    QueueSt* q = new QueueSt;
    q -> cantidad = 0;
    q -> primero = NULL;
    q -> ultimo = NULL;
    return q;
}


// Prop.: Indica si la cola está vacía.
// Costo: O(1).
bool isEmptyQ(Queue q) {
    return q -> cantidad == 0;
}


// Prop.: Devuelve el primer elemento.
// Costo: O(1).
int firstQ(Queue q) {
    return q -> primero -> elem;
}


// Prop.: Agrega un elemento al final de la cola.
// Costo: O(1).
void Enqueue(int x, Queue q) {
    NodoQ* nuevoNodo = new NodoQ;
    nuevoNodo -> elem = x;
    nuevoNodo -> siguiente = NULL;
    if (q -> ultimo != NULL) {
        q -> ultimo -> siguiente = nuevoNodo;
        q -> ultimo = nuevoNodo;
    }
    else {
        q -> primero = nuevoNodo;
        q -> ultimo = nuevoNodo;
    }
    q -> cantidad++;
}


// Prop.: Quita el primer elemento de la cola.
// Costo: O(1).
void Dequeue(Queue q) {
    if (q -> primero != NULL) {
        NodoQ* segundoNodo = q -> primero -> siguiente;
        if (q -> primero != q -> ultimo) {
            delete q -> primero;
            q -> primero = segundoNodo;
        }
        else {
            delete q -> primero;
            q -> primero = NULL;
            q -> ultimo = NULL;
        }
        q -> cantidad = max(0, q -> cantidad - 1);
    }
}


// Prop.: Devuelve la cantidad de elementos de la cola.
// Costo: O(1).
int lengthQ(Queue q) {
    return q -> cantidad;
}


// Prop.: Anexa q2 al final de q1, liberando la memoria inservible de q2 en el proceso.
// Nota: Si bien se libera memoria de q2, no necesariamente la de sus nodos.
// Costo: O(1).
void MergeQ(Queue q1, Queue q2) {
    
}


// Prop.: Libera la memoria ocupada por la cola.
// Costo: O(n).
void DestroyQ(Queue q)