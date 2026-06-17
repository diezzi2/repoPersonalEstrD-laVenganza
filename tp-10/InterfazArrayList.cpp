#include <iostream>
using namespace std;



// 2. Array Lists

    // Ejercicio 2.1

    // Dada la siguiente representación de listas, llamada ArrayList:

struct ArrayListSt {
    int cantidad; // cantidad de elementos
    int* elementos; // array de elementos
    int capacidad; // tamaño del array
};

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