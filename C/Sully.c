#include <stdio.h>
#include <stdlib.h>

/*
	Introducing the Sully
*/

char	*Sully() {
char	*str = "#include <stdio.h>%1$c#include <stdlib.h>%1$c%1$c/*%1$c%2$cIntroducing the Sully%1$c*/%1$c%1$cchar%2$c*Sully() {%1$cchar%2$c*str = %3$c%4$s%3$c;%1$c%2$creturn str;%1$c}%1$c%1$cint		main() {%1$c%2$cint i = %5$d;%1$c%1$c%2$cif (i <= 0) return 0;%1$c%1$c%2$cchar filename[20];%1$c%2$cchar execname[20];%1$c%2$cchar command[256];%1$c%1$c%2$csprintf(filename, %3$cSully_%%d.c%3$c, i - 1);%1$c%2$cFILE *fp = fopen(filename, %3$cw%3$c);%1$c%2$cif (!fp) return 1;%1$c%1$c%2$cfprintf(fp, Sully(), 10, 9, 34, Sully(), i - 1);%1$c%2$cfclose(fp);%1$c%1$c%2$csprintf(execname, %3$cSully_%%d%3$c, i - 1);%1$c%2$csprintf(command, %3$cclang -Wall -Wextra -Werror %%s -o %%s && ./%%s%3$c, filename, execname, execname);%1$c%2$csystem(command);%1$c%1$c%2$creturn 0;%1$c}%1$c";
	return str;
}

int		main() {
	int i = 5;

	if (i <= 0) return 0;

	char filename[20];
	char execname[20];
	char command[256];

	sprintf(filename, "Sully_%d.c", i - 1);
	FILE *fp = fopen(filename, "w");
	if (!fp) return 1;

	fprintf(fp, Sully(), 10, 9, 34, Sully(), i - 1);
	fclose(fp);

	sprintf(execname, "Sully_%d", i - 1);
	sprintf(command, "clang -Wall -Wextra -Werror %s -o %s && ./%s", filename, execname, execname);
	system(command);

	return 0;
}
