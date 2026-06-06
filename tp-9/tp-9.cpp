// no se q hace esto pero creo q se necesita para el cout y eso, no se
#include <iostream>
using namespace std;



// Ejercicio 1

// Graficar la memoria resultante al ejecutar los siguientes programas, con foco en los cambios que se van realizando.


// 1.1.
/*
int main() {
    int x = 0;
    int y = 2;
    x = x+y;
}
*/


// 1.2.
/*
int main() {
    int x = 0;
    int y = 0;
    while(y < 5) {
        x += y;
        y++;
    }
}
*/


// 1.3.
/*
int main() {
    int y = 0;
    bool b = true;
    while(b) {
        y++;
        b = !b;
    }
}
*/


// Ejercicio 2

// Indicar el propósito de los siguientes procedimientos o funciones, dando algunos ejemplos de uso junto con su resultado.
// Considerar el consumo de memoria de cada programa, y si puede mejorarse.


// 2.1.
// Precondición: c1 < c2
// Propósito: Devuelve todos los enteros entre dos numeros dados (incluyéndolos)
// Ej.: printFromTo(1,5) -> 1,2,3,4,5,
// Consumo: dos frames? no sé. no sé ni qué es un for, no enseñan nada. son unos idiotas. estoy cansado y triste, quiero una vida normal con sentimientos normales, no quiero más ira tristeza y desesperanza. no tengo nada porque no soy capaz de darme nada.
void printFromTo(char c1, char c2) {
    for(int i = 0; c1 + i <= c2; i++) {
        cout << c1 + i << ", ";
    }
    cout << endl;
}


// 2.2.
// Precondición: n >= 0
// Propósito: es una pelotudez sin sentido chupenme todos la verguita
// Ej.: 
// Consumo: dos frames pq usa un while nomas
int fc(int n) {
    int x = 1;
    while(n > 0) {
        x = x * n;
        n--;
    }
    return x;
}


// 2.3.
// Precondición: n <= m
// Propósito: corte entiendo lo que hace pero es rarisimo y no se para que lo hace: suma el sucesor de n a n hasta encontrar un sucesor que valga lo mismo que m
// Ej.: ft(1,4) -> 10
// Consumo: consume m frames o algo asi pq es una recursion y aca no se hace qsyo habria q usar un while asi ocupas como dos frames creo
int ft(int n, int m) {
    if (n == m) {
        return n;
    }
    return n + ft(n+1, m);
}


// Ejercicio 3

// Dada la estructura de pares representada como struct en C++, definir las siguientes funciones sobre pares.
// Recordar probar las implementaciones en un procedimiento main.

struct Par {
    int x;
    int y;
};


// 3.1.
// Propósito: construye un par
Par consPar(int x, int y){
    struct Par p;
    p.x = x;
    p.y = y;
    return p;
}


// 3.2.
// Propósito: devuelve la primera componente
int fst(Par p){
    return p.x;
}


// 3.3.
// Propósito: devuelve la segunda componente
int snd(Par p){
    return p.y;
}


// 3.4.
// Propósito: devuelve la mayor componente
int maxDelPar(Par p){
    if (p.x > p.y) {
        return p.x;
    }
    return p.y;
}


// 3.5.
// Propósito: devuelve un par con las componentes intercambiadas
Par swap(Par p){
    struct Par ps;
    ps.x = p.x;
    ps.y = p.y;
    return ps;
}


// 3.6.
// Propósito: devuelve un par donde la primer componente
// es la división y la segunda el resto entre ambos números
Par divisionYResto(int n, int m){
    struct Par p;
    p.x = n / m;
    p.y = n % m;
    return p;
}


// Ejercicio 4

// Dar dos implementaciones para las siguientes funciones, una iterativa y otra recursiva, y utilizando la menor cantidad posible de variables.
// Recordar definir subtareas en caso de que sea estrictamente necesario.


// 4.1.
// Propósito: imprime n veces un string s.
void printN(int n, string s) {
    while (n > 0) {
        cout << s << endl;
        n--;
    }
}

void printNRecursive(int n, string s) {
    if (n > 0) {
        cout << s << endl;
        n--;
        printNRecursive(n, s);
    }
}


// 4.2.
// Propósito: imprime los números desde n hasta 0, separados por saltos de línea.
void cuentaRegresiva(int n) {
    while (n >= 0) {
        cout << n << endl;
        n--;
    }
}

void cuentaRegresivaRecursive(int n) {
    if (n >= 0) {
        cout << n << endl;
        n--;
        cuentaRegresivaRecursive(n);
    }
}


// 4.3.
// Propósito: imprime los números de 0 hasta n, separados por saltos de línea.
void desdeCeroHastaN(int n) {
    for (int i = 0; i <= n; i++) {
        cout << i << endl;
    }
}

void desdeCeroHastaNRecursive(int n) {
    int m = n - 1;
    if (n >= 0) {
        desdeCeroHastaNRecursive(m);
        cout << n << endl;
    }
}


// 4.4.
// Propósito: realiza la multiplicación entre dos números (sin utilizar la operación * de C++).
// int mult(int n, int m)//QUE CHUCHA HAGO CUANDO TENGO UN CERO O UN NUMERO NEGATIVO O DOS NUMEROS NEGATIVOS ES UN RE LABURO UNA BANDA DE IFS COMO SE HACE ESTO ALGUIEN ME QUIERE ENSEÑAR???   


// 4.5.
// Propósito: imprime los primeros n char del string s, separados por un salto de línea.
// Precondición: el string tiene al menos n char.
void primerosN(int n, string s) {
    for (int i = 0; i != n && n > 0; i++) {
        cout << s[i] << endl;
    }
}

void primerosNRecursive(int n, string s) {
    int m = n - 1;
    if (m >= 0) {
        primerosNRecursive(m, s);
        cout << s[m] << endl;
    }
}


// 4.6.
// Propósito: indica si un char c aparece en el string s.
bool pertenece(char c, string s) {
    bool b = false;
    for (int i = 0; c != s[i] || i <= s.length(); i++) {
        b = b || c == s[i];
    }
    // cout << b;
    return b;
}

// bool perteneceRecursive(char c, string s) creo que no se puede hacer sin sumar un tercer parametro que haga de indice


// 4.7.
// Propósito: devuelve la cantidad de apariciones de un char c en el string s.
int apariciones(char c, string s) {
    int resultado = 0;
    for (int i = 0; i <= s.length(); i++) {
        if (c == s[i]) {
            resultado++;
        }
    }
    cout << resultado;
    return resultado;
}

// int aparicionesRecursive(char c, string s) creo que no se puede hacer sin sumar un tercer parametro que haga de indice


// Ejercicio 5

// Dada la estructura de fracciones representada como struct en C++, definir las siguientes funciones sobre fracciones.
// Recordar probar las implementaciones en un procedimiento main.

struct Fraccion {
    int numerador;
    int denominador;
};


// Propósito: construye una fraccion
// Precondición: el denominador no es cero
Fraccion consFraccion(int numerador, int denominador) {
    struct Fraccion f;
    f.numerador = numerador;
    f.denominador = denominador;
    return f;
}


// Propósito: devuelve el numerador
int numerador(Fraccion f) {
    return f.numerador;
}


// Propósito: devuelve el denominador
int denominador(Fraccion f) {
    return f.denominador;
}


// Propósito: devuelve el resultado de hacer la división
float division(Fraccion f) {
    return f.numerador / f.denominador;
}


// Propósito: devuelve una fracción que resulta de multiplicar las fracciones
// (sin simplificar)
Fraccion multF(Fraccion f1, Fraccion f2) {
    struct Fraccion mf;
    mf.numerador = f1.numerador * f2.numerador;
    mf.denominador = f1.denominador * f2.denominador;
    return mf;
}


// Propósito: devuelve una fracción que resulta de simplificar la dada por parámetro
Fraccion simplificada(Fraccion p) {
    int maxDivisor = mcd(p.numerador, p.denominador);
    struct Fraccion fs;
    fs.numerador = p.numerador / maxDivisor;
    fs.denominador = p.denominador / maxDivisor;
    /*
    if (fs.denominador < 0) {
        fs.numerador = -fs.numerador;
        fs.denominador = -fs.denominador;
    }
    */
    return fs;
}

int mcd(int a, int b) { // no entiendo qué garcha es esto, supuestamente es un algoritmo euclideo pero por que garcha se supone que yo voy a saber como pija hacer esto
    // si son negativos los hago positivos
    if (a < 0) a = -a;
    if (b < 0) b = -b;
    // Base case: when b reaches 0, a is the greatest common divisor
    if (b == 0) {
        return a;
    }
    // Recursive step: pass 'b' and the remainder of 'a % b'
    return mcd(b, a % b);
}


// Propósito: devuelve la fracción resultante de sumar las fracciones
Fraccion sumF(Fraccion f1, Fraccion f2) {
    struct Fraccion fsum;
    fsum.numerador = f1.numerador * f2.denominador + f1.denominador * f2.numerador;
    fsum.denominador =  f1.denominador * f2.denominador;
    return fsum;
}