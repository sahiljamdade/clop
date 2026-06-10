#include<stdio.h>
#include<stdlib.h>

int main() {

	unsigned short a[] = {2,1,2,4,1};
	unsigned short alen = sizeof(a)/sizeof(a[0]);
	
	unsigned short *b = (short *)malloc(sizeof(short)*alen);
	unsigned short aw = 0, bw;
	
	while(aw < alen) {
	
		bw = a[aw];
		b[bw] = b[bw] + 1;
		aw = aw + 1;
	}
	
	bw = 0;
	while(b[bw] != 1) {
	
		bw = bw + 1;
	}
	
	printf("val is : %d\n", bw );

	free(b);
	return 0;
}
