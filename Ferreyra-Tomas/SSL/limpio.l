%option noyywrap

%{
#include <stdio.h>
#include <string.h>
%}

PALABRA_RESERVADA   auto|break|case|char|const|continue|default|do|double|else|enum|extern|float|for|goto|if|int|long|register|return|short|signed|sizeof|static|struct|switch|typedef|union|unsigned|void|volatile|while
PUNTUACION \[|\]|\{|\}|\(|\)|\*|,|:|;|=|.|#|&|\+|-|~|!|\/|%|<|>|\^|\?|(\.\.\.)|(->)|(\+\+)|(--)|(<<)|(>>)|(<=)|(>=)|(==)|(!=)|(&&)|(\|\|)|(\*=)|(\/=)|(%=)|(\+=)|(-=)|(<<=)|(>>=)|(&=)|(\^=)|(\|=)|(##)


%%
[ \t]+                                ;

[1-9][0-9]*/{PUNTUACION}?             {printf("DECIMAL: %d\n", yytext);}

0[0-7]*/{PUNTUACION}?                 {printf("OCTAL: %s => %d\n", yytext, (int)strtol(yytext, NULL, 8));}

0[xX][0-9a-fA-F]+/{PUNTUACION}?       {printf("HEXADECIMAL: %s => %d\n", yytext, (int)strtol(yytext, NULL, 16));}

{PALABRA_RESERVADA}/{PUNTUACION}?     {printf("PALABRA RESERVADA: %s\n", yytext);}

{PUNTUACION}/\n?                      {printf("PUNTUACION: %s\n", yytext);}

[a-zA-Z_][a-zA-Z0-9_]*/{PUNTUACION}?  {printf("IDENTIFICADOR: %s\n", yytext);}

\"([^\"\\\n]|\\.)*\"/{PUNTUACION}?    {printf("CADENA: %s\n", yytext);}

^({PUNTUACION}[ \t\s])+               {printf("PALABRA NO RECONOCIDA: %s\n", yytext);}

.|\n                                 ;

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