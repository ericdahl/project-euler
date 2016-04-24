#include <stdio.h>
#include <pthread.h>


int divisors(const int n);
void* gen_divisors(void* arg);

struct divisor_task {
    int* result;
    int start;
    int end;
};

// 1   thread : 90s
// 5   threads: 27s 
// 10  threads: 22s
// 100 threads: 21s
int main(int argc, char** argv) {
    const int limit = 10000000;
    const int threads = 100;
    pthread_t threadids[threads];
    struct divisor_task tasks[threads];
    int d[limit];

    for (int i = 0; i < threads; ++i) {
        tasks[i].result = d;
        tasks[i].start = i * limit / threads;
        tasks[i].end = (i + 1) * limit / threads;
        pthread_create(&threadids[i], NULL, gen_divisors, &tasks[i]);
    }

    for (int i = 0; i < threads; ++i) {
        pthread_join(threadids[i], NULL);
    }

    int count = 0;
    for (int i = 2; i < limit; i++) {
        if (d[i - 1] == d[i]) {
            ++count;
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

void* gen_divisors(void* arg) {
    struct divisor_task* dtask = (struct divisor_task*) arg;

    for (int i = dtask->start; i < dtask->end; ++i) {
        dtask->result[i] = divisors(i);
    }

    return (void*) 0;
}

