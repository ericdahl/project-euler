#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <sys/mman.h>
#include <sys/wait.h>
#include <fcntl.h>
#include <sys/msg.h>
#include <sys/stat.h>
#define CHILDREN 4
#define WORK_SIZE 1000

#define MSG_DO_WORK 1
#define MSG_EXIT 2

int divisors(const int n);
void gen_divisors(int* result, const int start, const int end);

struct message {
    long mtype;
    int start;
    int end;
};

// children     work_size   time
//        1          1000     86
//        5       1000000     25
//        5        100000     22
//        5         10000     22
//        5          1000     22
//        5           100     22
//      100          1000     22
int main(int argc, char** argv) {
    const int limit = 10000000;

    const int fd = open("/dev/zero", O_RDWR);
    int* result = (int*) mmap(0, limit * sizeof(int), PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0);
    close(fd);

    int msqid = msgget(IPC_PRIVATE, S_IRUSR | S_IWUSR);

    for (int i = 0; i < CHILDREN; ++i) {
        const pid_t pid = fork();
        if (pid < 0) {
            perror("fork");
        } else if (pid == 0) {
            for (;;) {
                struct message msg;
                msgrcv(msqid, &msg, sizeof(struct message), 0, 0);
                if (msg.mtype == 2) {
                    exit(EXIT_SUCCESS);
                }
                gen_divisors(result, msg.start, msg.end);
            }
        }
    }

    for (int start = 0; start < limit; start += WORK_SIZE) {
        struct message task = {MSG_DO_WORK, start, start + WORK_SIZE};
        msgsnd(msqid, &task, sizeof(struct message), 0);
    }

    for (int i = 0; i < CHILDREN; ++i) {
        struct message task = {MSG_EXIT, 0, 0};
        msgsnd(msqid, &task, sizeof(struct message), 0);
    }

    for (int i = 0; i < CHILDREN; ++i) {
        int status;
        wait(&status);
    }
    msgctl(msqid, IPC_RMID, 0);

    int count = 0;
    for (int i = 2; i < limit; ++i) {
        if (result[i - 1] == result[i]) {
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

void gen_divisors(int* result, const int start, const int end) {
    for (int i = start; i < end; i++) {
        result[i] = divisors(i);
    }
}
