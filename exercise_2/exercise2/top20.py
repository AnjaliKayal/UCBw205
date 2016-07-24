## Returns number of counts for words that have the top 20 counts
#takes no arguments

#import psycopg2 to access postgrs

import psycopg2                                                                                                                   
conn = psycopg2.connect('dbname=tcount user=postgres password=pass')                                             

cur = conn.cursor()  

## if there are not arguments, it will complete except and print all of the records

cur.execute("SELECT word, count from Tweetwordcount ORDER BY count DESC LIMIT 20")  
records = cur.fetchall()  
for rec in records:                                                                                                          print "(", rec[0], ", ", rec[1],"), " 

conn.commit()


