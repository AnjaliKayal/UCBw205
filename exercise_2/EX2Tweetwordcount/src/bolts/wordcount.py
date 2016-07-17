from __future__ import absolute_import, print_function, unicode_literals

from collections import Counter
from streamparse.bolt import Bolt



class WordCounter(Bolt):

    def initialize(self, conf, ctx):
        self.counts = Counter()
        self.redis = StrictRedis()

    def process(self, tup):
        word = tup.values[0]

        # Write codes to increment the word count in Postgres
        # Use psycopg to interact with Postgres
        #Database name: Tcount
        #Table name: Tweetwordcount
        import psychopg2
        
        conn = psycopg2.connect("dbname=tcount user=postgres")

        cur = conn.cursor()
        
        cur.execute("CREATE TABLE tweetwordcount (id serial PRIMARY KEY, word varchar, count integer);")
        
        cur.execute("INSERT INTO testtweetwordcount (word, count) VALUES (%s, %s)", (word, self.counts[word]))

        # Increment the local count
        self.counts[word] += 1
        self.emit([word, self.counts[word]])

        # Log the count - just to see the topology running
        self.log('%s: %d' % (word, self.counts[word]))
