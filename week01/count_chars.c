#include <stdio.h>

int main(void) {
	int c;
	int count = 0;	

	while ((c = getchar()) != EOF) {
		printf("%c", c);
		count++;
	}

	printf("characters read = %d\n", count);
}
