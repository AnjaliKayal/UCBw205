Below are instructions on how to use this twitter application.

This twitter application pulls down tweets, parses them, and then counts the number of times individual words are used.  This can be used to understand what words are used most often. This will help you understand what things are being most talked about.

To use this twitter application begin by using the UCB w205 Exercise 2 image.  First run the shell_setup.sh. ( ./shell_setup.sh)  This will place the user in a python 2.7 environment that is compatible with the requirements for tweepy.

Next run setup.py to create the postgres database and table necessary to run the application.  To run this run the following:
python setup.py

Next change the directory to tweetcount and run sparse run:
cd tweetcount/
sparse run

This will run the twitter application.

In order to look at the results you can run either finalresults.py, histogram.py, or top20.py.  If you run finalresults.py without an argument it will return all of the words with the count number in alphabetical order.  If you run an argument with the finalresults.py then it will return the count of that word.  For example:
python finalresults.py
python finalresults.py yes

To run histogram.py you mush include two number arguments.  This will return all of the words with counts between the two arguments you entered.  You must enter the arguments in ascending order and in the following format x,y:
python histogram 3,4

Finally if you want the top20 words used enter the following:
python top20.py

These final python scripts will give you an understanding of what words are being used.  This ends the use of thetwitter application






