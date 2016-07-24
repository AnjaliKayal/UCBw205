## Returns number of counts for a specific word if there is an argument and the entire list if there is not argument
#can only take one argument

#import sys to test for arguments and psycopg2 to access postgres
import sys

import psycopg2                                                                                                                   
conn = psycopg2.connect('dbname=tcount user=postgres password=pass')                                             

cur = conn.cursor()  

##try will complete if there is an argument and just search for the argument

try:
    var1 = sys.argv[1]
    cur.execute("SELECT word, count from Tweetwordcount WHERE word = '%s'" % (var1))   
    records = cur.fetchall() 
    for rec in records:                                                                                                          
        print "Total number of occurences of '", var1, "':", rec[1] 

## if there are not arguments, it will complete except and print all of the records

except:
    cur.execute("SELECT word, count from Tweetwordcount ORDER BY word")  
    records = cur.fetchall()  
    for rec in records:                                                                                                          
        print "(", rec[0], ", ", rec[1],"), " 

conn.commit()


