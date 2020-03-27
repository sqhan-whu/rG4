from os.path import basename
from sys import argv
import re

file_name = basename(argv[1]).split('_')[0]

def get_type(seq_name,seq_fa):

	countsG = round(seq_fa.count('G')/len(seq_fa),2)
	count3 = list(re.finditer('(G{3,}?[ATGC]{1,3}?){3,}?G{3,}?',seq_fa))
	count5 = list(re.finditer('(G{3,}?[ATGC]{1,5}?){3,}?G{3,}?',seq_fa))
	count7 = list(re.finditer('(G{3,}?[ATGC]{1,7}?){3,}?G{3,}?',seq_fa))
	count12 = list(re.finditer('(G{3,}?[ATGC]{1,12}?){3,}?G{3,}?',seq_fa))
	count21 = list(re.finditer('G{3,}?[ATGC]{1,7}?G{3,}?[ATGC]{13,21}G{3,}?[ATGC]{1,7}?G{3,}?',seq_fa))

	count_GGATG_4 =  list(re.finditer('G{3,}?[ATGC]{1,9}?G{3,}?[ATGC]{1,9}?G{3,}?[ATGC]{1,9}?(GG[AT]{1,9}?G|G[AT]{1,9}?GG)',seq_fa))
	count_GGATG_3 =  list(re.finditer('G{3,}?[ATGC]{1,9}?G{3,}?[ATGC]{1,9}?(GG[AT]{1,9}?G|G[AT]{1,9}?GG)[ATGC]{1,9}?G{3,}?',seq_fa))
	count_GGATG_2 =  list(re.finditer('G{3,}?[ATGC]{1,9}?(GG[AT]{1,9}?G|G[AT]{1,9}?GG)[ATGC]{1,9}?G{3,}?[ATGC]{1,9}?G{3,}?',seq_fa))
	count_GGATG_1 =  list(re.finditer('(GG[AT]{1,9}?G|G[AT]{1,9}?GG)[ATGC]{1,9}?G{3,}?[ATGC]{1,9}?G{3,}?[ATGC]{1,9}?G{3,}?',seq_fa))

	count_GGCG_4 =  list(re.finditer('G{3,}?[ATGC]{1,9}?G{3,}?[ATGC]{1,9}?G{3,}?[ATGC]{1,9}?(GG[C]{1,1}?G|G[C]{1,1}?GG)',seq_fa))
	count_GGCG_3 =  list(re.finditer('G{3,}?[ATGC]{1,9}?G{3,}?[ATGC]{1,9}?(GG[C]{1,1}?G|G[C]{1,1}?GG)[ATGC]{1,9}?G{3,}?',seq_fa))
	count_GGCG_2 =  list(re.finditer('G{3,}?[ATGC]{1,9}?(GG[C]{1,1}?G|G[C]{1,1}?GG)[ATGC]{1,9}?G{3,}?[ATGC]{1,9}?G{3,}?',seq_fa))
	count_GGCG_1 =  list(re.finditer('(GG[C]{1,1}?G|G[C]{1,1}?GG)[ATGC]{1,9}?G{3,}?[ATGC]{1,9}?G{3,}?[ATGC]{1,9}?G{3,}?',seq_fa))

	count_GGATG_1_2 = list(re.finditer('(GG[AT]G|G[AT]GG)[ATGC]{1,9}?(GG[AT]G|G[AT]GG)[ATGC]{1,9}?G{3,}?[ATGC]{1,9}?G{3,}?',seq_fa))
	count_GGATG_1_3 = list(re.finditer('(GG[AT]G|G[AT]GG)[ATGC]{1,9}?G{3,}?[ATGC]{1,9}?(GG[AT]G|G[AT]GG)[ATGC]{1,9}?G{3,}?',seq_fa))
	count_GGATG_1_4 = list(re.finditer('(GG[AT]G|G[AT]GG)[ATGC]{1,9}?G{3,}?[ATGC]{1,9}?G{3,}?[ATGC]{1,9}?(GG[AT]G|G[AT]GG)',seq_fa))

	count_GGATG_2_3 = list(re.finditer('G{3,}?[ATGC]{1,9}?(GG[AT]G|G[AT]GG)[ATGC]{1,9}?(GG[AT]G|G[AT]GG)[ATGC]{1,9}?G{3,}?',seq_fa))
	count_GGATG_2_4 = list(re.finditer('G{3,}?[ATGC]{1,9}?(GG[AT]G|G[AT]GG)[ATGC]{1,9}?G{3,}?[ATGC]{1,9}?(GG[AT]G|G[AT]GG)',seq_fa))
	
	count_GGATG_3_4 = list(re.finditer('G{3,}?[ATGC]{1,9}?G{3,}?[ATGC]{1,9}?(GG[AT]G|G[AT]GG)[ATGC]{1,9}?(GG[AT]G|G[AT]GG)',seq_fa))
	
	count_GGATG_1_2_3 = list(re.finditer('(GG[AT]G|G[AT]GG)[ATGC]{1,9}?(GG[AT]G|G[AT]GG)[ATGC]{1,9}?(GG[AT]G|G[AT]GG)[ATGC]{1,9}?G{3,}?',seq_fa))
	count_GGATG_1_2_4 = list(re.finditer('(GG[AT]G|G[AT]GG)[ATGC]{1,9}?(GG[AT]G|G[AT]GG)[ATGC]{1,9}?G{3,}?[ATGC]{1,9}?(GG[AT]G|G[AT]GG)',seq_fa))
	count_GGATG_1_3_4 = list(re.finditer('(GG[AT]G|G[AT]GG)[ATGC]{1,9}?G{3,}?[ATGC]{1,9}?(GG[AT]G|G[AT]GG)[ATGC]{1,9}?(GG[AT]G|G[AT]GG)',seq_fa))

	count_GGATG_2_3_4 = list(re.finditer('G{3,}?[ATGC]{1,9}?(GG[AT]G|G[AT]GG)[ATGC]{1,9}?(GG[AT]G|G[AT]GG)[ATGC]{1,9}?(GG[AT]G|G[AT]GG)',seq_fa))

	count_GGATG_1_1 = list(re.finditer('(G[ATC]G[ATC]G)[ATGC]{1,9}?G{3,}?[ATGC]{1,9}?G{3,}?[ATGC]{1,9}?G{3,}?',seq_fa))
	count_GGATG_2_2 = list(re.finditer('G{3,}?[ATGC]{1,9}?(G[ATC]G[ATC]G)[ATGC]{1,9}?G{3,}?[ATGC]{1,9}?G{3,}?',seq_fa))
	count_GGATG_3_3 = list(re.finditer('G{3,}?[ATGC]{1,9}?G{3,}?[ATGC]{1,9}?(G[ATC]G[ATC]G)[ATGC]{1,9}?G{3,}?',seq_fa))
	count_GGATG_4_4 = list(re.finditer('G{3,}?[ATGC]{1,9}?G{3,}?[ATGC]{1,9}?G{3,}?[ATGC]{1,9}?(G[ATC]G[ATC]G)',seq_fa))
	
	count_GGATG_1n_1n = list(re.finditer('(G[AT]{2,5}?G[AT]{2,5}?G)[ATGC]{1,7}?G{3,}?[ATGC]{1,7}?G{3,}?[ATGC]{1,7}?G{3,}?',seq_fa))
	count_GGATG_2n_2n = list(re.finditer('G{3,}?[ATGC]{1,7}?(G[AT]{2,5}?G[AT]{2,5}?G)[ATGC]{1,7}?G{3,}?[ATGC]{1,7}?G{3,}?',seq_fa))
	count_GGATG_3n_3n = list(re.finditer('G{3,}?[ATGC]{1,7}?G{3,}?[ATGC]{1,7}?(G[AT]{2,5}?G[AT]{2,5}?G)[ATGC]{1,7}?G{3,}?',seq_fa))
	count_GGATG_4n_4n = list(re.finditer('G{3,}?[ATGC]{1,7}?G{3,}?[ATGC]{1,7}?G{3,}?[ATGC]{1,7}?(G[AT]{2,5}?G[AT]{2,5}?G)',seq_fa))
	
	count_GGATG_1n_2n = list(re.finditer('(GG[AT]{2,5}?G|G[AT]{2,5}?GG)[ATGC]{1,7}?(GG[AT]{2,5}?G|G[AT]{2,5}?GG)[ATGC]{1,7}?G{3,}?[ATGC]{1,7}?G{3,}?',seq_fa))
	count_GGATG_1n_3n = list(re.finditer('(GG[AT]{2,5}?G|G[AT]{2,5}?GG)[ATGC]{1,7}?G{3,}?[ATGC]{1,7}?(GG[AT]{2,5}?G|G[AT]{2,5}?GG)[ATGC]{1,7}?G{3,}?',seq_fa))
	count_GGATG_1n_4n = list(re.finditer('(GG[AT]{2,5}?G|G[AT]{2,5}?GG)[ATGC]{1,7}?G{3,}?[ATGC]{1,7}?G{3,}?[ATGC]{1,7}?(GG[AT]{2,5}?G|G[AT]{2,5}?GG)',seq_fa))

	count_GGATG_2n_3n = list(re.finditer('G{3,}?[ATGC]{1,7}?(GG[AT]{2,5}?G|G[AT]{2,5}?GG)[ATGC]{1,7}?(GG[AT]{2,5}?G|G[AT]{2,5}?GG)[ATGC]{1,7}?G{3,}?',seq_fa))
	count_GGATG_2n_4n = list(re.finditer('G{3,}?[ATGC]{1,7}?(GG[AT]{2,5}?G|G[AT]{2,5}?GG)[ATGC]{1,7}?G{3,}?[ATGC]{1,7}?(GG[AT]{2,5}?G|G[AT]{2,5}?GG)',seq_fa))

	count_GGATG_3n_4n = list(re.finditer('G{3,}?[ATGC]{1,7}?G{3,}?[ATGC]{1,7}?(GG[AT]{2,5}?G|G[AT]{2,5}?GG)[ATGC]{1,7}?(GG[AT]{2,5}?G|G[AT]{2,5}?GG)',seq_fa))

	count_GGATG_1n_2n_3n = list(re.finditer('(GG[AT]{2,5}?G|G[AT]{2,5}?GG)[ATGC]{1,7}?(GG[AT]{2,5}?G|G[AT]{2,5}?GG)[ATGC]{1,7}?(GG[AT]{2,5}?G|G[AT]{2,5}?GG)[ATGC]{1,7}?G{3,}?',seq_fa))
	count_GGATG_1n_2n_4n = list(re.finditer('(GG[AT]{2,5}?G|G[AT]{2,5}?GG)[ATGC]{1,7}?(GG[AT]{2,5}?G|G[AT]{2,5}?GG)[ATGC]{1,7}?G{3,}?[ATGC]{1,7}?(GG[AT]{2,5}?G|G[AT]{2,5}?GG)',seq_fa))
	count_GGATG_1n_3n_4n = list(re.finditer('(GG[AT]{2,5}?G|G[AT]{2,5}?GG)[ATGC]{1,7}?G{3,}?[ATGC]{1,7}?(GG[AT]{2,5}?G|G[AT]{2,5}?GG)[ATGC]{1,7}?(GG[AT]{2,5}?G|G[AT]{2,5}?GG)',seq_fa))
	count_GGATG_2n_3n_4n = list(re.finditer('G{3,}?[ATGC]{1,7}?(GG[AT]{2,5}?G|G[AT]{2,5}?GG)[ATGC]{1,7}?(GG[AT]{2,5}?G|G[AT]{2,5}?GG)[ATGC]{1,7}?(GG[AT]{2,5}?G|G[AT]{2,5}?GG)',seq_fa))
	
	count_GG = list(re.finditer('(G{2,}?[ATGC]{1,9}?){3,}?G{2,}?',seq_fa))
	
	c7=[]
	c12=[]
	c21=[]
	for i in count7:
		c7.append((str(i.group())))
	for i in count12:
		c12.append((str(i.group())))
	for i in count21:
		c21.append((str(i.group())))

	inds_7 = c7

	c_long = c12 + c21


	inds_long = list(set(c_long).difference(set(c7)))

	c_bulges = []
	bulges = count_GGCG_4+count_GGCG_3+count_GGCG_2+count_GGCG_1+count_GGATG_4+count_GGATG_3+count_GGATG_2+count_GGATG_1+count_GGATG_4+count_GGATG_3+count_GGATG_2+count_GGATG_1+count_GGATG_1_2+count_GGATG_1_3+count_GGATG_1_4+count_GGATG_2_3+count_GGATG_2_4+count_GGATG_3_4+count_GGATG_1_2_3+count_GGATG_1_2_4+count_GGATG_1_3_4+count_GGATG_2_3_4+count_GGATG_1_1+count_GGATG_2_2+count_GGATG_3_3+count_GGATG_4_4+count_GGATG_1n_1n+count_GGATG_2n_2n+count_GGATG_3n_3n+count_GGATG_4n_4n+count_GGATG_1n_2n+count_GGATG_2n_3n+count_GGATG_1n_3n+count_GGATG_1n_4n+count_GGATG_2n_4n+count_GGATG_3n_4n+count_GGATG_2n_4n+count_GGATG_1n_2n_3n+count_GGATG_1n_2n_4n+count_GGATG_1n_3n_4n+count_GGATG_2n_3n_4n
	for i in bulges:
		c_bulges.append((str(i.group())))

	inds_bulges = set(c_bulges)

	c_GG_pure = []
	for i in count_GG:
		c_GG_pure.append((str(i.group())))

	inds_GG_pure = list(set(c_GG_pure).difference(set(c7),set(inds_long)))

	inds_bulges = list(set(inds_bulges).difference(inds_GG_pure))
	inds_40 = 0
	inds_all_not = 0
	if inds_GG_pure ==[] and inds_bulges==[] and inds_long==[] and inds_7 ==[]:
		if countsG >=0.4:
			inds_40 +=1
		else:
			inds_all_not += 1

	return len(inds_7), len(inds_long), len(inds_bulges), len(inds_GG_pure), inds_40, inds_all_not

Slen_inds_7, Slen_inds_long, Slen_inds_bulges, Slen_inds_GG_pure, Slen_inds_40, Slen_inds_all_not = 0,0,0,0,0,0

with open(argv[1]) as f:
	while True:
		try:
			seq_name = next(f)
			seq_fa = next(f)
			len_inds_7, len_inds_long, len_inds_bulges, len_inds_GG_pure, len_inds_40, len_inds_all_not = get_type(seq_name,seq_fa)

			Slen_inds_7 += len_inds_7
			Slen_inds_long += len_inds_long
			Slen_inds_bulges += len_inds_bulges
			Slen_inds_GG_pure += len_inds_GG_pure
			Slen_inds_40 += len_inds_40
			Slen_inds_all_not +=len_inds_all_not

		except StopIteration:
			break	
#print (len_inds_7, len_inds_long, len_inds_bulges, len_inds_GG_pure, len_inds_40, len_inds_all_not)
print (f"G3L1-7: {Slen_inds_7}")
print (f"Long loops: {Slen_inds_long}")
print (f"Bulges: {Slen_inds_bulges}")
print (f"2 quartet: {Slen_inds_GG_pure}")
print (f"G >=40%: {Slen_inds_40}")
print (f"Other: {Slen_inds_all_not}")

