#include <stdio.h>
#include <time.h>
#include <stdlib.h>

#define MAX_NUM 217217217

extern double task(int input_number);

int main(int argc, char *argv[]) {
    int input_number = 0;
    // Random generation and file output using ./program.exe : output.txt
    if (argc == 3 && argv[1][0] == ':') {
        srand(clock());
        input_number = rand() % MAX_NUM;
        printf("Generated number: %d; answer in output file\n", input_number);
        FILE *output_stream = fopen(argv[2], "w");
        fprintf(output_stream, "%.9lf", task(input_number));
        fclose(output_stream);
        return 0;
    }
    // File IO using command arguments  ./program.exe input.txt output.txt
    if (argc == 3) {
        FILE *input_stream = fopen(argv[1], "r");
        if (input_stream == NULL) {
            printf("Could not open file. Press any key to exit");
            getchar();
            return 0;
        }
        fscanf(input_stream, "%d", &input_number);
        fclose(input_stream);

        FILE *output_stream = fopen(argv[2], "w");
        fprintf(output_stream, "%.9lf", task(input_number));
        fclose(output_stream);
        return 0;
    }
    // timer with command args ./program.exe 12345
    if (argc == 2) {
        time_t t_start = clock();
        int num = atoi(argv[1]);
        printf("Your number: %d\n", num);
        for (int i = 0; i < 10000000; ++i) {    // Timer does not count IO of user
            task(num);
        }
        time_t t_end = clock();

        printf("Time: %d ms\n", (int) (difftime(t_end, t_start)) / 1000);
        printf("Result: %.9lf\n", task(num));
        return 0;
    }
    printf("Your number (0 < num <= %d):", MAX_NUM);
    scanf("%d", &input_number);
    if (input_number < 1 || input_number > MAX_NUM) {
        printf("Incorrect number = %d\n", input_number);
        return 0;
    }
    printf("\nResult: %.9lf\n", task(input_number));
    return 0;
}
