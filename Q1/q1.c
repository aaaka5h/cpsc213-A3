#include <stdlib.h>
#include <stdio.h>

// YOU: Allocate these global variables, using these names
int  t, p;
int* m;
int  s[10];

int main (int argv, char** argc) {
  // Ignore this block of code
  if (argv != 11) {
    fprintf (stderr, "usage: s[0] ... s[9]\n");
    exit (EXIT_FAILURE);
  }
  for (int b=0; b<10; b++)
    s[b] = atol (argc[1 + b]);

  // YOU: Implement this code
  t  = s[2];
  t  = s[t];
  m  = &p;
  *m = 9;
  m  = &s[s[8]];
  *m = *m + s[1];

  // Ignore this block of code
  printf ("t=%d p=%d m=&s[%d] s={", t, p, m - s);
  for (int b=0; b<10; b++)
    printf("%d%s", s[b], b<9? ", ": "}\n");
  }
