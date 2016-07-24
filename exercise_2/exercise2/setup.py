#Use this to create database and table if it doesn't exist

import psycopg2

conn = psycopg2.connect(database="Tcount", user="postgres", password="pass", host="localhost", port="5432")

##create table
try:
    cur = conn.cursor()
    cur.execute("CREATE DATABASE Tcount")
    cur.close()
    conn.close()
except:
    print "Could not create Tcount"

#Create a Table                                                                 
#The first step is to create a cursor.                                          

cur = conn.cursor()
cur.execute('''CREATE TABLE Tweetwordcount                                      
       (word TEXT PRIMARY KEY     NOT NULL,                                     
       count INT     NOT NULL);''')
conn.commit()
conn.close()
