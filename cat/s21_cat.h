#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

struct Options {
  int bflag;
  int eflag;
  int nflag;
  int sflag;
  int tflag;
  int vflag;
};

void check_case(int argc, char **argv, int opt, struct Options *option);
void print_option_bflag(char curr_char, char fut_char, FILE *fp);
void print_option_eflag(char curr_char, FILE *fp);
void print_option_sflag(char curr_char, char fut_char, FILE *fp);
void print_option_nflag(char curr_char, FILE *fp);
void print_option_tflag(char curr_char, FILE *fp);
void print_option_vflag(char curr_char, FILE *fp);
