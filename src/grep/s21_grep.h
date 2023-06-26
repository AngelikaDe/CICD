#include <regex.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

struct Options {
  int eflag;
  int iflag;
  int vflag;
  int cflag;
  int lflag;
  int nflag;
  int hflag;
  int sflag;
  int fflag;
  int oflag;
};
void chosen_flag(int argc, char **argv, struct Options *option, char *patt_e,
                 char *patt_f);
void gimmi_some_action(char *str, char **argv, struct Options *option,
                       char *search_string, FILE *file, int *l_count,
                       int *v_count, int files_count);
void read_fflag(struct Options *option, char *patt_f);
void c_flag(char **argv, struct Options *option, int *v_count, int *l_count,
            int files_count);
void success_regex(char **argv, struct Options *option, char *str, int *l_count,
                   int files_count, int count, int *n_count,
                   char *search_string);