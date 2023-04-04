// Lex Program to Identify and Count valid identifier

%{
int count=0;
%}

op [+-*/]
letter [a-zA-Z_]
digit [0-9]
id ({letter}+{digit}*)+
notid ({digit}+{letter}*)+

%%
[\t\n]+
("int")|("float")|("char")|("case")|("default")|("if")|("for")|("printf")|("scanf") {printf("%s is a keyword\n",yytext);}
{id} {printf("%s is a identifier\n",yytext);count++;}
{notid} {printf("%s is not a identifier\n",yytext);}
{digit}* {printf("%s is not a identifier\n",yytext);}
[$] return 0;
%%
int yywrap(){return 1;}
int main()
{
yylex();
printf("Total Number of IDentifiers: %d\n",count);
return 0;
}
