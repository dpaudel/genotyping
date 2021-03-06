#' geno_female function
#' 
#' This function allows to convert genotyping by sequencing data from A/T/G/C/Y/ll/lm... to nnxnp as required for Joinmap. Input file can be from Freebayes, GATK, GBS-SNP-CROP, Samtools, Stacks, & TASSEL.
#' @param filennxnp File with lmxll selected genotypes
#' @keywords GBS, Joinmap, genotyping by sequencing, linkage
#' @export
#' @examples geno_female(filelmxll)
#' geno_female()

geno_female<-function(sub){
  ro=nrow(sub)
  cl=ncol(sub)
  out<-matrix(0, nrow=ro, ncol=cl)
  for(i in 1:ro){
    for(j in 1:cl){
      if(as.character(sub[i,j])==as.character(sub$N122[[i]])){
        out[i,j]<-as.character("ll")
      } else if(as.character(sub[i,j])==as.character(sub$N190[[i]])){
        out[i,j]<-as.character("lm")
      } else 
        out[i,j]<-as.character("--")
    }
    print(c(i, j))
  }
  colnames(out)<-names(sub)
  rownames(out)<-rownames(sub)
  print(out)
}