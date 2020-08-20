##Rscript cal_G4.R sequence.fa

Args <- commandArgs()
file <- (Args[6])

counts_7 = rep(-1,50);counts_r1_7 = rep(-1,50);counts_r2_7 = rep(-1,50);counts_r3_7 = rep(-1,50)
counts_long = rep(-1,50);counts_r1_long = rep(-1,50);counts_r2_long = rep(-1,50);counts_r3_long = rep(-1,50)
counts_bulges = rep(-1,50);counts_r1_bulges = rep(-1,50);counts_r2_bulges = rep(-1,50);counts_r3_bulges = rep(-1,50)
counts_pqs = rep(-1,50);counts_r1_pqs = rep(-1,50);counts_r2_pqs = rep(-1,50);counts_r3_pqs = rep(-1,50)
counts_fraction = rep(-1,50);counts_r1_fraction = rep(-1,50);counts_r2_fraction = rep(-1,50);counts_r3_fraction = rep(-1,50)
counts_5 = rep(-1,50);counts_r1_5 = rep(-1,50);counts_r2_5 = rep(-1,50);counts_r3_5 = rep(-1,50)
counts_3 = rep(-1,50);counts_r1_3 = rep(-1,50);counts_r2_3 = rep(-1,50);counts_r3_3 = rep(-1,50)
counts_A = vector("list", 50);counts_r1_A = vector("list", 50);counts_r2_A = vector("list", 50);counts_r3_A = vector("list", 50)
counts_T = vector("list", 50);counts_r1_T = vector("list", 50);counts_r2_T = vector("list", 50);counts_r3_T = vector("list", 50)
counts_C = vector("list", 50);counts_r1_C = vector("list", 50);counts_r2_C = vector("list", 50);counts_r3_C = vector("list", 50)
counts_G = vector("list", 50);counts_r1_G = vector("list", 50);counts_r2_G = vector("list", 50);counts_r3_G = vector("list", 50)
counts_AT = vector("list", 50);counts_r1_AT = vector("list", 50);counts_r2_AT = vector("list", 50);counts_r3_AT = vector("list", 50)
counts_CG = vector("list", 50);counts_r1_CG = vector("list", 50);counts_r2_CG = vector("list", 50);counts_r3_CG = vector("list", 50)
counts_skewGC = vector("list", 50);counts_r1_skewGC = vector("list", 50);counts_r2_skewGC = vector("list", 50);counts_r3_skewGC = vector("list", 50)
counts_skewAT = vector("list", 50);counts_r1_skewAT = vector("list", 50);counts_r2_skewAT = vector("list", 50);counts_r3_skewAT = vector("list", 50)


file <- ('tmp.fa')

file_content <- read.table(file, stringsAsFactors=FALSE, sep='\t', header=FALSE)
file_seq <- file_content$V1[seq(2,length(file_content$V1),2)]

seq <- toupper(file_seq)

countsA = rep(0, length(seq));countsT = rep(0, length(seq));countsC = rep(0, length(seq));countsG = rep(0, length(seq))
countsAT = rep(0, length(seq));countsCG = rep(0, length(seq));skewGC = rep(0, length(seq));skewAT = rep(0, length(seq))
      
count_A7 = 0;count_C7 = 0;count_G7 = 0;count_T7 = 0;count7 = 0;count5 = 0;count3 = 0;countC7 = 0;count12 = 0;count21 = 0;count_GG = 0;count_GGATG_1 = 0;count_GGATG_2 = 0;count_GGATG_3 = 0;count_GGATG_4 = 0
count_GGATG_1_2 = 0;count_GGATG_1_3 = 0;count_GGATG_1_4 = 0;count_GGATG_2_3 = 0;count_GGATG_2_4 = 0;count_GGATG_3_4 = 0
count_GGATG_1_2_3 = 0;count_GGATG_1_2_4 = 0;count_GGATG_2_3_4 = 0;count_GGATG_1_3_4 = 0;
count_GGATG_1_1 = 0;count_GGATG_2_2 = 0;count_GGATG_3_3 = 0;count_GGATG_4_4 = 0
count_GGATG_1n_1n = 0;count_GGATG_2n_2n = 0;count_GGATG_3n_3n = 0;count_GGATG_4n_4n = 0;count_GGATG_1n_2n = 0;count_GGATG_1n_3n = 0;count_GGATG_1n_4n = 0;count_GGATG_2n_3n = 0;count_GGATG_2n_4n = 0;count_GGATG_3n_4n = 0;count_GGATG_1n_2n_3n = 0;count_GGATG_1n_3n_4n = 0;count_GGATG_1n_2n_4n = 0;count_GGATG_2n_3n_4n = 0;

inds_A7 = rep(1,0);inds_C7 = rep(1,0);inds_G7 = rep(1,0);inds_T7 = rep(1,0);inds_12 = rep(1,0);inds_7 = rep(1,0);inds_5 = rep(1,0);inds_3 = rep(1,0);inds_C7 = rep(1,0);inds_21 = rep(1,0);inds_GG = rep(1,0);inds_GGATG_1 = rep(1,0);inds_GGATG_2 = rep(1,0);inds_GGATG_3 = rep(1,0);inds_GGATG_4 = rep(1,0)
inds_GGATG_1_2 = rep(1,0);inds_GGATG_1_3 = rep(1,0);inds_GGATG_1_4 = rep(1,0);inds_GGATG_2_3 = rep(1,0);inds_GGATG_2_4 = rep(1,0);inds_GGATG_3_4 = rep(1,0)
inds_GGATG_1_2_3 = rep(1,0);inds_GGATG_1_2_4 = rep(1,0);inds_GGATG_2_3_4 = rep(1,0);inds_GGATG_1_3_4 = rep(1,0)
inds_GGATG_1_1 = rep(1,0);inds_GGATG_2_2 = rep(1,0); inds_GGATG_3_3 = rep(1,0); inds_GGATG_4_4 = rep(1,0);
inds_GGATG_1n_1n = rep(1,0);inds_GGATG_2n_2n = rep(1,0);inds_GGATG_3n_3n = rep(1,0);inds_GGATG_4n_4n = rep(1,0); inds_GGATG_1n_2n = rep(1,0);inds_GGATG_1n_3n = rep(1,0);inds_GGATG_1n_4n = rep(1,0);inds_GGATG_2n_3n = rep(1,0);inds_GGATG_2n_4n = rep(1,0);inds_GGATG_3n_4n = rep(1,0);inds_GGATG_1n_2n_3n = rep(1,0);inds_GGATG_1n_2n_4n = rep(1,0);inds_GGATG_1n_3n_4n = rep(1,0);inds_GGATG_2n_3n_4n = rep(1,0)

for (i in 1:length(seq))
{
	flag <- TRUE
	aseq <- seq[i]
	tmp <- strsplit(aseq,'')[[1]]
	len <- length(tmp)/100
	countsT[i] <- length(which(tmp == 'T'))/len
	countsA[i] <- length(which(tmp == 'A'))/len
	countsC[i] <- length(which(tmp == 'C'))/len
	countsG[i] <- length(which(tmp == 'G'))/len
	countsCG[i] <- (countsC[i] + countsG[i])/len
	countsAT[i] <- (countsA[i] + countsT[i])/len
	skewGC[i] <- (countsG[i] - countsC[i])/(countsG[i] + countsC[i])
	skewAT[i] <- (countsA[i] - countsT[i])/(countsA[i] + countsT[i])

#	if(i%%1000 == 0)
#		print(i)
	if (length(grep('A{7,}',aseq))>0) 
		{count_A7 = count_A7 + 1 ; inds_A7= c(inds_A7,i);}
	if (length(grep('T{7,}',aseq))>0) 
		{count_T7 = count_T7 + 1 ; inds_T7= c(inds_T7,i);}
	if (length(grep('C{7,}',aseq))>0) 
		{count_C7 = count_C7 + 1 ; inds_C7= c(inds_C7,i);}
	if (length(grep('G{7,}',aseq))>0) 
		{count_G7 = count_G7 + 1 ; inds_G7= c(inds_G7,i);}
	if (length(grep('(G{3,}[ATGC]{1,3}){3,}G{3,}',aseq))>0) 
		{count3 = count3 + 1 ; inds_3= c(inds_3,i); flag<-FALSE}
	if (length(grep('(G{3,}[ATGC]{1,5}){3,}G{3,}',aseq))>0) 
		{count5 = count5 + 1 ; inds_5= c(inds_5,i); flag<-FALSE}
	if (length(grep('(G{3,}[ATGC]{1,7}){3,}G{3,}',aseq))>0) 
		{count7 = count7 + 1 ; inds_7= c(inds_7,i); flag<-FALSE}
	if (length(grep('(C{3,}[ATGC]{1,7}){3,}C{3,}',aseq))>0) 
		{countC7 = countC7 + 1 ; inds_C7= c(inds_C7,i); }
	if (length(grep('(G{3,}[ATGC]{8,12}){3,}G{3,}',aseq))>0) 
		{count12 = count12 + 1 ; inds_12= c(inds_12,i); flag<-FALSE}
	if (length(grep('G{3,}[ATGC]{1,7}G{3,}[ATGC]{13,21}G{3,}[ATGC]{1,7}G{3,}',aseq))>0) 
		{count21 = count21 + 1 ; inds_21= c(inds_21,i); flag<-FALSE}

	if (flag)
	{
		if(length(grep('(G{2,}[ATC]{1,7}){3,}G{2,}',aseq))>0) {
			count_GG= count_GG+ 1; inds_GG = c(inds_GG,i) }
		if (length(grep('G{3,}[ATGC]{1,7}G{3,}[ATGC]{1,7}G{3,}[ATGC]{1,7}(GG[AT]{1,7}G|G[AT]{1,7}GG)',aseq))>0){
			count_GGATG_4 = count_GGATG_4 + 1    ; inds_GGATG_1 = c(inds_GGATG_1,i) }
		if (length(grep('G{3,}[ATGC]{1,7}G{3,}[ATGC]{1,7}(GG[AT]{1,7}G|G[AT]{1,7}GG)[ATGC]{1,7}G{3,}',aseq))>0){
			count_GGATG_3 = count_GGATG_3 + 1    ; inds_GGATG_2 = c(inds_GGATG_2,i) }
		if (length(grep('G{3,}[ATGC]{1,7}(GG[AT]{1,7}G|G[AT]{1,7}GG)[ATGC]{1,7}G{3,}[ATGC]{1,7}G{3,}',aseq))>0){
			count_GGATG_2 = count_GGATG_2 + 1    ; inds_GGATG_3 = c(inds_GGATG_3,i) }
		if (length(grep('(GG[AT]{1,7}G|G[AT]{1,7}GG)[ATGC]{1,7}G{3,}[ATGC]{1,7}G{3,}[ATGC]{1,7}G{3,}',aseq))>0) {
			count_GGATG_1 = count_GGATG_1 + 1; inds_GGATG_4 = c(inds_GGATG_4,i) }
		if (length(grep('(GG[AT]G|G[AT]GG)[ATGC]{1,7}(GG[AT]G|G[AT]GG)[ATGC]{1,7}G{3,}[ATGC]{1,7}G{3,}',aseq))>0) {
            count_GGATG_1_2 = count_GGATG_1_2 + 1; inds_GGATG_1_2 = c(inds_GGATG_1_2,i) }
        if (length(grep('(GG[AT]G|G[AT]GG)[ATGC]{1,7}G{3,}[ATGC]{1,7}(GG[AT]G|G[AT]GG)[ATGC]{1,7}G{3,}',aseq))>0) {
            count_GGATG_1_3 = count_GGATG_1_3 + 1; inds_GGATG_1_3= c(inds_GGATG_1_3,i) }
        if (length(grep('(GG[AT]G|G[AT]GG)[ATGC]{1,7}G{3,}[ATGC]{1,7}G{3,}[ATGC]{1,7}(GG[AT]G|G[AT]GG)',aseq))>0) {
            count_GGATG_1_4 = count_GGATG_1_4 + 1; inds_GGATG_1_4= c(inds_GGATG_1_4,i) }
        if (length(grep('G{3,}[ATGC]{1,7}(GG[AT]G|G[AT]GG)[ATGC]{1,7}(GG[AT]G|G[AT]GG)[ATGC]{1,7}G{3,}',aseq))>0){
            count_GGATG_2_3 = count_GGATG_2_3 + 1; inds_GGATG_2_3 = c(inds_GGATG_2_3 ,i) }
        if (length(grep('G{3,}[ATGC]{1,7}(GG[AT]G|G[AT]GG)[ATGC]{1,7}G{3,}[ATGC]{1,7}(GG[AT]G|G[AT]GG)',aseq))>0){
            count_GGATG_2_4 = count_GGATG_2_4 + 1; inds_GGATG_2_4 = c(inds_GGATG_2_4 ,i) }
        if (length(grep('G{3,}[ATGC]{1,7}G{3,}[ATGC]{1,7}(GG[AT]G|G[AT]GG)[ATGC]{1,7}(GG[AT]G|G[AT]GG)',aseq))>0) {
            count_GGATG_3_4 = count_GGATG_3_4 + 1; inds_GGATG_3_4 = c(inds_GGATG_3_4 ,i) }
        if (length(grep('(GG[AT]G|G[AT]GG)[ATGC]{1,7}(GG[AT]G|G[AT]GG)[ATGC]{1,7}(GG[AT]G|G[AT]GG)[ATGC]{1,7}G{3,}',aseq))>0) {
            count_GGATG_1_2_3 = count_GGATG_1_2_3 + 1; inds_GGATG_1_2_3 = c(inds_GGATG_1_2_3 ,i) }
        if (length(grep('(GG[AT]G|G[AT]GG)[ATGC]{1,7}(GG[AT]G|G[AT]GG)[ATGC]{1,7}G{3,}[ATGC]{1,7}(GG[AT]G|G[AT]GG)',aseq))>0) {
            count_GGATG_1_2_4 = count_GGATG_1_2_4 + 1; inds_GGATG_1_2_4 = c(inds_GGATG_1_2_4 ,i) }
        if (length(grep('(GG[AT]G|G[AT]GG)[ATGC]{1,7}G{3,}[ATGC]{1,7}(GG[AT]G|G[AT]GG)[ATGC]{1,7}(GG[AT]G|G[AT]GG)',aseq))>0) {
            count_GGATG_1_3_4 = count_GGATG_1_3_4 + 1; inds_GGATG_1_3_4 = c(inds_GGATG_1_3_4 ,i) }
        if (length(grep('G{3,}[ATGC]{1,7}(GG[AT]G|G[AT]GG)[ATGC]{1,7}(GG[AT]G|G[AT]GG)[ATGC]{1,7}(GG[AT]G|G[AT]GG)',aseq))>0) {
            count_GGATG_2_3_4 = count_GGATG_2_3_4 + 1; inds_GGATG_2_3_4 = c(inds_GGATG_2_3_4 ,i) }
        if (length(grep('(G[AT]G[AT]C)[ATGC]{1,7}G{3,}[ATGC]{1,7}G{3,}[ATGC]{1,7}G{3,}',aseq))>0) {
            count_GGATG_1_1 = count_GGATG_1_1 + 1; inds_GGATG_1_1 = c(inds_GGATG_1_1 ,i) }
        if (length(grep('G{3,}[ATGC]{1,7}(G[AT]G[AT]C)[ATGC]{1,7}G{3,}[ATGC]{1,7}G{3,}',aseq))>0) {
            count_GGATG_2_2 = count_GGATG_2_2 + 1; inds_GGATG_2_2 = c(inds_GGATG_2_2,i) }
        if (length(grep('G{3,}[ATGC]{1,7}G{3,}[ATGC]{1,7}(G[AT]G[AT]C)[ATGC]{1,7}G{3,}',aseq))>0) {
            count_GGATG_3_3 = count_GGATG_3_3 + 1; inds_GGATG_3_3 = c(inds_GGATG_3_3,i) }
        if (length(grep('G{3,}[ATGC]{1,7}G{3,}[ATGC]{1,7}G{3,}[ATGC]{1,7}(G[AT]G[AT]C)',aseq))>0) {
            count_GGATG_4_4 = count_GGATG_4_4 + 1; inds_GGATG_4_4 = c(inds_GGATG_4_4,i) }
        if (length(grep('(G[AT]{2,5}G[AT]{2,5}C)[ATGC]{1,7}G{3,}[ATGC]{1,7}G{3,}[ATGC]{1,7}G{3,}',aseq))>0) {
            count_GGATG_1n_1n = count_GGATG_1n_1n + 1; inds_GGATG_1n_1n = c(inds_GGATG_1n_1n,i) }
        if (length(grep('G{3,}[ATGC]{1,7}(G[AT]{2,5}G[AT]{2,5}C)[ATGC]{1,7}G{3,}[ATGC]{1,7}G{3,}',aseq))>0) {
            count_GGATG_2n_2n = count_GGATG_2n_2n + 1; inds_GGATG_2n_2n = c(inds_GGATG_2n_2n,i) }
        if (length(grep('G{3,}[ATGC]{1,7}G{3,}[ATGC]{1,7}(G[AT]{2,5}G[AT]{2,5}C)[ATGC]{1,7}G{3,}',aseq))>0) {
            count_GGATG_3n_3n = count_GGATG_3n_3n + 1; inds_GGATG_3n_3n = c(inds_GGATG_3n_3n,i) }
        if (length(grep('G{3,}[ATGC]{1,7}G{3,}[ATGC]{1,7}G{3,}[ATGC]{1,7}(G[AT]{2,5}G[AT]{2,5}C)',aseq))>0) {
            count_GGATG_4n_4n = count_GGATG_4n_4n + 1; inds_GGATG_4n_4n = c(inds_GGATG_4n_4n,i) }
        if (length(grep('(GG[AT]{2,5}G|G[AT]{2,5}GG)[ATGC]{1,7}(GG[AT]{2,5}G|G[AT]{2,5}GG)[ATGC]{1,7}G{3,}[ATGC]{1,7}G{3,}',aseq))>0) {
            count_GGATG_1n_2n = count_GGATG_1n_2n + 1; inds_GGATG_1n_2n = c(inds_GGATG_1n_2n,i) }
        if (length(grep('G{3,}[ATGC]{1,7}(GG[AT]{2,5}G|G[AT]{2,5}GG)[ATGC]{1,7}(GG[AT]{2,5}G|G[AT]{2,5}GG)[ATGC]{1,7}G{3,}',aseq))>0) {
            count_GGATG_2n_3n = count_GGATG_2n_3n + 1; inds_GGATG_2n_3n = c(inds_GGATG_2n_3n,i) }
        if (length(grep('(GG[AT]{2,5}G|G[AT]{2,5}GG)[ATGC]{1,7}G{3,}[ATGC]{1,7}(GG[AT]{2,5}G|G[AT]{2,5}GG)[ATGC]{1,7}G{3,}',aseq))>0) {
            count_GGATG_1n_3n = count_GGATG_1n_3n + 1; inds_GGATG_1n_3n = c(inds_GGATG_1n_3n,i) }
        if (length(grep('(GG[AT]{2,5}G|G[AT]{2,5}GG)[ATGC]{1,7}G{3,}[ATGC]{1,7}G{3,}[ATGC]{1,7}(GG[AT]{2,5}G|G[AT]{2,5}GG)',aseq))>0) {
            count_GGATG_1n_4n = count_GGATG_1n_4n + 1; inds_GGATG_1n_4n = c(inds_GGATG_1n_4n,i) }
        if (length(grep('G{3,}[ATGC]{1,7}(GG[AT]{2,5}G|G[AT]{2,5}GG)[ATGC]{1,7}G{3,}[ATGC]{1,7}(GG[AT]{2,5}G|G[AT]{2,5}GG)',aseq))>0) {
            count_GGATG_2n_4n = count_GGATG_2n_4n + 1; inds_GGATG_2n_4n = c(inds_GGATG_2n_4n,i) }
        if (length(grep('G{3,}[ATGC]{1,7}G{3,}[ATGC]{1,7}(GG[AT]{2,5}G|G[AT]{2,5}GG)[ATGC]{1,7}(GG[AT]{2,5}G|G[AT]{2,5}GG)',aseq))>0) {
            count_GGATG_3n_4n = count_GGATG_3n_4n + 1; inds_GGATG_3n_4n = c(inds_GGATG_3n_4n,i) }
        if (length(grep('G{3,}[ATGC]{1,7}(GG[AT]{2,5}G|G[AT]{2,5}GG)[ATGC]{1,7}G{3,}[ATGC]{1,7}(GG[AT]{2,5}G|G[AT]{2,5}GG)',aseq))>0) {
            count_GGATG_2n_4n = count_GGATG_2n_4n + 1; inds_GGATG_2n_4n = c(inds_GGATG_2n_4n,i) }
        if (length(grep('(GG[AT]{2,5}G|G[AT]{2,5}GG)[ATGC]{1,7}(GG[AT]{2,5}G|G[AT]{2,5}GG)[ATGC]{1,7}(GG[AT]{2,5}G|G[AT]{2,5}GG)[ATGC]{1,7}G{3,}',aseq))>0) {
            count_GGATG_1n_2n_3n = count_GGATG_1n_2n_3n + 1; inds_GGATG_1n_2n_3n = c(inds_GGATG_1n_2n_3n,i) }
        if (length(grep('(GG[AT]{2,5}G|G[AT]{2,5}GG)[ATGC]{1,7}(GG[AT]{2,5}G|G[AT]{2,5}GG)[ATGC]{1,7}G{3,}[ATGC]{1,7}(GG[AT]{2,5}G|G[AT]{2,5}GG)',aseq))>0) {
            count_GGATG_1n_2n_4n = count_GGATG_1n_2n_4n + 1; inds_GGATG_1n_2n_4n = c(inds_GGATG_1n_2n_4n,i) }
        if (length(grep('(GG[AT]{2,5}G|G[AT]{2,5}GG)[ATGC]{1,7}G{3,}[ATGC]{1,7}(GG[AT]{2,5}G|G[AT]{2,5}GG)[ATGC]{1,7}(GG[AT]{2,5}G|G[AT]{2,5}GG)',aseq))>0) {
            count_GGATG_1n_3n_4n = count_GGATG_1n_3n_4n + 1; inds_GGATG_1n_3n_4n = c(inds_GGATG_1n_3n_4n,i) }
        if (length(grep('G{3,}[ATGC]{1,7}(GG[AT]{2,5}G|G[AT]{2,5}GG)[ATGC]{1,7}(GG[AT]{2,5}G|G[AT]{2,5}GG)[ATGC]{1,7}(GG[AT]{2,5}G|G[AT]{2,5}GG)',aseq))>0) {
            count_GGATG_2n_3n_4n = count_GGATG_2n_3n_4n + 1; inds_GGATG_2n_3n_4n = c(inds_GGATG_2n_3n_4n,i) }
	}

}

#count_long <- length(unique(c(inds_12,inds_21, inds_7, inds_5, inds_3))) - length(unique(c(inds_7, inds_5, inds_3)))
#count_bulges <- length(unique(c(inds_GGATG_1, inds_GGATG_2, inds_GGATG_3, inds_GGATG_4, inds_GGATG_1_2, inds_GGATG_1_3, inds_GGATG_1_4, inds_GGATG_2_3, inds_GGATG_2_4, inds_GGATG_3_4, inds_GGATG_1_2_3, inds_GGATG_1_2_4, inds_GGATG_1_3_4, inds_GGATG_2_3_4, inds_GGATG_1n_1n, inds_GGATG_2n_2n, inds_GGATG_3n_3n, inds_GGATG_4n_4n, inds_GGATG_1n_2n, inds_GGATG_1n_3n, inds_GGATG_1n_4n, inds_GGATG_2n_3n, inds_GGATG_2n_4n, inds_GGATG_3n_4n, inds_GGATG_1n_2n_4n, inds_GGATG_1n_2n_3n, inds_GGATG_1n_3n_4n, inds_GGATG_2n_3n_4n)))
#
#counts_T <- countsT;counts_A <- countsA;counts_C <- countsC;counts_G <- countsG
#counts_CG <- countsCG;counts_AT <- countsAT;counts_skewGC <- skewGC;counts_skewAT <- skewAT
#lens <- length(seq)
#counts_7 = count7;counts_5 = count5;counts_3 = count3
#counts_long = count_long
#counts_bulges = count_bulges
#counts_pqs = count7 + count_long + count_bulges
#counts_fraction = (count7 + count_long + count_bulges) / length(seq)



inds_long <- unique(setdiff(c(inds_12,inds_21, inds_7, inds_5, inds_3), c(inds_7, inds_5, inds_3)))
inds_bulges <- unique(c(inds_GGATG_1, inds_GGATG_2, inds_GGATG_3, inds_GGATG_4, inds_GGATG_1_2, inds_GGATG_1_3, inds_GGATG_1_4, inds_GGATG_2_3, inds_GGATG_2_4, inds_GGATG_3_4, inds_GGATG_1_2_3, inds_GGATG_1_2_4, inds_GGATG_1_3_4, inds_GGATG_2_3_4, inds_GGATG_1n_1n, inds_GGATG_2n_2n, inds_GGATG_3n_3n, inds_GGATG_4n_4n, inds_GGATG_1n_2n, inds_GGATG_1n_3n, inds_GGATG_1n_4n, inds_GGATG_2n_3n, inds_GGATG_2n_4n, inds_GGATG_3n_4n, inds_GGATG_1n_2n_4n, inds_GGATG_1n_2n_3n, inds_GGATG_1n_3n_4n, inds_GGATG_2n_3n_4n))
inds_GG_pure <- setdiff(inds_GG,c(inds_long,inds_7))
inds_bulges <- setdiff(inds_bulges, inds_GG_pure)
inds_40 <- which(countsG >= 40)
inds_all <- unique(c(inds_long,inds_bulges, inds_GG, inds_7, inds_40))
inds_40_pure <- setdiff(inds_40,c(inds_GG,inds_long,inds_bulges, inds_7))
inds_all_not <- setdiff(1:length(seq), inds_all)

print(paste0("G3L1–7: ",length(inds_7)))
print(paste0("Long loops: ",length(inds_long)))
print(paste0('Bulges: ',length(inds_bulges)))
print(paste0("2 quartet: ",length(inds_GG_pure)))
print(paste0("G ≥ 40%: ",length(inds_40_pure)))
print(paste0("Others: ",length(inds_all_not)))
