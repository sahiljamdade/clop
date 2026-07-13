#include <stdio.h>
#include <stdlib.h>
#include <sqlite3.h>

#define ERR (1)

typedef struct linet{

	unsigned short sidx;
	unsigned short len;
}linet;


typedef struct rollname{

	unsigned short rollsidx;
	unsigned short rolleidx;
	unsigned short namesidx;
	unsigned short nameeidx;
}rollname;

typedef struct subject {
	unsigned short codestart;
	unsigned short codeend;
	unsigned short subnamestart;
	unsigned short subnameend;
}subject;
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


     linet *lines = malloc((nl+1) * (sizeof(linet)));

     unsigned long lncnt=0;
     lines[lncnt].sidx = 0;
     cnt = 0;
     lines[lncnt].len = 1;


     while(lncnt < nl) {
     
	     if(buf[cnt] == '\n') {
	     
		     lines[lncnt].len = lines[lncnt].len-1;
		     lncnt++;
		     lines[lncnt].sidx = cnt + 1;
		     lines[lncnt].len = 0;
	     }
	     lines[lncnt].len++;
	     cnt++;
     }
     
  lncnt = 0; 
  cnt=0;

  
  /*while(lncnt < nl) {

	  fwrite(buf+cnt, 1, lines[lncnt].len , stdout);
	  printf("\n");
	  lncnt++;
	  cnt = lines[lncnt].sidx;
  }
*/


  cnt=0, lncnt=0;
  lines[lncnt].sidx=0;
  while(buf[lines[lncnt].sidx] != '\n') {
  
	  if(buf[lines[lncnt].sidx] == '2') {
	    
		  cnt++;

	  }
	  lncnt++;
	  lines[lncnt].sidx = lines[lncnt-1].sidx + lines[lncnt-1].len + 1;
  }
//  printf("count is %d",cnt);


    rollname *obj = malloc((cnt+1) * sizeof(rollname));
//  rollname *obj = malloc(cnt * sizeof(rollname));

  lncnt=0;
  unsigned short k;


  for(unsigned short i=0; i<cnt; i++) {
    while(buf[lines[lncnt].sidx] != '\n') {

        if(buf[lines[lncnt].sidx] == '2') {

            obj[i].rollsidx = obj[i].rolleidx = obj[i].namesidx = obj[i].nameeidx = i;
            k = 0;

            if(k < lines[lncnt].len) {

               
                obj[i].rollsidx = lines[lncnt].sidx + k;

                while(buf[lines[lncnt].sidx + k] != ' ' && k < lines[lncnt].len) {
                    k++;
                }

                obj[i].rolleidx = lines[lncnt].sidx + (k - 1);

                if(buf[lines[lncnt].sidx + k] == ' ') {
                    k++;
                }

                obj[i].namesidx = lines[lncnt].sidx + k;

                while(buf[lines[lncnt].sidx + k] != '\n' && k < lines[lncnt].len) {
                    k++;
                }

                obj[i].nameeidx = lines[lncnt].sidx + (k - 1);

                //printf("%c", buf[obj[i].nameeidx]);
            }
        }

        lncnt++;
        lines[lncnt].sidx = lines[lncnt-1].sidx + lines[lncnt-1].len + 1;
    }
}




lncnt=0; cnt=0;
lines[lncnt].sidx = 0;
while(buf[lines[lncnt].sidx] != '\n') {

	lncnt++;
	cnt++;

}

//  printf("count is %d ",cnt);
   cnt = cnt + 1;

   k=0;   // find no of subjects
   
   while(lncnt<nl) {
   
	   if(buf[lines[lncnt].sidx] == 'C' ) {
	   
		   k++;
	   }
	   lncnt++;
   }
 
      subject *subinfo = malloc((k+1) * sizeof(subject));
    //subject *subinfo = malloc( k * sizeof(subject));

    lncnt = cnt;
   

   for(unsigned short i=0; i<=k; i++) {
   
	    if(buf[lines[lncnt].sidx] == 'C') {
	    
	        subinfo[i].codestart = subinfo[i].codeend = subinfo[i].subnamestart = subinfo[i].subnameend = i;
		cnt = 0;

		if(cnt < lines[lncnt].len) {
		
			subinfo[i].codestart = lines[lncnt].sidx+cnt;

			while(buf[lines[lncnt].sidx+cnt] != ' ' && cnt<lines[lncnt].len) {
			
				cnt++;
			}

			subinfo[i].codeend = lines[lncnt].sidx + (cnt-1);
		//	printf("%c",buf[subinfo[i].codeend]);

			if(buf[lines[lncnt].sidx+cnt] == ' ') {
			
				cnt++;
			}
			subinfo[i].subnamestart = lines[lncnt].sidx + cnt;
			while(buf[lines[lncnt].sidx+cnt] != '\n' && cnt < lines[lncnt].len){
			
				cnt++;
			}

			subinfo[i].subnameend = lines[lncnt].sidx + (cnt-1);

	        	}


         	 }
	    lncnt++;
	    lines[lncnt].sidx = lines[lncnt-1].sidx + lines[lncnt-1].len+1;
 
	    }
  


/* --------------------------------Insert into database -------------------------------------------*/





free(subinfo);
free(obj);
free(lines);
free(buf);  

return 0;

}

