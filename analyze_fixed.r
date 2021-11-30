library(edgeR) 
infile <- 'mydata.tbl' 
group <- factor(c(1,1,1,2,2,2)) 
outfile <- 'myresult.out' 
x <- read.delim(infile, row.names=1) 
y <- DGEList(counts=x,group=group) 
keep <- rowSums(cpm(y)>=100)>=2 
y <- y[keep,] 
y <- calcNormFactors(y) 
y <- estimateDisp(y) 
et <- exactTest(y) 
tab <- topTags(et, nrow(x)) 
write.table(tab, file=outfile)