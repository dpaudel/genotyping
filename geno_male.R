#' geno_male function
#' 
#' This function allows to convert genotyping by sequencing data from A/T/G/C/Y/nn/np... to nnxnp as required for Joinmap. Input file can be from Freebayes, GATK, GBS-SNP-CROP, Samtools, Stacks, & TASSEL.
#' @param filennxnp File with nnxnp selected genotypes
#' @keywords GBS, Joinmap, genotyping by sequencing, linkage
#' @export
#' @examples geno_male(filennxnp)
#' geno_male()
geno_male<-function(sub){
  ro=nrow(sub)
  cl=ncol(sub)
  sub[is.na(sub)]<- "N"
  out<-matrix(0,nrow=ro, ncol=cl)
  for (i in 1:ro){
    for (j in 1:cl){
      if (as.character(sub[i,j])==as.character(sub$N190[[i]])) {
        out[i,j]<- as.character("nn")
      }else if (as.character(sub[i,j])==as.character(sub$N122[[i]])) {
        out[i,j]<- as.character("np")
      }else
        out[i,j]<- as.character("--")
    }
  }
  colnames(out)<-names(sub)
  rownames(out)<-rownames(sub)
  print(out)
}