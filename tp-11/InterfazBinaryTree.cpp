#include <iostream>
using namespace std;
#include "HeaderBinaryTree.h"



// 4. Árboles binarios

    // Ejercicio 4.1

    // Dada esta definición para árboles binarios

struct NodeT {
    int elem;
    NodeT* left;
    NodeT* right;
};

// typedef NodeT* Tree;

    // Definir la siguiente interfaz:

Tree emptyT()


Tree nodeT(int elem, Tree left, Tree right)


bool isEmptyT(Tree t)


int rootT(Tree t)


Tree left(Tree t)


Tree right(Tree t)