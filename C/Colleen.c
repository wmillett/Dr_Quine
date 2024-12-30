#include <stdio.h>


/*
	Introducing the Colleen
*/

char	*Colleen() {
/*
	Say Colleeeeeeeen
*/
char	*str = "#include <stdio.h>%1$c%1$c%1$c/*%1$c%2$cIntroducing the Colleen%1$c*/%1$c%1$cchar%2$c*Colleen() {%1$c/*%1$c%2$cSay Colleeeeeeeen%1$c*/%1$cchar%2$c*str = %3$c%4$s%3$c;%1$c%2$creturn str;%1$c}%1$c%1$cint%2$c%2$cmain() {%1$c%2$cprintf(Colleen(), 10, 9, 34, Colleen());%1$c%2$creturn 0;%1$c}%1$c";
	return str;
}

int		main() {
	printf(Colleen(), 10, 9, 34, Colleen());
	return 0;
}
