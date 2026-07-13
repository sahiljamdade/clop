#!/bin/awk -f
BEGIN{
       	flg = 0;
	
}
/^Q[0-9]/{
	     flg = 1;
	     a = $1

	}
flg && $0 ~ /^z/ {
	

	       ans =  $NF;

	       arr[a] = ans;
	}


END {
	for(i in arr) {
		   # print  "question no " i " answer = " arr[i];
		   print "INSERT INTO answer_table(que_no,answer) VALUES(" "'"i "'""," "'"arr[i]"'"");"
		    print " ";

		}
	

	}
