from __future__ import absolute_import, print_function, unicode_literals

from collections import Counter
from streamparse.bolt import Bolt



class WordCounter(Bolt):

    def initialize(self, conf, ctx):
        self.counts = Counter()


    def process(self, tup):
        word = tup.values[0]

        # Write codes to increment the word count in Postgres
        # Use psycopg to interact with Postgres
        # Database name: Tcount 
        # Table name: Tweetwordcount 
        # you need to create both the database and the table in advance.
        #import psycopg2 and connect to database
        import psycopg2
        conn = psycopg2.connect('dbname=tcount user=postgres password=pass')
        #can use the following if the above doesn't work
        #conn = psycopg2.connect(database="Tcount", user="postgres", password="pass", host="localhost", port="5432")

        cur = conn.cursor()

        #update word count in database
        #set uWord to word and uCount to count + 1
        uWord = word
        uCount = self.counts[word] + 1
        #insert word                                                            
        try:
            cur.execute("INSERT INTO Tweetwordcount (word,count) VALUES (%s, %s)", (uWord, 1));

        except:
            pass
        conn.commit()
        
        #update word count
        cur.execute("UPDATE Tweetwordcount SET count=%s WHERE word=%s", (uCount, uWord))
        
        conn.commit()
        cur.close()
        conn.close()

        # Increment the local count
        self.counts[word] += 1
        self.emit([word, self.counts[word]])

        # Log the count - just to see the topology running
        self.log('%s: %d' % (word, self.counts[word]))
