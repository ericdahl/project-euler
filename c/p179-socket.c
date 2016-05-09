#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <sys/mman.h>
#include <sys/wait.h>
#include <fcntl.h>
#include <sys/socket.h>
#include <netdb.h>
#include <string.h>
#include <arpa/inet.h>

#define HOST_NAME_MAX 256

#define LIMIT 10000000
#define WORK_SIZE 1000
#define CHILDREN 10

int divisors(const int n);
void gen_divisors(int* result, const int start, const int end);
void init_client(int* result);
void init_server();

struct task {
    int start;
    int end;
};

// children   work_size  time
//      100      100000    22
//      100       10000    22
//      100        1000    22
//      100         100    26
//       10        1000    22
//       10       10000    22
//       10      100000    22
int main(int argc, char** argv) {
    const int fd = open("/dev/zero", O_RDWR);
    int* result = (int*) mmap(0, LIMIT * sizeof(int), PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0);
    close(fd);

    const pid_t server_pid = fork();
    if (server_pid == 0) {
        init_server();
    }

    for (int i = 0; i < CHILDREN; ++i) {
        const pid_t pid = fork();
        if (pid < 0) {
            perror("fork");
            exit(EXIT_FAILURE);
        } else if (pid == 0) {
            init_client(result);
        }
    }
    
    for (int i = 0; i < CHILDREN + 1; ++i) {
        int status;
        wait(&status);
    }

    int count = 0;
    for (int i = 2; i < LIMIT; ++i) {
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

void init_server() {
    struct addrinfo hint;
    memset(&hint, 0, sizeof(struct addrinfo));
    hint.ai_family = AF_INET;
    hint.ai_socktype = SOCK_STREAM;
    
    struct addrinfo* res;
    const int addrinfo = getaddrinfo("127.0.0.1", "1111", &hint, &res);
    if (addrinfo != 0) {
        fprintf(stderr, "getaddrinfo: %s\n", gai_strerror(addrinfo));
        exit(1);
    }
    
    const int sock_fd = socket(AF_INET, SOCK_STREAM, 0);
    int reuse = 1; 
    if (setsockopt(sock_fd, SOL_SOCKET, SO_REUSEADDR, &reuse, sizeof(int)) < 0) {
        perror("setsockopt");
        exit(1);
    }

    if (bind(sock_fd, res->ai_addr, res->ai_addrlen) < 0) {
        perror("bind");
        exit(EXIT_FAILURE);
    }
    if (listen(sock_fd, 10) < 0) {
        perror("listen");
        exit(EXIT_FAILURE);
    }

    for (int current = 0; current < LIMIT; current += WORK_SIZE) {
        const int client_fd = accept(sock_fd, NULL, NULL);
        if (client_fd < 0) {
            perror("accept");
            exit(EXIT_FAILURE);
        }
       
        const struct task t = {current, current + WORK_SIZE}; 
        FILE* client_fp = fdopen(client_fd, "w");
        fwrite(&t, sizeof(struct task), 1, client_fp);
        fclose(client_fp);
    }
    close(sock_fd);
    exit(EXIT_SUCCESS);
}

void init_client(int* result) {
    struct addrinfo hint;
    memset(&hint, 0, sizeof(struct addrinfo));
    hint.ai_family = AF_INET;
    hint.ai_socktype = SOCK_STREAM;

    struct addrinfo* res;
    const int addrinfo = getaddrinfo("127.0.0.1", "1111", &hint, &res);
    if (addrinfo != 0) {
        fprintf(stderr, "getaddrinfo: %s\n", gai_strerror(addrinfo));
        exit(1);
    }

    for (;;) { 
        const int sock_fd = socket(AF_INET, SOCK_STREAM, 0);
        if (connect(sock_fd, res->ai_addr, res->ai_addrlen) < 0) {
            exit(EXIT_SUCCESS);
        }

        FILE* sock_fp = fdopen(sock_fd, "r");
        struct task t;
        fread(&t, sizeof(struct task), 1, sock_fp);
        close(sock_fd);

        gen_divisors(result, t.start, t.end);
    }
}
