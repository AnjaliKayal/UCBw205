import xlrd

import sys

import csv



try:

    xls_file = sys.argv[1]

    sheet_name = sys.argv[2]

    csv_name = sys.argv[3]



    workbook = xlrd.open_workbook(xls_file)

    worksheet = workbook.sheet_by_name(sheet_name)

    csvfile = open(csv_name, 'wb')

    wr = csv.writer(csvfile, quoting=csv.QUOTE_ALL)



    for rownum in xrange(worksheet.nrows):

         wr.writerow(worksheet.row_values(rownum))



    csvfile.close()



except:

    print "didn't work"
