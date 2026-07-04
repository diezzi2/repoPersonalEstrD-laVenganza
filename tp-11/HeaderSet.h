#include <iostream>
using namespace std;
#include "HeaderLinkedList.h"



struct NodoS;

struct SetSt;

typedef SetSt* Set;

Set emptyS();
bool isEmptyS(Set s);
bool belongsS(int x, Set s);
void AddS(int x, Set s);
void RemoveS(int x, Set s);
int sizeS(Set s);
LinkedList setToList(Set s);
void DestroyS(Set s);