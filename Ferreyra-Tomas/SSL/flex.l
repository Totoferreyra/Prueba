%option noyywrap

%{
    #include <stdio.h>

    int decimales = 0;
    int octales = 0;
    int hexas = 0;
    int nose = 0;

%}

NUMERO_DECIMAL [0-9]
NUMERO_OCTAL [0-7]
NUMERO_HEXA [0-9A-Fa-f]

%%

[1-9]{NUMERO_DECIMAL}+ {printf("Constante decimal: %s \n", yytext); decimales++;}
0{NUMERO_OCTAL}* {printf("Constante octal %s \n", yytext); octales++;}
0[xX]{NUMERO_HEXA}+ {printf("Constante hexa %s \n", yytext); hexas++;}
. {nose++;}

%%

int main(){
    yyin = fopen("entrada.txt", "r");
    yyout = fopen("salida.txt", "w");
    yylex();

    printf("\n=====================\n\n");
    printf("Cantidad decimales: %d \n", decimales);
    printf("Cantidad octales: %d \n", octales);
    printf("Cantidad hexadecimales: %d \n", hexas);
    printf("Cantidad no identificados: %d \n", nose);

    return 0;
}