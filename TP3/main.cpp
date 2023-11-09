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

int criterio_prod(envio a, envio b)
{
	if (a.producto == b.producto)
		return a.cantidad.compare(b.cantidad);
	else
		return a.producto > b.producto ? 1 : -1;
}
void ordenar(envio vec[], int dim, int (*criterio)(envio,envio)){

    int i, j;
	envio aux;

	for (i = 1 ; i < dim ; i++) {
		aux = vec[i];
		j = i - 1;

		while (j >= 0 && criterio(vec[j], aux) > 0) {
			vec[j + 1] = vec[j];
			j--;
		}
		vec[j + 1] = aux;
	}
}

void listciudad (envio vec[], int dim){
    cout << "CIUDAD\tUNIDADES\tSUMATORIA" << endl;
    for (int i = 0; i < dim; i++){
        

    }
}


int main() {
    
    return 0;
}