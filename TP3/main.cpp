/*Consigna: Defina y de valores a una matriz de enteros de 5 filas y 4 columnas. Llame a una función que
acepte matrices de tipo entero con 4 columnas (cantidad de filas a pasar como parámetro) y
devuelva en que fila y columna se encuentra el menor elemento de la matriz.*/

#include <iostream>
#include <fstream>
#include <stdlib.h>
#include <time.h>

using namespace std;

int minimo (int mat [][4], int filas){
    int fmin = 0;
    int cmin = 0;
    for (int i = 0; i < filas; i++){
        for (int j = 0; j < 4; j++){
            if (mat[i][j] < mat[fmin][cmin]){
                fmin = i;
                cmin = j;
            }

        }
    }
    return ((fmin) * 10) + (cmin);
}

void mostrar (int mat [][4], int filas){
    for (int i = 0; i < filas; i++){
        for (int j = 0; j < 4; j++){
            cout << mat[i][j] << "\t";
        }
        cout << endl;
    }

}

int main() {
    int filas = 5;
    int mat [filas][4] {{5, 3, 7, 3},
                        {9, 2, 4, 10},
                        {11, 12, 13, 14},
                        {18, 21, 1, 24},
                        {-2, 34, 32,45}};
    
    mostrar (mat, filas);
    cout << "El elemento mas pequeño es el " << mat[minimo(mat, filas)/10][minimo(mat, filas)%10] << 
    " en la posicion " << minimo(mat, filas)/10 + 1 << " - " << minimo(mat, filas)%10 + 1;


    
    return 0;
}