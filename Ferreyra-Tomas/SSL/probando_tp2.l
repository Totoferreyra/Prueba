%{
#include <stdio.h>
#include <string.h>

// Contadores para identificadores y literales cadena
int ident_contador = 0;
int cadena_contador = 0;

// Estructura para contar las palabras reservadas
struct PalabraReservada {
    char *palabra;
    int linea;
    int columna;
    // Puedes agregar más información según sea necesario
};
struct PalabraReservada reservadas[1000]; // Ejemplo, ajusta según tus necesidades

// Estructura para contar constantes
struct ConstanteDecimal {
    int valor;
    int total;
};
struct ConstanteDecimal decimales[1000]; // Ejemplo, ajusta según tus necesidades

// Otras estructuras para las otras categorías léxicas según sea necesario
%}

%option noyywrap

%%

[a-zA-Z_][a-zA-Z0-9_]* {
    // Incrementar contador y almacenar información
    ident_contador++;
    printf("IDENTIFICADOR: %s\n", yytext);
}

\"([^\"\\\n]|\\.)*\" {
    // Incrementar contador y almacenar información
    cadena_contador++;
    printf("CADENA: %s\n", yytext);
}
[^ \t\s]+ {
    // Manejar caracteres no reconocidos
    printf("PALABRA DESCONOCIDA: %s\n", yytext);
}

%%

int main() {
    FILE* archivo = fopen("entrada.txt", "r");

    // Inicializa el analizador léxico
    yyin = archivo;
    yylex();

    // Genera el reporte según los requisitos

    // Cierre del archivo y liberación de recursos
    fclose(archivo);
    return 0;
}