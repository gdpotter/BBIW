import json
import re

json_suffix = '.json'
dir = 'clean/'
files = ['crime', 'defense', 'energy', 'environment', 'health', 'transport']

for f in files:
	fp = open(f+json_suffix)
	j = json.load(fp)
	fp.close()
	
	ofp = open(dir + f + '_clean' + json_suffix, 'w')
	for i, o in enumerate(j):
		o[u'category'] = list(set(o[u'category'])) #remove any duplicate categories
		o[u'category'] = filter(lambda c: re.match('\d', c) != -1, o[u'category']) #remove any categories containing a digit
		o[u'category'] = filter(lambda c: c.find('and') == -1, o[u'category']) #remove any categories containing 'and'
		o[u'category'] = filter(lambda c: c.find('13.') == -1, o[u'category']) #remove any categories containing '13.' (real hacky)
		print o
		
	json.dump(j, ofp)
	ofp.close()
