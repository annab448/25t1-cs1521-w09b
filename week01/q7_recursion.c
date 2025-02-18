#include <stdio.h>

int sum(int n);

int main(int argc, char *argv[]) {
        int n;
        printf("Enter a number: ");
        scanf("%d", &n);

        int result = sum(n);
        printf("Sum of all numbers up to %d = %d\n", n, result);

        return 0;
}

int sum(int n) {
	printf("called n = %d\n", n);
	// should i stop
	if (n == 1) {
		printf("FINISHED n = 1\n");
		return n;
	}

	// break down problem
	int answ = n + sum(n-1);
	printf("returning %d\n", n);
	return answ;
}
