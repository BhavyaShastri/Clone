//LEX PRogram to extract all html tags at runtime and store it in a file.

%{
%}
digit [0-9]
alpha [a-zA-Z0-9]
%%
"<"{alpha}*{digit}*">" fprintf(yyout,"%s",yytext);
"<"[/]{alpha}*{digit}*">" fprintf(yyout,"%s",yytext);
. ;
%%
int yywrap(){};
int main()
{
	extern FILE *yyin,*yyout;
	yyin=fopen("Input.html","r");
	yyout=fopen("Output.html","w");
	yylex();
	return 0;
}









%{
#include <stdio.h>
#include <stdbool.h>
#include <string.h>

char temp[10];
bool open = false;
%}

digit [0-9]
alpha [a-zA-Z0-9]

%%
"<"{alpha}*{digit}*">" { open = true; strcpy(temp, yytext); }
"<"[/]{alpha}*{digit}*">" { if (open) { fprintf(yyout, "%s", temp); fprintf(yyout, "%s", yytext); open = false; } }
. ;
%%

int yywrap() {
  return 1;
}

int main() {
  extern FILE *yyin, *yyout;
  yyin = fopen("Input.html", "r");
  yyout = fopen("Output.html", "w");
  yylex();
  fclose(yyin);
  fclose(yyout);
  return 0;
}




%{
%}
%%
"<"[^>]*">" fprintf(yyout,"%s",yytext);
. ;
%%
int yywrap(){}
int main(int argc, int *argv[])
{
extern FILE *yyin,*yyout;
yyin = fopen("input2.html","r");
yyout = fopen("out2.html","w");
yylex();
return 0;
}
