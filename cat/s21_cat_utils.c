#include "s21_cat.h"

void check_case(int argc, char **argv, int opt, struct Options *option) {
  int count = 0;
  while ((opt = getopt(argc, argv, ":benstv")) != -1) {
    count = count + 1;
    if (count == 1) {
      switch (opt) {
        case 'b':
          option->bflag = 1;
          break;
        case 'e':
          option->eflag = 1;
          break;
        case 'n':
          option->nflag = 1;
          break;
        case 's':
          option->sflag = 1;
          break;
        case 't':
          option->tflag = 1;
          break;
        case 'v':
          option->vflag = 1;
          break;
        default:
        case '?':
          printf("FAILURE");
      }
    }
  }
}

void print_option_bflag(char curr_char, char fut_char, FILE *fp) {
  int num = 0;
  int num_2 = 1;
  curr_char = getc(fp);
  if (curr_char != '\n') {
    printf("%6d\t", num_2);
    num++;
  }
  while ((fut_char = getc(fp)) != EOF) {
    if (curr_char == '\n' && fut_char != '\n') {
      num++;
      printf("%c", curr_char);
      printf("%6d\t", num);
      curr_char = fut_char;
    } else {
      printf("%c", curr_char);
      curr_char = fut_char;
    }
  }
  printf("%c", curr_char);
}

void print_option_eflag(char curr_char, FILE *fp) {
  while ((curr_char = getc(fp)) != EOF) {
    if (curr_char == '\n') {
      printf("$\n");
    } else if (curr_char >= 0 && curr_char <= 31 && curr_char != '\n' &&
               curr_char != 32 && curr_char != 127 && curr_char != '\t') {
      printf("^%c", curr_char + 64);
    } else if (curr_char == 127) {
      printf("^?");
    } else {
      printf("%c", curr_char);
    }
  }
}

void print_option_sflag(char curr_char, char fut_char, FILE *fp) {
  curr_char = getc(fp);
  do {
    fut_char = getc(fp);
    if (curr_char == '\n' && fut_char == '\n') {
      while (fut_char == '\n') {
        fut_char = getc(fp);
      }
      printf("%c", curr_char);
      printf("%c", curr_char);
      curr_char = fut_char;
    } else {
      printf("%c", curr_char);
      curr_char = fut_char;
    }
  } while ((fut_char) != EOF);
}
void print_option_nflag(char curr_char, FILE *fp) {
  int num = 1;
  char fut_char;
  curr_char = getc(fp);
  printf("%6d\t", num);
  do {
    fut_char = getc(fp);
    if (curr_char == '\n' && fut_char != EOF) {
      num++;
      printf("%c", curr_char);
      printf("%6d\t", num);
      curr_char = fut_char;
    } else {
      printf("%c", curr_char);
      curr_char = fut_char;
    }
  } while ((fut_char) != EOF);
}

void print_option_tflag(char curr_char, FILE *fp) {
  while ((curr_char = getc(fp)) != EOF) {
    if (curr_char == '\t') {
      printf("^I");
    } else if (curr_char >= 0 && curr_char <= 31 && curr_char != '\n' &&
               curr_char != 32 && curr_char != 127) {
      printf("^%c", curr_char + 64);
    } else if (curr_char == 127) {
      printf("^?");
    } else {
      printf("%c", curr_char);
    }
  }
}

void print_option_vflag(char curr_char, FILE *fp) {
  while ((curr_char = getc(fp)) != EOF) {
    if (curr_char >= 0 && curr_char <= 31 && curr_char != '\n' &&
        curr_char != 32 && curr_char != 127 && curr_char != '\t') {
      printf("^%c", curr_char + 64);
    } else if (curr_char == 127) {
      printf("^?");
    } else {
      printf("%c", curr_char);
    }
  }
}
