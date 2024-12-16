#include <unistd.h>
#include <stdio.h>
#include <fcntl.h>

#define FT(x) int main(void){x (fd, #x")\n");close(fd);}

/*
   Adding this Graceful comment
*/

FT(int fd;fd = open("Grace_kid.c", O_WRONLY | O_CREAT | O_TRUNC, 0644);dprintf(fd, "#include <unistd.h>\n#include <stdio.h>\n#include <fcntl.h>\n\n#define FT(x) int main(void){x (fd, #x\")\\n\");close(fd);}\n\n/*\n   Adding this Graceful comment\n*/\n\nFT(");dprintf)
