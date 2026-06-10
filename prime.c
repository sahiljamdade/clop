/* Find next prime number to given positive integer n */

/*
 -  num%num and num%1 always be zero so to check next  prime number range should be in greater than 1 and less than number 
 -  if in between that range if number is divisible with any of the number then it cant be a prime number according to the property
 -  of prime number as only divisible by given number itself and 1.

 - complexity is O(n) as we are compairing the next number with all the number within the range if its remainder is 0 or not. 

 - as is it is positive integer -

 - before starting fixnum should be >= 1 and stop when fixnum == next_prime_num
 - range of num is  num >= 2 && num < fixnum

*/

#include<stdio.h>

int main() {

	unsigned short fixnum = 8;
	fixnum = fixnum + 1;
	unsigned short num = fixnum - 1;

	while(num >= 2) {
	
		 if(fixnum % num == 0) {
		
			fixnum = fixnum + 1;
			num = fixnum - 1;
		}
		else if(fixnum % num != 0) {
		 
			num = num - 1;
		}
	}
	
	if(num == 1) {
	
		printf("next prime number is %d\n",fixnum);
	}

	return 0;
}
