#include <iostream>
#include "arboles.hpp"


using namespace std;

struct Producto{
    string nombre;
    float precio;
};

int criterio (Producto a, Producto b){
    return a.nombre.compare(b.nombre);
}


int main (){

    NodoAr<Producto>* pp = nullptr;
    
    insertar({"fideos", 6.6}, pp, criterio);
    insertar({"arroz", 3.3}, pp, criterio);
    insertar({"conejo", 5.5}, pp, criterio);
    insertar({"aceite", 2.2}, pp, criterio);
    insertar({"papa", 10.1}, pp, criterio);
    insertar({"harina", 8.8}, pp, criterio);
    insertar({"pollo", 14.4}, pp, criterio);

    cout << "ingrese un producto: ";
    Producto prod;
    NodoAr<Producto>* aux;
    while (cin >> prod.nombre){
        aux = busqueda (prod, pp, criterio);
        if (aux == nullptr){
            cout << "Producto no encontrado" << endl;
        }
        else {
            cout << "Encontramos " << aux->dato.nombre << ": " << aux->dato.precio << endl;
        }

        cout << "\nIngrese otro producto: ";
    }

    return 0;
}