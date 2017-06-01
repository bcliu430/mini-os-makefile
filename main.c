#include <stdio.h>
#include <unistd.h>
#include "addition.h"

int main(void) {
    int ans;
    int a = 1, b = 2;
	sleep(1);
    ans = add(a,b);
    printf("%d + %d = %d\n", a, b, ans);
	sleep(10);
	
    return 0;
}
