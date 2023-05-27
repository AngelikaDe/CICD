#include "s21_grep.h"

int main(int argc, char **argv) {
  int l_count = 0;
  FILE *fp = NULL;
  char *search_string = NULL;
  struct Options *option;
  struct Options opti = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
  option = &opti;
  int op = 0;
  int v_count = 5;
  char patt_e[200] = "";
  char patt_f[200] = "";
  int files_count = 0;
  if (argc > 1) {
    chosen_flag(argc, argv, option, patt_e, patt_f);
    if (option->eflag || option->fflag) {
      files_count = argc - optind;
    } else {
      files_count = argc - optind - 1;
    }
  } else {
    if (!option->sflag) {
      printf("END\n");
    }
    exit(1);
  }
  char str[1024] = "";
  search_string = argv[optind];
  if (option->fflag) {
    search_string = patt_f;
    int si = strlen(search_string);
    search_string[si - 1] = '\0';
  } else if (option->eflag) {
    search_string = patt_e;
    int si = strlen(search_string);
    search_string[si - 1] = '\0';
  } else {
    search_string = argv[optind];
  }
  while (optind < argc) {
    v_count = 0;
    l_count = 0;
    fp = fopen(argv[optind], "r");
    if (fp == NULL) {
      if (optind > 3) {
        printf("grep: %s: No such file or directory\n", argv[optind]);
      }
      optind++;
    } else {
      gimmi_some_action(str, argv, option, search_string, fp, &l_count,
                        &v_count, files_count);
      optind++;
      op++;
      fclose(fp);
    }
  }
  return 0;
}