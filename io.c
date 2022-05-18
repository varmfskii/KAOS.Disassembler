#include <sys/stat.h>
#include <ctype.h>

int stricmp(const char *a, const char *b) {
  for(;toupper(*a)==toupper(*b); a++, b++);
  return toupper(*a)-toupper(*b);
}

off_t filelength(int fn) {
  struct stat stat;

  fstat(fn, &stat);
  return stat.st_size;
}
