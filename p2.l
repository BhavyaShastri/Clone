%{
   int count=0;
%}

op [+-*/]
letter [a-zA-Z]
digit [0-9]
id {letter}*|({letter}{digit}+)
notid ({digit}{letter}+)

%%
[\t\n]+
("int")|("float")|("char")|("default") {printf("%s is a keyword\n" , yytext);}
{id} {printf("%s is an identifier\n" , yytext); count++;}
{notid} {printf("%s is not an identifier\n" , yytext);}
%%

yywrap(){ }
int main()
{
   
   yylex();
   printf("Total identifiers: %d\n" , count);
   return 0;
}
