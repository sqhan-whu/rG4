macs2 callpeak -t ../lw-1a.sorted.bam -c ../normal_RNA.bam -f BAM -g hs -n 1a -B -q 0.01

#get submit ± 50 
for i in `ls *.bed`;do echo "awk '{print \$1,\$3-51,\$3+50}' |tr ' ' '\t' $i >$i.bestlocation" ;done

###get  strand ±
intersectBed -wo -a 2a_summits.bed.bestlocation -b ~/project/project/00.DATABASE/hg38/gencode.v31.annotation.gtf |awk -v OFS="\t" '{print $1,$2,$3,"*","*",$10}'|uniq > 2a.bed

##bed2fasta
for i in `ls`;do echo " fastaFromBed -s -fi ~/project/project/00.DATABASE/hg38/bowtie2_index/hg38.fa -bed $i -fo $i.fa";done

