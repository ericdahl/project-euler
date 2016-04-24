#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <sys/mman.h>
#include <sys/wait.h>
#include <fcntl.h>

int divisors(const int n);
void gen_divisors(int* result, const int start, const int end);

// 5   children: 27s
// 10  children: 23s
// 100 children: 21s
int main(int argc, char** argv) {
    const int limit = 10000000;
    const int children = 100;

    const int fd = open("/dev/zero", O_RDWR);
    int* result = (int*) mmap(0, limit * sizeof(int), PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0);
    close(fd);

    for (int i = 0; i < children; ++i) {
        const pid_t pid = fork();
        if (pid < 0) {
            perror("fork");
        } else if (pid == 0) {
            gen_divisors(result, i * limit / children, (i + 1) * limit / children);
        }
    }

    for (int i = 0; i < children; ++i) {
        int status;
        wait(&status);
    }

    int count = 0;
    for (int i = 2; i < limit; ++i) {
        if (result[i - 1] == result[i]) {
            ++ count;
        }
    }
    printf("%d\n", count);

}

int divisors(const int n) {
    int count = 2;
    int d = 2;
    for (; d * d <= n; ++d) {
        if (n % d == 0) {
            count += 2;
        }
    }
    --d;
    if (d * d == n) {
        --count;
    }

    return count;
}

void gen_divisors(int* result, const int start, const int end) {
    for (int i = start; i < end; i++) {
        result[i] = divisors(i);
    }
    exit(EXIT_SUCCESS);
}
