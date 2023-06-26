#include "s21_cat.h"

int main(int argc, char **argv) {
  char curr_char = 0;
  char fut_char = '\n';
  int op = 0;
  struct Options *option;
  struct Options opti = {0, 0, 0, 0, 0, 0};
  option = &opti;
  FILE *fp = NULL;
  check_case(argc, argv, op, option);
  while (optind < argc) {
    fp = fopen(argv[optind], "r");
    if (fp == NULL) {
      printf("cat: %s: No such file or directory.\n", argv[optind]);
      optind++;
    } else {
      if (option->bflag == 0 && option->eflag == 0 && option->nflag == 0 &&
          option->sflag == 0 && option->tflag == 0 && option->vflag == 0) {
        while ((curr_char = getc(fp)) != EOF) {
          printf("%c", curr_char);
        }
      } else {
        if (option->sflag) {
          print_option_sflag(curr_char, fut_char, fp);
        } else if (option->nflag) {
          print_option_nflag(curr_char, fp);
        } else if (option->eflag) {
          print_option_eflag(curr_char, fp);
        } else if (option->bflag) {
          print_option_bflag(curr_char, fut_char, fp);
        } else if (option->tflag) {
          print_option_tflag(curr_char, fp);
        } else if (option->vflag) {
          print_option_vflag(curr_char, fp);
        }
      }
      fclose(fp);
      optind++;
    }
  }
  return 0;
}