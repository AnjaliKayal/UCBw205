
##pull words with counts between x and y

import sys

import psycopg2

try:
    arg = sys.argv[1]

    split_arg = arg.split(",")

    var1 = split_arg[0]
    var2 = split_arg[1]
    
    conn = psycopg2.connect('dbname=tcount user=postgres password=pass')
    cur = conn.cursor()


    cur.execute("SELECT word, count from Tweetwordcount WHERE count BETWEEN %s AND %s ORDER BY count DESC" % (var1, var2))
    records = cur.fetchall()
    for rec in records:
        print rec[0], ": ", rec[1]

except:
    print "Invalid arguments given"


