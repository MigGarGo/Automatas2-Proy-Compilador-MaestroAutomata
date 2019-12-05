package codigo;
import static codigo.Tokens.*;
%%
%class Lexer
%type Tokens
L=[a-zA-Z_]+
D=[0-9]+
espacio=[ ,\t,\r]+
%{
    public String lexeme;
    public Pintar pin=new Pintar();

%}
%%

/* Espacios en blanco */
{espacio} {/*Ignore*/}

/* Comentarios */
( "//"(.)* ) {/*Ignore*/}

/* Salto de linea */
( "\n" ) {return Linea;}

/* Comillas */
( "\"" ) {lexeme=yytext(); return Comillas;}

/* Tipos de datos */
( Entero | Flotante) {lexeme=yytext(); return T_dato;}

/* Tipo de dato String */
( Cadena ) {lexeme=yytext(); return cadena;}

/* Tipo de dato Estado */
( Estado ) {lexeme=yytext(); return estado;}

/* Tipo de dato Alfabeto */
( Alfabeto ) {lexeme=yytext(); return alfabeto;}

/* Tipo de dato Boleano*/
( Boleano ) {lexeme=yytext(); return boleano;}

/* Tipo de dato Conjunto */
( Conjunto ) {lexeme=yytext(); return conjunto;}

/* Tipo de dato Caracter */
( Caracter ) {lexeme=yytext(); return caracter;}

/* Tipo de dato Expresion */
( Expresion ) {lexeme=yytext(); return expre;}

/* Palabra resevada inicio */
( Inicio ) {pin.pintaAzul(yychar,yylength()); lexeme=yytext(); return inicio;}

/* Palabra resevada Funcion */
( Funcion ) {lexeme=yytext(); return funcion;}

/* Palabra resevada fin */
( Fin ) {lexeme=yytext(); return fin;}

/* Palabra resevada esAfd */
( esAfd ) {lexeme=yytext(); return afd;}

/* Palabra resevada esAfn */
( esAfn ) {lexeme=yytext(); return afn;}

/* Palabra resevada nuevo */
( Nuevo ) {lexeme=yytext(); return nuevo;}

/* Palabra resevada Validar*/
( Validar ) {lexeme=yytext(); return validar;}

/* Palabra resevada Monstrar */
( Mostrar ) {lexeme=yytext(); return mostrar;}

/* Palabra resevada grafico */
( Grafico ) {lexeme=yytext(); return grafico;}

/* Palabra resevada mostrarTabla */
( mostrarTabla ) {lexeme=yytext(); return Mostrartabla;}

/* Palabra resevada Automata */
( Automata ) {lexeme=yytext(); return automata;}

/* Palabra resevada ER */
( ER ) {lexeme=yytext(); return er;}

/* Palabra resevada Con */
( Con ) {lexeme=yytext(); return con;}

/* Palabra resevada Hacia */
( Hacia ) {lexeme=yytext(); return hacia;}

/* Palabra resevada ordenPrincipal */
( "ordenPrincipal" ) {lexeme=yytext(); return ordenprincipal;}

/* Palabra reservada si */
( si ) {lexeme=yytext(); return If;}

/* Palabra reservada sino */
( sino ) {lexeme=yytext(); return Else;}

/* Palabra reservada Do */
( hacer ) {lexeme=yytext(); return Do;}

/* Palabra reservada While */
( mientras ) {lexeme=yytext(); return While;}

/* Palabra reservada For */
( para ) {lexeme=yytext(); return For;}

/* Operador Igual */
( "=" ) {lexeme=yytext(); return Igual;}

/* Operador Suma */
( "+" ) {lexeme=yytext(); return Suma;}

/* Operador Resta */
( "-" ) {lexeme=yytext(); return Resta;}

/* Operador Multiplicacion */
( "*" ) {lexeme=yytext(); return Multiplicacion;}

/* Operador Division */
( "/" ) {lexeme=yytext(); return Division;}

/* Operadores logicos */
( "&&" | "||" | "!" | "&" | "|" ) {lexeme=yytext(); return Op_logico;}

/*Operadores Relacionales */
( ">" | "<" | "==" | "!=" | ">=" | "<=" | "<<" | ">>" ) {lexeme = yytext(); return Op_relacional;}

/* Operadores Atribucion */
( "+=" | "-="  | "*=" | "/=" | "%=" ) {lexeme = yytext(); return Op_atribucion;}

/* Operadores Incremento y decremento */
( "++" | "--" ) {lexeme = yytext(); return Op_incremento;}

/*Operadores Booleanos*/
(true | false)      {lexeme = yytext(); return Op_booleano;}

/* Parentesis de apertura */
( "(" ) {lexeme=yytext(); return Parentesis_a;}

/* Parentesis de cierre */
( ")" ) {lexeme=yytext(); return Parentesis_c;}

/* Llave de apertura */
( "{" ) {lexeme=yytext(); return Llave_a;}

/* Llave de cierre */
( "}" ) {lexeme=yytext(); return Llave_c;}

/* Corchete de apertura */
( "[" ) {lexeme = yytext(); return Corchete_a;}

/* Corchete de cierre */
( "]" ) {lexeme = yytext(); return Corchete_c;}

/* Marcador de inicio de algoritmo */
( "main" ) {lexeme=yytext(); return Main;}

/* Punto y coma */
( ";" ) {lexeme=yytext(); return P_coma;}

/* coma */
( "," ) {lexeme=yytext(); return coma;}

/* Identificador */
{L}({L}|{D})* {lexeme=yytext(); return Identificador;}

/* Numero */
("(-"{D}+")")|{D}+|[0-9]+[.][0-9]+ {lexeme=yytext(); return Numero;}

/* char */
{L} {lexeme=yytext(); return elemento;}

/* Error de analisis */
 . {return ERROR;}
