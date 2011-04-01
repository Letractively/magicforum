import sys

print 'data:text/html;base64,'+open(sys.argv[1]).read().encode('base64')
