#input file
fin = open("hdl/table.bin", "rt")
#output file to write the result to
fout = open("out.txt", "wt")
#for each line in the input file
for line in fin:
	#read replace the string and write to output file
	fout.write(line.replace('.', '_'))
#close input and output files
fin.close()
fout.close()
