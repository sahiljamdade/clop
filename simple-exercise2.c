#include<stdio.h>

/*
 * This is a simple practice exercise mainly for people who have not yet 
 * been able to write program to construct the cricket match yaml record 
 * object yet.
 *
 * As discussed in the class today, write a program that will search
 * each string in t2 in the input which is a list of strings.
 * For each string in t2, the program should output [print] Found/NotFound
 * And
 * If Found, then print the number of times it is found.
 * */
int main (int n, char **v)
{
   unsigned char a0[] = "Thisisasampleinputfromuser.Thissampleinputcontains3importantthings.Oneisnotanimportantnumber.Twoisnotanimportantnumber.Threeisnotanimportantnumber.So,wemustremembersuchimportantthingsfortypical3rdratedexams.";

   int a1[] = {4, 2, 1, 6, 5, 4, 4, 1, 4, 6, 5, 8, 1, 9, 6, 1, 3, 2, 3, 2, 9, 6, 1, 3, 2, 3, 2, 9, 6, 1, 5, 2, 3, 2, 9, 6, 1, 2, 1, 2, 4, 8, 4, 9, 6, 3, 7, 3, 5, 5, 1};
//	printf("%s\n",a0);

   unsigned char b0[] = "Thisisnumberimportantanantport...";

 //  unsigned char c[100];
   int b1[] = {4, 2, 6, 9, 2, 3, 4, 1, 2};

   

   int b0w = 0, b1w = 0;
   while (b0[b0w] != '\0') {
   	int a0w = 0, a1w = 0, cnt = 0;

	while (a0[a0w] != '\0') {
		if(b1[b1w] == a1[a1w]) {
			int i = 0;

			while ( a0[a0w+i] == b0[b0w+i] && i < b1[b1w] ) {
				i = i + 1;
			}
			if( i == b1[b1w] ) {
				cnt = cnt + 1;
			}
		}
		a0w = a0w + a1[a1w];
		a1w = a1w + 1;
	}
//	printf("%s %d\n",b0+b0w,cnt);
	fwrite(b0+b0w, 1, b1[b1w],stdout);
	printf(" count is: %d",cnt);
	printf("\n");
	b0w = b0w + b1[b1w];
	b1w = b1w + 1;
   }


  return 0;
}

