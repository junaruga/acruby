#include "acruby.h"
#include "node.h"
#include <stdio.h>

int main(int argc, const char **argv)
{
    const char *prog = argv[0];
    int verbose = FALSE;
    int i = 0;
    int error_num = 0;

    while (argc > 1 && argv[1][0] == '-') {
        const char *s = argv[1] + 1;
        while (*s) {
            switch (*s) {
                case 'v':
                    verbose = TRUE;
                    break;
                default:
                    fprintf(stderr, "%s: unknown option -%c\n", prog, *s);
            }
            s++;
        }
        argc--;
        argv++;
    }

    if (argc > 1) {
        for (i = 1; i < argc; i++) {
            error_num += node_parse_file(argv[i]);
        }
    } else {
        error_num += 1;
        fprintf(stderr, "%s: Ruby file is required as a argument.\n", prog);
    }

    if (error_num == 0) {
        node_run();
    }

    if (verbose) {
        printf("Done.\n");
    }
    return (error_num > 0) ? EXIT_FAILURE : EXIT_SUCCESS;
}
