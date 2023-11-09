#include <iostream>
#include <fstream>
#include "rwstring.hpp"

using namespace std;

struct envio{
    string ciudad;
    int codigo;
    string producto;
    int cantidad;
    float monto;
};

template <typename T> struct Nodo {
	T dato; 
	Nodo<T>* sig;
};

int criterio_ciudad(envio a, envio b)
{
	if (a.ciudad == b.ciudad)
		return a.codigo.compare(b.codigo);
	else
		return a.producto > b.producto ? 1 : -1;
}

template <typename T> void mostrar(Nodo<T>* lista)
{
	while (lista != nullptr) {
		cout << lista->dato << endl;
		lista = lista->sig;
	}

}



int main() {
    
    return 0;
}