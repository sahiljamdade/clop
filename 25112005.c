#include <stdio.h>
#include <stdlib.h>

#define ERR (1)



typedef struct LineT{
	unsigned int start_index;
	unsigned char length;
}LineT;

typedef struct ContentT{
	unsigned short cnl; //line number of content line
	unsigned char start;
}ContentT;

typedef struct Players{ // will store the line number and starting index of a each teams 1st player.
	ContentT t1_players;
	ContentT t2_players;
}Players;

typedef struct Metadata{ //match summary
	ContentT team1;
	ContentT team2;
}Metadata;

typedef struct delT{
	unsigned short start;
	unsigned char player_index;
	ContentT del_no;
	ContentT del_type;
	ContentT runs;
	ContentT outcome;
}delT;

typedef struct overT{
	unsigned short start;
	delT *ds;
	unsigned char over_no, ndel, player_index;
}overT;
typedef struct InningT{
	overT *overs;
	unsigned char novers;
	unsigned short start, end;
}InningT;

typedef struct Match_Innings{
	InningT in1;
	InningT in2;
}Match_Innings;

int main(int aa, char **ab)
{
	if (aa != 2)
	{
		fprintf(stderr, "Usage: %s <input file name>\n", ab[0]);
		return 2;
	}

	size_t size;
	FILE *f = fopen(ab[1], "rb"); // open file in the so called binary mode
	if (!f) return ERR; // error opening file

	if (fseek(f, 0, SEEK_END) != 0)
	{
		fclose(f); return ERR;
	}
	size = ftell(f); //get the length of the input file
	if (size < 0)
	{
		fclose(f); return ERR;
	}
	if (fseek(f, 0, SEEK_SET) != 0)
	{
		fclose(f); return ERR;
	}

	char *buf = malloc(size); // try to allocate sufficient space
	if (!buf) //if allocation fails exit
	{
		fclose(f); return ERR;
	}

	size_t read = fread(buf, 1, size, f); //try to read the entire file in one go
	if (read != size)
	{
		//if could not read the complete file exit
		if (ferror(f))
		{
			free(buf); fclose(f); return ERR;
		}
	}
	fclose(f);
	if (!buf)
	{
		perror("Failed to read file");
		return ERR;
	}

	// Here we shall construct the lines object as discussed in the class.
	// first we shall find the number of lines present in the input
	// file.
	
	unsigned long nl = 0, cnt = 0;
	
	while (cnt < size)
	{
		if(buf[cnt] == '\n') nl++;
		++cnt;
	}
	printf("Total number of lines is: %ld\n", nl);

	LineT *lines = malloc(nl*(sizeof(LineT)));
	if (!lines) //if allocation fails exit
	{
		fclose(f); return ERR;
	}
	cnt = 0; 
	unsigned long lnsize = 1, lncnt = 0; 
	lines[lncnt].start_index = 0;
	while (cnt < size-1)
	{
		if(buf[cnt] == '\n')
		{

			lines[lncnt].length = lnsize-1;
			lncnt++;
			lines[lncnt].start_index = cnt+1;
			lnsize = 0;
		}
		lnsize++;
		cnt++;


	}
	lines[nl-1].length = lnsize-1;
//	printf(" lines: %d \n",lines[73].length);
/*
cnt = 0;
unsigned long ptr = 0;
lncnt = 0;

while(cnt<nl) {

//	printf("line %ld: length: %d",lncnt, lines[lncnt].length);
//	fwrite((buf+ptr),1, lines[lncnt].length, stdout);
	lncnt++;
	ptr = lines[lncnt].start_index;
	++cnt;
	printf("\n");
}
*/
unsigned char teams[] = "  teams:";
unsigned short len = 8;
//printf("size is: %d\n", len);
//printf("nl is: %d\n", nl);

for(lncnt=0; lncnt<nl; lncnt++) {

	for(int i=0; i<=lines[lncnt].length; i++) {
	
		for(int j=0; j<=len; j++) {
		
			if(buf[lines[lncnt].start_index + i] != teams[j]) {
			
				break;
			}
			else if(buf[lines[lncnt].start_index +i] == teams[j] ) {
				i++;
			}
			if(buf[lines[lncnt].start_index+i] == '\n') {
			
				break;
			}
			
		}
	}
}

ContentT t;
lncnt = 0;
t.cnl = lncnt;

while(t.cnl < nl) {

	printf("line no %d\n", t.cnl);
	t.cnl++;
}





	free(lines); //finally free the allocated memory
	free(buf);
	return 0;
}

