#!/usr/bin/python3

import numpy as np
import pandas as pd
import argparse
import sys



def extract_seqs(IDs, fasta, out, exclude=None):
	"""Extracts or excludes reads with identifier from a fasta file faster than seqkits grep module"""

	with open(IDs, "r") as f:
		ids = f.read().splitlines()
		

	with open(fasta,"r") as f:
		lines = f.readlines()
		all_ids = lines[::2]
		reads = lines[1::2]
		seqs = pd.DataFrame({"IDs":all_ids, "Seqs": reads})
		seqs["IDs"] = seqs["IDs"].str.strip(">\n")
		seqs["Seqs"] = seqs["Seqs"].str.strip("\n")
		all_ids = list(seqs["IDs"])
		
		
	if exclude==None:
		to_fasta = seqs[seqs["IDs"].isin(ids)]
	else:
		to_fasta = seqs[~seqs["IDs"].isin(ids)]

	with open(out,"w") as f:
		for i in range(0,len(to_fasta)):
			f.write(">"+to_fasta.iloc[i,0]+"\n"+ to_fasta.iloc[i,1]+"\n")
		
def main():

	parser = argparse.ArgumentParser()
	parser.add_argument("-IDs", help="File containing Read IDs", required=True)
	parser.add_argument("-fasta",help="Fasta file" ,required=True)
	parser.add_argument("-IDs2", help="Additional file containing IDs", required=False)
	parser.add_argument("-exclude", help="If you want to exclude reads ids", action='store_true',required=False)
	parser.add_argument("-out", help="Filename to write out fasta", required=True)
	args = parser.parse_args()
	
	if args.exclude:
		extract_seqs(args.IDs, args.fasta, args.out,exclude=True)
	else:
		extract_seqs(args.IDs, args.fasta, args.out)
if __name__ == "__main__":
	main()

